package com.xiaoyi.manager.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.exception.CommonRunException;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.Level;
import com.xiaoyi.common.utils.ConstantUtil.Semaster;
import com.xiaoyi.common.utils.XiaoeSDK;
import com.xiaoyi.custom.dao.IDaulVideoOrderDao;
import com.xiaoyi.custom.domain.DaulVideoOrder;
import com.xiaoyi.manager.dao.ILessonTypeDao;
import com.xiaoyi.manager.dao.IOTRelationDao;
import com.xiaoyi.manager.dao.IOrderSumDao;
import com.xiaoyi.manager.dao.IOrdersDao;
import com.xiaoyi.manager.dao.ITeacherLesRelationDao;
import com.xiaoyi.manager.dao.IUserOuterSyncDao;
import com.xiaoyi.manager.dao.IVideoCourseDao;
import com.xiaoyi.manager.dao.order.IOrderManageDao;
import com.xiaoyi.manager.domain.LessonType;
import com.xiaoyi.manager.domain.LessonTypeKey;
import com.xiaoyi.manager.domain.OrderSum;
import com.xiaoyi.manager.domain.OrderSumKey;
import com.xiaoyi.manager.domain.OrderTeachingRelation;
import com.xiaoyi.manager.domain.Orders;
import com.xiaoyi.manager.domain.ParentStuRelation;
import com.xiaoyi.manager.domain.TeacherLesRelationKey;
import com.xiaoyi.manager.domain.VideoCourse;
import com.xiaoyi.manager.service.ICommonService;
import com.xiaoyi.manager.service.IOrderService;
import com.xiaoyi.teacher.dao.ITeachingDaulOrderDao;
import com.xiaoyi.teacher.domain.TeachingDaulOrder;
import com.xiaoyi.wechat.utils.WeiXinConfig;

@Service("orderService")
public class OrderServiceImpl implements IOrderService {
	@Resource  
    private IOrdersDao orderDao;  
	
	@Resource
	private IOrderSumDao orderSumDao;
	
	@Resource
	private ICommonService commonService;
	
	@Resource
	private IOrderManageDao orderManageDao;

	@Resource
	private IOTRelationDao otRelationDao;
	
	@Resource
	private ITeacherLesRelationDao tlRelationDao;
	
	@Resource 
	ILessonTypeDao lessonTypeDao;
	
	@Resource
	IUserOuterSyncDao userSyncDao;
	
	@Resource
	IVideoCourseDao videoCourseDao;
	
	@Resource
	IDaulVideoOrderDao daulOrderDao;
	
	@Resource
	ITeachingDaulOrderDao teachingDaulOrderDao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//下单进程
	ExecutorService excutors = Executors.newFixedThreadPool(2);
	
	@Transactional
	@Override
	public int addOrder(JSONObject params) throws Exception{
		// 预约默认不安排老师
		try {			
			//查询/生成家长ID、学生Id
			String parentId = null;
			String studentId = null;			
			String openId = params.getString("openId");
			String phone = params.getString("telNum");
			
			//新增/获取家长-学生关系信息
			try {
				JSONObject relations = commonService.addOrGetPSR(params);
				if(null==relations){
					return -1;
				}
				
				ParentStuRelation relation = (ParentStuRelation) relations.get("relation");
				studentId = relation.getMemberid();
				parentId = relation.getParentid();
			} catch (Exception e) {
				logger.error("添加/获取家长-学生关系失败！");
				throw e;
			}
			
			//订单更新同步
			synchronized(this){
				//查询订单总表
				Integer lessonType = params.getInteger("lessonType");
				Short teachingWay = params.getShort("teachingWay");
				
				//转换双师任教类型
				Short daulTeachingWay = 
						(teachingWay==4) ? 3 : teachingWay;
				
				//普通订单（非同步视频课程订单）
				if(teachingWay != 5){	
					String orderSumId = null;
					OrderSum orderSum = null;
					try {
						OrderSumKey orderSumKey = new OrderSumKey();
						//只存年级和上门类型
						orderSumKey.setLessontype(lessonType);
						orderSumKey.setTeachingWay(daulTeachingWay);
						orderSumKey.setMemberid(studentId);
						orderSumKey.setParentid(parentId);
						
						orderSum = orderSumDao.selectByPrimaryKey(orderSumKey);
					} catch (Exception e) {
						logger.info("查询订单总表出错！");
						throw e;
					}
					
					//添加订单条目
					Float purchaseNum = params.getFloat("purchaseNum")==null?
							0:params.getFloat("purchaseNum");	
					Short hasBook = params.getShort("hasBook");
					
					Orders order = new Orders();				
					try {
						String orderId = params.getString("nonce_str");
						if(StringUtils.isEmpty(orderId)){
							orderId = UUID.randomUUID().toString();
						}					
						order.setOrderid(orderId);
					
						order.setCreatetime(new Date());
						order.setLessontype(lessonType);
						order.setMemberid(studentId);
						order.setParentid(parentId);
						order.setPurchasenum(purchaseNum);				
						order.setHasBook(hasBook);
						order.setOrderType(params.getInteger("orderType"));
						
						//=================== 2018-10-10 added (daul teacher version)==============
						order.setTeachingWay(teachingWay);
						
						//=================== 2018-04-25 added ==============
						//补充订单付款详细信息
						try {
							LessonTypeKey key = new LessonTypeKey();
							key.setCoursecnt(purchaseNum.shortValue());
							key.setLessontype(lessonType);
							key.setTeachingWay(teachingWay);
							
							LessonType lesson = lessonTypeDao.selectByPrimaryKey(key);
						
							if(null!=lesson){
								float actualPay = lesson.getDiscountprice();
								if(hasBook == 1){
									actualPay += 50 ;
								}							
								order.setActualPay(actualPay);
								order.setOrderStatus(null);
								order.setSingleLessonPrice(lesson.getSinglecourseprice());
								order.setTotalLessonPrice(lesson.getLessonprice());
							}
						} catch (Exception e) {
							logger.info("查询购买课程类型出错！");
							e.printStackTrace();
						}					
						//========================= end =====================
						
						orderDao.insertSelective(order);
					} catch (Exception e) {
						logger.info("插入订单失败！");
						throw e;
					}
					
					//更新订单总表				
					//if(5!=teachingWay){	//剔除双师视频课程
					try {
						boolean isNewOrder = false;
						//第一次插入订单总表(取该家长-学生-课程类型一致的订单ID作为订单总表ID)
						if(null == orderSum){
							orderSum = new OrderSum();
							orderSumId = order.getOrderid();
							isNewOrder = true;
						}
						orderSum.setOrderid(orderSumId);
						orderSum.setMemberid(studentId);
						orderSum.setParentid(parentId);
						orderSum.setPurchasetime(new Date());
						orderSum.setLessontype(lessonType);
						orderSum.setLessonleftnum(isNewOrder?purchaseNum:(orderSum.getLessonleftnum()+purchaseNum));
						orderSum.setTotallessonnum(isNewOrder?purchaseNum:(orderSum.getTotallessonnum()+purchaseNum));
						orderSum.setTeachingWay(daulTeachingWay);
						
						if(isNewOrder){
							orderSumDao.insertSelective(orderSum);
						} else{
							orderSumDao.updateByPrimaryKeySelective(orderSum);
						}
					
					} catch (Exception e) {
						logger.error("插入/更新订单总表出错！");
						throw new CommonRunException(-1, "插入/更新订单总表出错！");
					}
				}
				
				//双师视频课程 & 双师课堂（增加用户同步课堂观看权限）
				if(3==teachingWay || teachingWay==5){
					Integer payFrom = params.getInteger("payFrom");	//payFrom:{0:小鹅通-》本地，1：本地-》小鹅通}
					if(null!=payFrom && payFrom==0){
						logger.info("衡阳促销活动不支持...");
						/*addLocalDaulOrder(params, teachingWay, openId, params.getString("nonce_str"), 
								parentId, studentId, phone, lessonType);*/
					}else{					
						logger.info("开始购买双师课堂");
						addDaulOrder(teachingWay, openId, params.getString("nonce_str"), parentId, studentId, phone, lessonType);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonRunException(-1,"生成订单失败！");
		}
		
		return 0;
	}

	/**
	 * 反向同步小鹅通订单
	 * @param teachingWay
	 * @param openId
	 * @param daulOrderId
	 * @param parentId
	 * @param studentId
	 * @param phone
	 * @param lessonType
	 * @return
	 */
	/*private int addLocalDaulOrder(JSONObject params, int teachingWay, String openId, String daulOrderId,
			String parentId, String studentId, String phone, Integer lessonType){
		int result = 0;
		
		try {

			//同步家长信息
			UserOuterSync userOuterSync = null;
			try {
				logger.info("根据union_id:{}查询本地同步用户表..." + parentId);
				UserOuterSyncKey key = new UserOuterSyncKey();
				key.setParentId(parentId);
				//key.setWxUnionId(parentId);
				userOuterSync = userSyncDao.selectByPrimaryKey(key);
				
				if(null==userOuterSync){
					userOuterSync = new UserOuterSync();													
				}
				//回写本地用户同步表
				logger.info("回写本地用户同步表...");

				userOuterSync.setParentId(parentId);
				
				if(null == params.getString("wx_union_id")){
					logger.info("调用微信接口获取access_token...");
					StringBuffer getTockenBuffer = new StringBuffer();
					getTockenBuffer
						.append("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential")
						.append("&appid=").append(WeiXinConfig.APPID)
						.append("&secret=").append(WeiXinConfig.SECRET);
					String getTockenUrl = getTockenBuffer.toString();
					String tokenResult = HttpClient.httpGetRequest(getTockenUrl);
					logger.info("获取access_token结果：" + tokenResult);
					
					JSONObject jsonResult = JSONObject.parseObject(tokenResult);
					String token = jsonResult.getString("access_token");
					
					//获取union_id
					logger.info("调用微信接口获取union_id...");
					StringBuffer getUnionIdBuffer = new StringBuffer();
					getUnionIdBuffer.append("https://api.weixin.qq.com/cgi-bin/user/info")
						.append("?access_token=").append(token)
						.append("&openid=").append(openId)
						.append("&lang=zh_CN");
					String getUnionIdUrl = getUnionIdBuffer.toString();
					String rs = HttpClient.httpGetRequest(getUnionIdUrl);
					rs = new String(rs.getBytes("ISO-8859-1"),"UTF-8");
					logger.info("返回union_id结果：" + rs);
					
					JSONObject unionIdResult = JSONObject.parseObject(rs);
					String wxUnionId = unionIdResult.getString("unionid");
					params.put("wx_union_id", wxUnionId);
				}
				
				userOuterSync.setWxUnionId(params.getString("wx_union_id"));
				userOuterSync.setWxOpenId(openId);
				userOuterSync.setAvatar(params.getString("avatar"));
				userOuterSync.setNickname(params.getString("parentName"));
				userOuterSync.setPhone(phone);	
				userOuterSync.setCreateTime(new Date());
				userOuterSync.setUpdateTime(new Date());
				userOuterSync.setUserId(params.getString("user_id"));
				try {										
					userSyncDao.insertSelective(userOuterSync);								
				} catch (Exception e) {
					logger.warn("同步用户信息表出错（写入小鹅通user_id）！");
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonRunException(-1, "同步家长信息出错！");
			}
			
			//同步系统和小鹅通订单
			int gradeId = lessonType/10;
			//获取当前月份 -》计算当前学期（3-9：下，9-3：上）
			Calendar cal = Calendar.getInstance();
			Integer month = cal.get(Calendar.MONTH) + 1;
			int semaster = (month+3)%12>=6?2:1;
			
			//查询同步 课堂信息
			JSONObject queryParams = new JSONObject();
			queryParams.put("gradeId", gradeId);	//年级
			queryParams.put("videoCourseType", "1");	//同步课程
			queryParams.put("courseId", "0");	//大专栏（学年学期）
			
			//高中阶段购买不赠送延伸学期
			if(gradeId>30 || semaster==2){
				queryParams.put("semaster", semaster);	//学期			
			}
			//同步家长订单
			List<VideoCourse> videoCourseList = null;
			try {
				videoCourseList = 
						videoCourseDao.selectVideoCourseListByConditions(queryParams);							
				
				if(semaster==2 && gradeId<30){ 	//初中阶段额外赠送延伸下班学期视频课程
					//赠送下个年级的上半学期视频课程
					int stage = gradeId/10;	//小初高 
					int gradeLevel = gradeId%10;	//1-6
					if(stage==1){
						if(gradeLevel==6){
							stage++;
						}
					}else if(gradeLevel==3){
						stage++;
					}
					if(stage != gradeId/10){	//已升级年级
						gradeLevel = 1;
					}else {
						gradeLevel++;
					}
					StringBuffer newGradeId = new StringBuffer();
					newGradeId.append(stage).append(gradeLevel);
					
					queryParams.put("gradeId", newGradeId.toString());
					queryParams.put("semaster", 1);						
					
					List<VideoCourse> extraVideoCourseList = 
							videoCourseDao.selectVideoCourseListByConditions(queryParams);	
					if(!CollectionUtils.isEmpty(extraVideoCourseList) && videoCourseList!=null){
						videoCourseList.addAll(extraVideoCourseList);
					}
				}
				if(CollectionUtils.isEmpty(videoCourseList)){
					logger.warn("本地课程列表中没有查到对应的课时包,年级: " + gradeId +"videoCourseType: 1");
					return 0;
				}
			} catch (Exception e) {
				logger.error("查询视频课程失败！");
				e.printStackTrace();
				throw new CommonRunException(-1,"查询视频课程失败！");
			}
			
			//查询
			List<String> resourceIdList = new ArrayList<String>();
			List<DaulVideoOrder> recordList = new ArrayList<DaulVideoOrder>();
			for(VideoCourse videoCourse : videoCourseList){
				DaulVideoOrder videoOrder = new DaulVideoOrder();
				//String daulOrderId = UUID.randomUUID().toString();
				
				videoOrder.setCreateTime(new Date());
				videoOrder.setDaulOrderId(daulOrderId);
				videoOrder.setGradeId((short)gradeId);
				videoOrder.setParentId(parentId);
				videoOrder.setStudentId(studentId);
				videoOrder.setSemaster((short)videoCourse.getSemaster());
				videoOrder.setVideoCourseType((short)1);
				videoOrder.setVideoCourseId(videoCourse.getVideoCourseId());
				
				recordList.add(videoOrder);
				resourceIdList.add(videoCourse.getVideoCourseId());								
			}
			
			//本地下单（同步视频课程订单入库）
			try {
				logger.info("本地下单（同步视频课程订单入库）...");
				result = daulOrderDao.insertDaulOrderList(recordList);							
			} catch (Exception e) {
				logger.error("同步视频课程订单入库失败！");
				e.printStackTrace();
				throw new CommonRunException(-1,"同步视频课程订单入库失败！");
			}

		} catch (Exception e) {
			logger.error("同步双师课程订单出错！");
			throw new CommonRunException(-1,"同步双师课程订单出错！");
		}		
		
		return result;
	}*/
	
	
	/**
	 * 增加双师同步视频课程（正向：从本地-》小鹅通）
	 * @param teachingWay
	 * @param openId
	 * @param parentId
	 * @param studentId
	 * @param phone
	 * @param lessonType
	 * @return
	 */
	private int addDaulOrder(int teachingWay, String openId, String daulOrderId,
			String parentId, String studentId, String phone, Integer lessonType){
		int result = 0;
		
		//双师视频课程 & 双师课堂（增加用户同步课堂观看权限）
		logger.info("当前购买课时包类型：" + teachingWay);
		//if(teachingWay==31 || teachingWay == 3){
		try {
			//同步用户
			//获取access_token
			/*logger.info("调用微信接口获取access_token...");
			StringBuffer getTockenBuffer = new StringBuffer();
			getTockenBuffer
				.append("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential")
				.append("&appid=").append(WeiXinConfig.APPID)
				.append("&secret=").append(WeiXinConfig.SECRET);
			String getTockenUrl = getTockenBuffer.toString();
			String tokenResult = HttpClient.httpGetRequest(getTockenUrl);
			logger.info("获取access_token结果：" + tokenResult);
			
			JSONObject jsonResult = JSONObject.parseObject(tokenResult);
			String token = jsonResult.getString("access_token");
			
			//获取union_id
			logger.info("调用微信接口获取union_id...");
			StringBuffer getUnionIdBuffer = new StringBuffer();
			getUnionIdBuffer.append("https://api.weixin.qq.com/cgi-bin/user/info")
				.append("?access_token=").append(token)
				.append("&openid=").append(openId)
				.append("&lang=zh_CN");
			String getUnionIdUrl = getUnionIdBuffer.toString();
			String rs = HttpClient.httpGetRequest(getUnionIdUrl);
			rs = new String(rs.getBytes("ISO-8859-1"),"UTF-8");
			logger.info("返回union_id结果：" + rs);
			
			JSONObject unionIdResult = JSONObject.parseObject(rs);
			String wxUnionId = unionIdResult.getString("unionid");
			String avatar = unionIdResult.getString("headimgurl");
			String nickname = unionIdResult.getString("nickname");
			
			//判断是否已同步此家长信息
			logger.info("根据union_id:{}查询本地同步用户表..." + wxUnionId);
			UserOuterSyncKey key = new UserOuterSyncKey();
			//key.setParentId(parentId);
			key.setWxUnionId(wxUnionId);
			UserOuterSync userOuterSync = userSyncDao.selectByPrimaryKey(key);
			
			if(null==userOuterSync){
				userOuterSync = new UserOuterSync();													
			}
			
			//没有同步用户（调用小鹅通SDK创建用户 & 同步回本地）
			XiaoeSDK sdk  = 
					new XiaoeSDK(WeiXinConfig.XIAO_E_TONG_APPID, WeiXinConfig.XIAO_E_TONG_APPSECRET); 
			if(StringUtils.isEmpty(userOuterSync.getUserId())){
				logger.info("调用小鹅通SDK注册用户...");
				org.json.JSONObject data = new org.json.JSONObject();
				data.put("phone", phone);	
				data.put("nick_name", nickname);
				data.put("country", unionIdResult.get("country"));
				data.put("province", unionIdResult.get("province"));
				data.put("city", unionIdResult.get("city"));
				data.put("language", unionIdResult.get("language"));
				data.put("user_tag", "parent");
				data.put("gender", unionIdResult.get("sex"));
				data.put("wx_union_id", wxUnionId);
				org.json.JSONObject regResult = sdk.send("users.register", data, 1, "1.0");
				logger.info("注册返回结果：" + regResult);
				
				if(null!=regResult){
					String userId = "";
					if(regResult.getInt("code")!=0){ 	//用户已占用
						//调用小鹅通SDK 获取用户user_id
						org.json.JSONObject userParams = new org.json.JSONObject();						
						userParams.put("wx_union_id", wxUnionId);
						logger.info("调用小鹅通SDK 获取用户user_id...");
						org.json.JSONObject getUserInfo = 
								sdk.send("users.getinfo", userParams, 1, "1.0");
						logger.info("调用小鹅通SDK获取用户结果：" + getUserInfo);
						
						org.json.JSONArray userData = getUserInfo.getJSONArray("data");
						if(null!=userData && userData.length()>0){				
							userId = userData.getJSONObject(0).getString("user_id");												
						}
					}else{
						org.json.JSONObject user_data = regResult.getJSONObject("data");
						if(null!=user_data){
							userId = user_data.getString("user_id");
						}
					}
					
					//回写本地用户同步表
					logger.info("回写本地用户同步表...");

					userOuterSync.setParentId(parentId);
					userOuterSync.setWxUnionId(wxUnionId);
					userOuterSync.setWxOpenId(openId);
					userOuterSync.setAvatar(avatar);
					userOuterSync.setNickname(nickname);
					userOuterSync.setPhone(phone);	
					userOuterSync.setCreateTime(new Date());
					userOuterSync.setUpdateTime(new Date());
					userOuterSync.setUserId(userId);
					try {										
						userSyncDao.insertSelective(userOuterSync);								
					} catch (Exception e) {
						logger.warn("同步用户信息表出错（写入小鹅通user_id）！");
					}
				}														
			}*/
			
			//同步系统和小鹅通订单
			int gradeId = lessonType/10;
			//获取当前月份 -》计算当前学期（3-9：下，9-3：上）
			Calendar cal = Calendar.getInstance();
			Integer month = cal.get(Calendar.MONTH) + 1;
			int semaster = (month+3)%12>=6?2:1;
			
			//查询同步 课堂信息
			JSONObject queryParams = new JSONObject();
			queryParams.put("gradeId", gradeId);	//年级
			queryParams.put("videoCourseType", "1");	//同步课程
			queryParams.put("courseId", "0");	//大专栏（学年学期）
			
			//高中阶段购买不赠送延伸学期
			if(gradeId>30 || semaster==2){
				queryParams.put("semaster", semaster);	//学期			
			}
			
			List<VideoCourse> videoCourseList = null;
			try {
				videoCourseList = 
						videoCourseDao.selectVideoCourseListByConditions(queryParams);							
				
				if(semaster==2 && gradeId<30){ 	//初中阶段额外赠送延伸下班学期视频课程
					//赠送下个年级的上半学期视频课程
					int stage = gradeId/10;	//小初高 
					int gradeLevel = gradeId%10;	//1-6
					if(stage==1){
						if(gradeLevel==6){
							stage++;
						}
					}else if(gradeLevel==3){
						stage++;
					}
					if(stage != gradeId/10){	//已升级年级
						gradeLevel = 1;
					}else {
						gradeLevel++;
					}
					StringBuffer newGradeId = new StringBuffer();
					newGradeId.append(stage).append(gradeLevel);
					
					queryParams.put("gradeId", newGradeId.toString());
					queryParams.put("semaster", 1);						
					
					List<VideoCourse> extraVideoCourseList = 
							videoCourseDao.selectVideoCourseListByConditions(queryParams);	
					if(!CollectionUtils.isEmpty(extraVideoCourseList) && videoCourseList!=null){
						videoCourseList.addAll(extraVideoCourseList);
					}
				}
				if(CollectionUtils.isEmpty(videoCourseList)){
					logger.warn("本地课程列表中没有查到对应的课时包,年级: " + gradeId +"videoCourseType: 1");
					return 0;
				}
			} catch (Exception e) {
				logger.error("查询视频课程失败！");
				e.printStackTrace();
				throw new CommonRunException(-1,"查询视频课程失败！");
			}
			
			//查询
			List<String> resourceIdList = new ArrayList<String>();
			List<DaulVideoOrder> recordList = new ArrayList<DaulVideoOrder>();
			for(VideoCourse videoCourse : videoCourseList){
				DaulVideoOrder videoOrder = new DaulVideoOrder();
				//String daulOrderId = UUID.randomUUID().toString();
				
				videoOrder.setCreateTime(new Date());
				videoOrder.setDaulOrderId(daulOrderId);
				videoOrder.setGradeId((short)gradeId);
				videoOrder.setParentId(parentId);
				videoOrder.setStudentId(studentId);
				videoOrder.setSemaster((short)videoCourse.getSemaster());
				videoOrder.setVideoCourseType((short)1);
				videoOrder.setVideoCourseId(videoCourse.getVideoCourseId());
				
				recordList.add(videoOrder);
				resourceIdList.add(videoCourse.getVideoCourseId());
				
				//调用小鹅通SDK同步下单
				logger.info("本地小鹅通订单已生成,需要点击开通才能真正授权");
				/*logger.info("generated userId: " + userOuterSync.getUserId());
				if(!StringUtils.isEmpty(userOuterSync.getUserId())){
					//生成订单
					logger.info("调用小鹅通SdK生成订单...");
					org.json.JSONObject data = new org.json.JSONObject();
					data.put("payment_type", 3); //2-单笔（单个商品）、3-付费产品包（专栏会员等）,
			        //data.put("resource_type", 3); //单笔购买时为必要参数，资源类型：1-图文、2-音频、3-视频、4-直播
			        //data.put("resource_id", "p_5bb6e34718b2d_HlWYvm9z");//单笔购买时为必要参数，资源id
			        data.put("product_id", videoCourse.getVideoCourseId()); //购买产品包时为必要参数，产品包id
			        data.put("user_id", userOuterSync.getUserId());//'user_id':'u_asdwjdnjkxkcasjb3847832478',
			        data.put("out_order_id", daulOrderId);//'out_order_id':'order_2017564065'
			        org.json.JSONObject orderRs = sdk.send("orders.create", data, 1, "1.0");
			        logger.info("返回结果："+orderRs);
			        
			        org.json.JSONObject orderData = orderRs.getJSONObject("data");//
			        String orderId = orderData.getString("order_id");
			        
			        //确认订单（修改订单状态为已购买）
			        logger.info("调用小鹅通SdK修改订单状态...");
			        org.json.JSONObject comfirmOrder = new org.json.JSONObject();
			        comfirmOrder.put("order_id", orderId);
			        comfirmOrder.put("order_state", "1");
			        org.json.JSONObject updateResult = sdk.send("orders.state.update", comfirmOrder, 1, "1.0");
			        logger.info("修改结果：" + updateResult);								
				}*/
			}
			
			//本地下单（同步视频课程订单入库）
			try {
				logger.info("本地下单（同步视频课程订单入库）...");
				result = daulOrderDao.insertDaulOrderList(recordList);							
			} catch (Exception e) {
				logger.error("同步视频课程订单入库失败！");
				e.printStackTrace();
				throw new CommonRunException(-1,"同步视频课程订单入库失败！");
			}

		} catch (Exception e) {
			logger.error("同步双师课程订单出错！");
			throw new CommonRunException(-1,"同步双师课程订单出错！");
		}
		
		return result;
	}
	
	
	@Transactional
	@Override
	public int updateOrder(JSONObject params) {
		int updatedColums = 0;
		try {
			String teacherIds = params.getString("teacherIds");
			String courseIds = params.getString("courseIds");
			String orderId = params.getString("orderId");
			
			logger.info("teacherIds"+teacherIds);
			logger.info("courseIds"+courseIds);
			logger.info("orderId"+orderId);
			List<String> courseList = null;
			List<String> teacherList = null;			
			
			//待匹配老师
			if(null==teacherIds) {
				teacherIds = "";
			}
			teacherList = Arrays.asList(teacherIds.split(","));
			
			//待匹配科目
			if(null==courseIds) {
				courseIds = "";
			}
			courseList = Arrays.asList(courseIds.split(","));			

			//获取原订单详情
			OrderSum oldOrderSum = null;
			try {
				OrderSumKey orderSumKey = new OrderSumKey();
				orderSumKey.setOrderid(orderId);
				oldOrderSum = orderSumDao.selectByPrimaryKey(orderSumKey);
			} catch (Exception e) {
				e.printStackTrace();
				logger.info("获取元订单详情失败！");
				throw e;
			}
			
			//
			if(null==oldOrderSum){
				return updatedColums;
			}
			logger.info("oldOrderSum lessonType:"+oldOrderSum.getLessontype());
			
			//查看是否存在重复录入情况（订单下存在相同的老师Id和科目Id）
			try {
				List<TeacherLesRelationKey> newTLRlations = new ArrayList<TeacherLesRelationKey>();
				List<OrderTeachingRelation> newOTRelations = new ArrayList<OrderTeachingRelation>();
				
				List<OrderTeachingRelation> otRelations = otRelationDao.selectOTRelationsByOrderId(orderId);
				if(teacherList.size()>0) {
					next:
					for(int i=0; i<teacherList.size(); i++) {
						int courseId = Integer.parseInt(courseList.get(i));
						String teacherId = teacherList.get(i);
						logger.info("to be inserted courseId:"+courseId);
						logger.info("to be inserted teacherId:"+teacherId);
						//logger.info("");
						
						//过滤重复教学任务
						if(otRelations!=null) {
							for(int j=0; j<otRelations.size(); j++) {
								OrderTeachingRelation otRelation = otRelations.get(j);
								
								logger.info("otr courseId:"+otRelation.getLessonType());
								logger.info("otr teacherId"+otRelation.getTeacherId());
								if(courseId==otRelation.getLessonType()
										&& teacherId.equals(otRelation.getTeacherId())) {
									continue next;
								}
							}
						}
						//新增教学任务
						String teachingId = UUID.randomUUID().toString();
						TeacherLesRelationKey tlRelation = new TeacherLesRelationKey();
						tlRelation.setLessontype(courseId);
						tlRelation.setTeacherid(teacherId);
						tlRelation.setTeachingid(teachingId);
						newTLRlations.add(tlRelation);
						
						OrderTeachingRelation otRelation = new OrderTeachingRelation();
						otRelation.setLessonType(courseId);
						otRelation.setTeacherId(teacherId);
						otRelation.setTeachingId(teachingId);
						otRelation.setMemberId(oldOrderSum.getMemberid());
						otRelation.setOrderId(orderId);
						otRelation.setParentId(oldOrderSum.getParentid());						
						newOTRelations.add(otRelation);
						
						//补充订单教学任务
						if(StringUtils.isEmpty(oldOrderSum.getTeachingids())) {
							oldOrderSum.setTeachingids(teachingId);
						}else {
							StringBuffer sb = new StringBuffer();
							sb.append(oldOrderSum.getTeachingids());
							sb.append(",");
							sb.append(teachingId);
							
							oldOrderSum.setTeachingids(sb.toString());
						}
					}
				}

				//订单-教学任务入库
				try {
					if(!CollectionUtils.isEmpty(newOTRelations)) {
						updatedColums = otRelationDao.insertOTRelations(newOTRelations);
					}else{
						return updatedColums;
					}
				} catch (Exception e) {
					e.printStackTrace();
					throw e;
				}
				
				//增加老师任教关系
				try {
					if(!CollectionUtils.isEmpty(newTLRlations)) {
						tlRelationDao.insertTLRelationList(newTLRlations);
					}
				} catch (Exception e) {
					e.printStackTrace();
					throw e;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				throw e ;
			}
				
			//更新订单的任教关系
			try {
				//if()
				orderSumDao.updateByPrimaryKeySelective(oldOrderSum);				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			return updatedColums;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	
	@Transactional
	@Override
	public List<JSONObject> getOrderList(JSONObject params) {
		List<JSONObject> result = null;
		try {
			try {
				result = orderManageDao.selectOrderList(params);				
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("查询订单出错！");
				throw new CommonRunException(-1, "查询订单出错！");
			}
			
			//++++++++++++++++++++++ 双师另外补充购买的双师视频课程   ++++++++++++++++++++++++++++
			Map<String,String> parentIdVideosMap = new HashMap<String,String>();
			if(params.getInteger("lessonType")!=null 
					&& params.getInteger("lessonType")==3){
				try {
					List<DaulVideoOrder>daulOrders = daulOrderDao.selectByParams(params);
				
					if(null!=daulOrders){
						for(DaulVideoOrder daulOrder : daulOrders){
							Short gradeId = daulOrder.getGradeId();
							Short semaster = daulOrder.getSemaster();														
							
							//年级
							StringBuffer videos = new StringBuffer();
							for(Grade g : Grade.values()){
								if(g.getValue() == gradeId){
									videos.append(g.getFullGradeName());									
									break;
								}
							}							
							
							//学期
							for(Semaster s : Semaster.values()){
								if(s.getValue() == semaster){
									videos.append(s.getSimpleName());
									break;
								}
							}
							
							//组合家长购买双师课时包
							if(null!=parentIdVideosMap.get(daulOrder.getParentId())){
								videos.append(",");								
								videos.append(parentIdVideosMap.get(daulOrder.getParentId()));
							}							
							parentIdVideosMap.put(daulOrder.getParentId(), videos.toString());							
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					logger.error("查询双师订单出错！");
					throw new CommonRunException(-1, "查询双师订单出错！");
				}

				//补充 syncCourses 字段
				if(!CollectionUtils.isEmpty(result)){
					
					for(JSONObject order : result){
						String parentId = order.getString("parentId"); 			
						
						order.put("syncCourses", parentIdVideosMap.get(parentId));
					}
				}
			}
			
			
			//+++++++++++++++++++++++++++++++++++++++  end +++++++++++++++++++++++++++++++++++++++++
			
			//查询是否有书
			Map<String,Short> orderHasBookMap = new HashMap<String,Short>();
			try {
				Map<String,Object> reqParams = new HashMap<String,Object>();
				reqParams.put("hasBook", "1");
				List<Orders> orderList = orderManageDao.selectIfHasBookByParams(reqParams);
				if(!CollectionUtils.isEmpty(orderList)) {
					for(Orders orders : orderList) {																		
						orderHasBookMap.put(orders.getOrderid(), orders.getHasBook());
					}
				}
				
			} catch (Exception e) {
				logger.info("查询订单是否购买书籍出错！");
				logger.error(e.getMessage());
			}
			
			//查询关联老师			
			if(!CollectionUtils.isEmpty(result)){
				List<String> tIds = new ArrayList<String>();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				
				for(JSONObject order : result){
					//加入是否购买课本
					if(null!=orderHasBookMap.get(order.getString("orderId"))) {
						order.put("hasBook", 1);
					}else {
						order.put("hasBook", 0);
					}
					String teachingIds = order.getString("teachingIds");
					if(!StringUtils.isEmpty(teachingIds)){
						tIds.addAll(Arrays.asList(teachingIds.split(",")));
					}
					
					//转换时间
					Object purchaseTime = order.get("purchaseTime");
					if(null != purchaseTime) {
						try {
							order.put("purchaseTime", dateFormat.format(purchaseTime));							
						} catch (Exception e) {
							logger.info("转换时间出错！");
							logger.info(e.getMessage());
						}
					}
					//转换年级代码->名称
					Integer grade = order.getInteger("lessonType");
					if(null!=grade) {						
						if(grade.intValue()<0) {
							grade*=-1;
						}
						if(grade > 331){	//一对二
							grade -= 300;
						}
						
						for(Level curLevel : Level.values()) {
							if(curLevel.getValue() == grade/10) {
								order.put("gradeName", curLevel.toString());
								break;
							}
						}
						
					}
				}
				
				//增加任教关系字段
				if(null!=tIds && tIds.size()>0){
					try {
						Map<String,JSONObject> teachingIdNameMap = new HashMap<String,JSONObject>();
						List<JSONObject> teachers = orderManageDao.selectTeachersByTeachingIds(tIds);
						for(JSONObject teacher : teachers){
							teachingIdNameMap.put(teacher.getString("teachingId"), teacher);
						}
						
						//匹配任教老师关系
						for(JSONObject order : result){
							String teachingIds = order.getString("teachingIds");
							if(!StringUtils.isEmpty(teachingIds)){
								List<String>curTeachingIds = Arrays.asList(teachingIds.split(","));
								//StringBuffer sb = new StringBuffer();
								JSONArray teacherMaps = new JSONArray();
								for(String curTeachingId : curTeachingIds){
									JSONObject curTeacher = teachingIdNameMap.get(curTeachingId);
									if(null==curTeacher) {
										continue;
									}
									if(null!=curTeacher 
											&& null!=curTeacher.getInteger("lessonType")) {
										Integer lessonType = curTeacher.getInteger("lessonType");
										for(Course curCourse : Course.values()) {
											if(lessonType%10 == curCourse.getValue()) {
												curTeacher.put("courseName", curCourse.toString());
											}
										}
										
									}
									teacherMaps.add(curTeacher);
								}
								order.put("bindTeachers", teacherMaps/*sb.substring(0, sb.length()-1)*/);
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
						throw e;
					}
				}
			}
			//按照时间（最近）排序
			Collections.sort(result, new Comparator<JSONObject>() {

				@Override
				public int compare(JSONObject o1, JSONObject o2) {
					if(null!=o1 && null!=o2 
							&& o1.getString("purchaseTime")!=null
							&& o2.getString("purchaseTime")!=null){
						
						return o2.getString("purchaseTime").compareTo(o1.getString("purchaseTime"));
					}
					return 0;
				}
			});
			
			return result;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	@Transactional
	@Override
	public List<JSONObject> queryTeachingList(JSONObject params) {
		try {
			return orderManageDao.selectTeachersByConditions(params);
		} catch (Exception e) {
			logger.info("查询教学任务（老师列表）出错！");
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<JSONObject> queryCourseList(JSONObject params) {
		try {
			return orderManageDao.selectCoursesByGradeId(params.getString("gradeId"));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询年级下的课程名出错！");
		}
		return null;
	}
	@Transactional
	@Override
	public int updateOrderSum(JSONObject params) {
		try {
			OrderSum record = new OrderSum();
			record.setOrderid(params.getString("orderId"));
			
			//0：结算、1：充值
			int type = params.getIntValue("operateType");
			Float operateNum = params.getFloat("operateNum");
			
			if(null==operateNum || operateNum==0){
				throw new CommonRunException(-1, "充值/结算数目不能为0！");
			}
			
			operateNum = (type==0)?-operateNum:operateNum;
			
			//更新订单总表
			try {
				logger.info("查询订单总表（orderId）："+record.getOrderid());
				record = orderSumDao.selectByPrimaryKey(record);
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonRunException(-1, "查询订单总表出错！");
			}
			record.setTotallessonnum((record.getTotallessonnum()+operateNum));
			record.setLessonleftnum((record.getLessonleftnum()+operateNum));
			
			//更新入库
			try {
				orderSumDao.updateByPrimaryKeySelective(record);				
			} catch (Exception e) {
				e.printStackTrace();
				throw new CommonRunException(-1, "更新订单总表出错！");
			}
			
			//插入结算、充值记录
			Orders order = new Orders();				
			try {
				order.setOrderid(UUID.randomUUID().toString());
			
				order.setCreatetime(new Date());
				order.setLessontype(record.getLessontype());
				order.setMemberid(record.getMemberid());
				order.setParentid(record.getParentid());
				order.setPurchasenum(operateNum);				
				//++++++++++  added 2018-10-14 (daul teacher version)
				order.setTeachingWay(record.getTeachingWay());
				
				order.setOrderType(/*++*/type);
				orderDao.insertSelective(order);
			}catch (Exception e) {
				e.printStackTrace();
				throw new CommonRunException(-1, "插入结算、充值记录出错！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonRunException(-2, "内部错误！");
		}
		return 0;
	}
	
	@Transactional
	@Override
	public List<JSONObject> queryMTeachings(JSONObject params) {
		try {
			List<JSONObject> mTeachingList = orderManageDao.selectMTeachingsByParams(params);
			if(null!=mTeachingList){
				for(JSONObject mTeaching : mTeachingList){
					Integer status = mTeaching.getInteger("status");
					Integer feedback = mTeaching.getInteger("feedback");
					
					//默认为未确认
					mTeaching.put("feedback", 3);	//未确认
					if(null!=status){
						if(status==2 || status==3){
							mTeaching.put("feedback", feedback);	//未确认
						}
						/*if(feedback!=null){	//家长评价
							mTeaching.put("feedback", feedback);	
						}else{	//默认为满意
							mTeaching.put("feedback", 3);	
						}*/
					}
					
				}
			}
			
			return mTeachingList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<JSONObject> queryMOrders(JSONObject params) {
		try {
			try {
				OrderSumKey key = new OrderSumKey();
				key.setOrderid(params.getString("orderId"));
				OrderSum orderSum = orderSumDao.selectByPrimaryKey(key);
				
				if(null==orderSum 
						|| orderSum.getMemberid()==null
						|| orderSum.getParentid()==null) {
					return null;
				}
				
				params.put("memberId", orderSum.getMemberid());
				params.put("parentId", orderSum.getParentid());
				params.put("lessonType", orderSum.getLessontype());
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			
			//查询对应的充值、结算记录
			List<Orders>mOrders = orderManageDao.selectMOrdersByParams(params);
			
			List<JSONObject> data = new ArrayList<JSONObject>();
			if(!CollectionUtils.isEmpty(mOrders)) {
				SimpleDateFormat myFmt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				for(Orders order : mOrders) {	
					JSONObject singleData = new JSONObject();
					singleData.put("operateType", order.getOrderType());
					singleData.put("operateNum", order.getPurchasenum());				
					singleData.put("date", myFmt.format(order.getCreatetime()));					
					
					data.add(singleData);
				}
			}
			return data;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Transactional
	@Override
	public int deleteTeachingTeacher(JSONObject params) {
		try {
			Map<String,Object> reqParams = new HashMap<String,Object>();
			reqParams.put("orderId", params.get("orderId"));
			reqParams.put("courseId", params.get("courseId"));
			reqParams.put("teacherId", params.get("teacherId"));
			
			Short teachingWay = null;
			//查询任教Id
			String deleteTeachingId = null;
			try {
				OrderTeachingRelation otr = otRelationDao.selectOTRelationsByParams(reqParams);
				if(null==otr){
					//误删之后,清理教学任务对应的表数据 
					try {
						OrderSumKey key = new OrderSumKey();
						
						key.setOrderid(params.getString("orderId"));
						OrderSum orderSum = orderSumDao.selectByPrimaryKey(key);
						
						if(null==orderSum){
							logger.info("orderSum is null!");
							return 0;
						}
						
						//+++++++++++++++  daul teacher version   +++++++++++++++
						teachingWay = orderSum.getTeachingWay();
						logger.info("selected teachingWay: "+ teachingWay);
						//++++++++++++++++++++++   end   +++++++++++++++++++++++
						
						
						String teachingIds = orderSum.getTeachingids();
						if(!StringUtils.isEmpty(teachingIds)){
							List<String> teachingIdList = Arrays.asList(teachingIds.split(","));
							
							//查找无效的教学任务
							logger.info("query tlRelations[params]:"+teachingIdList.toString());
							List<TeacherLesRelationKey> tlrs = tlRelationDao.selectTLRelationsById(teachingIdList);
							if(!CollectionUtils.isEmpty(teachingIdList) 
									&& !CollectionUtils.isEmpty(tlrs)){
								logger.info("query deprecated teachingId");
								for(TeacherLesRelationKey tlr : tlrs){
									if(teachingIdList.contains(tlr.getTeachingid())){
										deleteTeachingId = tlr.getTeachingid();
										break;
									}
								}
							}
						}
					} catch (Exception e) {
						logger.info("清理教学任务对应的表数据出错！");
						e.printStackTrace();
					}
					
				}else{
					deleteTeachingId = otr.getTeachingId();
				}
								
				logger.info("deleteTeachignId:"+deleteTeachingId);
				if(StringUtils.isEmpty(deleteTeachingId)){
					return 0;
				}
			} catch (Exception e) {
				logger.error("查询任教Id失败！");
				e.printStackTrace();
				return -1;
			}

			try {				
				otRelationDao.deleteOTRelations(reqParams);	
			} catch (Exception e) {
				logger.error("删除老师任教关系出错！");
				e.printStackTrace();
				throw e;
			}
			//otRelationDao.selectOTRelationsByOrderId(params.getString("orderId"));
			
			//删除教师教学任务
			try {
				TeacherLesRelationKey tlRelationKey = new TeacherLesRelationKey();
				tlRelationKey.setLessontype(params.getInteger("courseId"));
				tlRelationKey.setTeacherid(params.getString("teacherId"));
				tlRelationKey.setTeachingid(deleteTeachingId);
				
				//补充 teachingId				
				//tlRelationKey = tlRelationDao.selectTLRelationByParams(tlRelationKey);
				//deleteTeachingId = tlRelationKey.getTeachingid();
				
				tlRelationDao.deleteByPrimaryKey(tlRelationKey);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			//删除订单总表中的教学任务
			try {
				OrderSumKey key = new OrderSumKey();
				
				key.setOrderid(params.getString("orderId"));
				OrderSum orderSum = orderSumDao.selectByPrimaryKey(key);
				if(null!=orderSum && !StringUtils.isEmpty(orderSum.getTeachingids())) {
					String teachingIds = orderSum.getTeachingids();
					logger.info("teachingIds:"+teachingIds);
					StringBuffer sb = new StringBuffer();
					List<String> teachingIdList = Arrays.asList(teachingIds.split(","));
					for(String teachingId : teachingIdList){
						if(!teachingId.equals(deleteTeachingId)){
							sb.append(teachingId);
							sb.append(",");
						}
					}
					if(sb.length()>1){
						orderSum.setTeachingids(sb.substring(0,sb.length()-1));					
						orderSumDao.updateByPrimaryKeySelective(orderSum);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			//删除双师视频课程授权
			if(null!=teachingWay && teachingWay == 3){
				JSONObject daulOrderParams = new JSONObject();
				daulOrderParams.put("teachingId", deleteTeachingId);
				List<TeachingDaulOrder> teachingDaulOrderList = 
						teachingDaulOrderDao.selectByParams(daulOrderParams );
				
				final XiaoeSDK sdk  = 
						new XiaoeSDK(WeiXinConfig.XIAO_E_TONG_APPID, WeiXinConfig.XIAO_E_TONG_APPSECRET); 
				for(TeachingDaulOrder daulOrder : teachingDaulOrderList){
					 final String xiaoeOrder = daulOrder.getXiaoeOrderId();
					
					 //异步执行
					 excutors.submit(new Runnable() {
						
						@Override
						public void run() {							
							//确认订单（修改订单状态为已购买）
					        logger.info("调用小鹅通SdK修改订单状态...");
					        org.json.JSONObject comfirmOrder = new org.json.JSONObject();
					        comfirmOrder.put("order_id", xiaoeOrder);
					        comfirmOrder.put("order_state", "2");	//支付失败
					        org.json.JSONObject updateResult = sdk.send("orders.state.update", comfirmOrder, 1, "1.0");
					        logger.info("修改结果：" + updateResult);
					        
					        //更改订单状态成功-》删除对应双师本地授权
					        if(updateResult.getInt("order_state") == 2){
					        	teachingDaulOrderDao.deleteByXiaoeOrderId(xiaoeOrder);
					        }
						}
					});
					
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 0;
	}

	@Override
	public Orders queryOrderById(String orderId) {
		// TODO Auto-generated method stub
		return orderDao.selectOrderById(orderId);
	}

	/**
	 * 同步活动订单
	 */
	public void syncAllDiscountOrders(){
		final XiaoeSDK sdk  = 
				new XiaoeSDK(WeiXinConfig.XIAO_E_TONG_APPID, WeiXinConfig.XIAO_E_TONG_APPSECRET); 
		
		 org.json.JSONObject getOrdersParams = new org.json.JSONObject();
		 Calendar calendar = Calendar.getInstance();
		 Date date = new Date();		//获取当前时间    
		 calendar.setTime(date);
		 /*calendar.set(Calendar.HOUR_OF_DAY, 0);
		 calendar.set(Calendar.MINUTE, 0);
		 calendar.set(Calendar.MILLISECOND, 0);
		 calendar.set(Calendar.SECOND, 0);*/
	
		 getOrdersParams.put("end_time", calendar.getTimeInMillis()/1000);
		 calendar.add(Calendar.DAY_OF_MONTH, -1);//当前时间减去一年，即一年前的时间    
		 getOrdersParams.put("begin_time", calendar.getTimeInMillis()/1000);		
		 
		 logger.info("查询活动订单...");
		 org.json.JSONObject rs = 
				 sdk.send("order.list.get", getOrdersParams, 1, "2.0");
		 if(null==rs || rs.get("data")==null){
			 logger.warn("没有查询到活动促销订单！");
			 logger.info("查询活动订单结果：" + rs);
			 return;
		 }
			 
		 org.json.JSONArray originOrders = rs.getJSONArray("data");
		 int orderCount = originOrders.length();
		 for(int n=0; n<orderCount; n++){			 
			 final org.json.JSONObject order = originOrders.getJSONObject(n);
			 
			 excutors.submit(new Runnable() {
				 
				 @Override
				 public void run() {
					 // TODO Auto-generated method stub
					 String xiaoeUserId = order.getString("user_id");
					 if(StringUtils.isEmpty(xiaoeUserId)){
						 logger.warn("没有查询到下单的用户Id！");
						 return;
					 }

					 //获取用户信息
					 org.json.JSONObject data = new org.json.JSONObject();
					 data.put("user_id", xiaoeUserId);						
					 org.json.JSONObject userInfo =
							 sdk.send("users.getinfo", data, 1, "2.0");
					 logger.info("小鹅通用户SDK获取用户信息结果：" + userInfo);
					 if(null == userInfo 
							 || userInfo.get("data")==null
							 || userInfo.getJSONArray("data").length()!=1){
						 logger.info("小鹅通用户信息为空！");
						 logger.warn("小鹅通订单没有同步，订单Id：" + order.getString("order_id"));
						 return;
					 }
					 
					 String lessonId = order.getString("id");	//小鹅通资源Id
					 LessonTypeKey key = new LessonTypeKey();
					 key.setLessonId(lessonId);
					 logger.info("根据小鹅通资源Id({})查询本地课程包",lessonId);
					 LessonType lessonType = null;
					 try {
						 lessonType = lessonTypeDao.selectByPrimaryKey(key );
						 if(null == lessonType){
							 logger.info("在本地没有查询到对应的资源Id！");
							 logger.warn("小鹅通订单没有同步，订单Id：{},原因：没有设置对应的课程包！", order.getString("order_id"));
							 return;
						 }						
					 } catch (Exception e) {
						throw new CommonRunException(-1, "查询课时包出错！");
					 }					 
					 
					 //本地同步下单
					 JSONObject orderParams = new JSONObject();
					 org.json.JSONArray userDatas = userInfo.getJSONArray("data");
					 org.json.JSONObject currentUser = userDatas.getJSONObject(0);
					 
					 orderParams.put("openId", currentUser.get("wx_open_id"));
					 orderParams.put("telNum", currentUser.get("phone"));
					 orderParams.put("parentName", currentUser.get("nickname"));
					 orderParams.put("studentName", currentUser.get("nickname")+"的孩子");
					 orderParams.put("lessonType", lessonType.getLessontype());
					 orderParams.put("purchaseNum", lessonType.getCoursecnt());
					 orderParams.put("orderType", 2);	//家长下单
					 orderParams.put("teachingWay", lessonType.getTeachingWay());
					 orderParams.put("nonce_str", order.getString("order_id"));
					 orderParams.put("hasBook", "0");	//默认没书
					 orderParams.put("wechatNum", currentUser.get("wx_union_id"));
					 orderParams.put("payFrom", 0);	//从小鹅通下单 -》本地订单
					 
					 orderParams.put("avatar", currentUser.get("avatar"));
					 orderParams.put("wx_union_id", currentUser.get("wx_union_id"));
					 orderParams.put("user_id", currentUser.get("user_id"));
					 try {
						addOrder(orderParams);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						throw new CommonRunException(-1, "同步下单失败（小鹅通-》本地）！");						
					}
				 }
			 });
		 }	 
		 
	}
	
	
	/**
	 * 定时清理两个月内没提现的任教关系
	 * @return
	 */
	public int clearTeachings(){
		
		
		return 0;
	}
	
}
