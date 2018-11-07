package com.xiaoyi.teacher.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.exception.CommonRunException;
import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.common.utils.HttpClient;
import com.xiaoyi.common.utils.XiaoeSDK;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.Semaster;
import com.xiaoyi.custom.dao.IStudentTaskDao;
import com.xiaoyi.custom.dao.IStudentTaskStatisticDao;
import com.xiaoyi.custom.domain.StudentTask;
import com.xiaoyi.custom.domain.StudentTaskStatistic;
import com.xiaoyi.custom.domain.StudentTaskStatisticKey;
import com.xiaoyi.manager.dao.IParentsDao;
import com.xiaoyi.manager.dao.IVideoCourseDao;
import com.xiaoyi.manager.domain.Parents;
import com.xiaoyi.manager.domain.Teacher;
import com.xiaoyi.manager.domain.VideoCourse;
import com.xiaoyi.teacher.dao.IDaulTaskDao;
import com.xiaoyi.teacher.dao.ITH5PlateDao;
import com.xiaoyi.teacher.dao.ITeachingDaulOrderDao;
import com.xiaoyi.teacher.dao.ITeachingRelationshipDao;
import com.xiaoyi.teacher.domain.TeachingDaulOrder;
import com.xiaoyi.teacher.domain.TeachingRelationship;
import com.xiaoyi.teacher.service.IDaulTaskService;
import com.xiaoyi.wechat.utils.WeiXinConfig;

@Service("daulTaskServiceImpl")
public class DaulTaskServiceImpl implements IDaulTaskService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	IDaulTaskDao daulTaskDao;
	
	@Resource
	ITeachingRelationshipDao teachingRelationshipDao;
	
	@Resource
	IStudentTaskStatisticDao studnetTaskStaticDao;
	
	@Resource
	ITH5PlateDao teacherH5Dao;
	
	@Resource
	IStudentTaskDao studentTaskDao;
	
	@Resource
	IStudentTaskStatisticDao taskStatisticDao;
	
	@Resource
	IWechatService wechatService;
	
	@Resource
	IParentsDao parentDao;
	
	@Resource
	ITeachingDaulOrderDao teachingDaulOrderDao;
	
	@Resource
	IVideoCourseDao videoCourseDao;
	
	@Override
	public List<JSONObject> getPSTRelations(String openId) {				
		List<JSONObject> relations = null;
		
		String teacherId = null;
		//获取老师teacherId
		try {
			Teacher teacher = teacherH5Dao.selectTeacherByOpenId(openId);
			teacherId = teacher.getTeacherid();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询老师失败！");
			throw new CommonRunException(-1, "查询老师失败！");
		}
		
		//获取老师绑定的学生家长关系
		try {
			relations = daulTaskDao.selectPSTBondingRelations(teacherId);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询任教关系失败！");
		}
		
		if(CollectionUtils.isNotEmpty(relations)){
			for(JSONObject relation : relations){	//一般不会超过三条
				TeachingRelationship teachingRelationship = 
						teachingRelationshipDao.selectByPrimaryKey(relation.getString("teachingId"));
				
				relation.put("teacherId", teacherId);
				relation.put("isGradeSetted", "0"); 	//默认没设置
				
				//设置gradeId
				Integer lessonType = relation.getInteger("lessonType");
				if(null != lessonType){
					relation.put("gradeId", lessonType/10);
				}
				
				//任教关系
				if(null!=teachingRelationship){
					String studentId = relation.getString("studentId");
					relation.put("isGradeSetted", "1"); 
										
					//设置年级和科目
					//科目
					Short courseId = teachingRelationship.getCourseId();
					Short gradeId = teachingRelationship.getGradeId();					
					Course course = Course.getInstance(courseId);
					relation.put("courseId", courseId);
					if(null!=course){
						relation.put("courseName", course.toString());
					}					
					//年级
					relation.put("gradeId", gradeId);
					for(Grade g : Grade.values()){
						if(gradeId == g.getValue()){
							relation.put("gradeName", g.getFullGradeName());
							break;
						}
					}
					
					//获取作业完成率
					int accomplishRate = 100;					
					StudentTaskStatisticKey key = new StudentTaskStatisticKey();
					key.setStudentId(studentId);
					key.setTeacherId(teacherId);
					try {
						StudentTaskStatistic taskStatistic = 
								studnetTaskStaticDao.selectByPrimaryKey(key);
						if(null != taskStatistic){
							accomplishRate = taskStatistic.getAccomplishRate();
						}
						relation.put("accomplishRate", accomplishRate);
					} catch (Exception e) {
						e.printStackTrace();
						logger.warn("查询学生作业完成率失败！");
					}					
				}
			}
		}
		
		return relations;
	}

	@Transactional
	@Override
	public int setBondGrade(JSONObject params) {
		try {
			TeachingRelationship record = new TeachingRelationship();
			if(StringUtils.isEmpty(params.getString("teachingId"))){
				throw new CommonRunException(-1, "参数错误,teachingId必传！");
			}
			record.setTeachingId(params.getString("teachingId"));
			record.setCourseId(params.getShort("courseId"));
			record.setUpdateTime(new Date());
			record.setCreateTime(new Date());
			Short lessonType = params.getShort("lessonType");
			if(lessonType!=null){
				record.setLessonType(lessonType);
				record.setGradeId((short)(lessonType/10));
			}
			record.setStudentId(params.getString("studentId"));
			record.setTeacherId(params.getString("teacherId"));
			record.setStatus((short)0);
			
			//插入任教关系（绑定学生年级、科目）
			try {
				teachingRelationshipDao.insertSelective(record);
			} catch (Exception e) {
				logger.error("插入任教关系（绑定学生年级、科目）失败！");
				throw new CommonRunException(-1, "插入任教关系（绑定学生年级、科目）失败！");
			}
			
			//老师双师课程下单
			JSONObject queryParams = new JSONObject();
			queryParams.put("teacherId", record.getTeacherId());			
			queryParams.put("orderStatus", "2");
			
			//查询已存在订单
			List<TeachingDaulOrder> teachingDaulOrderList = new ArrayList<TeachingDaulOrder>();
			try {		
				teachingDaulOrderList = teachingDaulOrderDao.selectByParams(queryParams );
			} catch (Exception e) {
				logger.warn("查询老师已授权访问双师订单失败！");
				throw new CommonRunException(-1, "查询老师已授权访问双师订单失败！");
			}
			
			//判断是否需要开通双师视频观看权限
			int currentSemaster = Semaster.getCurrentSemaster();
			int gradeId = lessonType/10;
			boolean hasPrivilege = false;
			if(CollectionUtils.isNotEmpty(teachingDaulOrderList)){
				for(TeachingDaulOrder order : teachingDaulOrderList){
					if(order.getGradeId() == gradeId
							&& order.getSemaster() == currentSemaster){
						hasPrivilege = true;
						break;
					}
				}
			}
			
			//判断是否开通双师视频课程观看权限
			List<VideoCourse> toBeAuthorizedCourses = null;
			if(!hasPrivilege){
				JSONObject queryCoursesParams = new JSONObject();
				queryCoursesParams.put("videoCourseType", "1");
				queryCoursesParams.put("semaster", currentSemaster);
				queryCoursesParams.put("gradeId", gradeId);
				queryCoursesParams.put("courseId", "0");
				queryCoursesParams.put("chapterId", "0");
				
				try {
					toBeAuthorizedCourses = videoCourseDao.
							selectVideoCourseListByConditions(queryCoursesParams);
				} catch (Exception e) {
					logger.error("是否开通双师视频课程观看权限失败！");
					throw new CommonRunException(-1, "是否开通双师视频课程观看权限失败！");
				}	
				
				//开通对应的权限
				for(VideoCourse vc : toBeAuthorizedCourses){
					String unionId = getUnionId(WeiXinConfig.TEACHER_PLATE_APPID, 
							WeiXinConfig.TEACHER_PLATE_SECRET_KEY, 
							params.getString("openId"));
					//下单
					if(!StringUtils.isEmpty(unionId)){
						String userId = null;
						XiaoeSDK sdk  = 
								new XiaoeSDK(WeiXinConfig.XIAO_E_TONG_APPID, WeiXinConfig.XIAO_E_TONG_APPSECRET); 

						//调用小鹅通SDK 获取用户user_id
						org.json.JSONObject userParams = new org.json.JSONObject();						
						userParams.put("wx_union_id", unionId);
						logger.info("调用小鹅通SDK 获取用户user_id...");
						org.json.JSONObject getUserInfo = 
								sdk.send("users.getinfo", userParams, 1, "1.0");
						logger.info("调用小鹅通SDK获取用户结果：" + getUserInfo);
						
						org.json.JSONArray userData = getUserInfo.getJSONArray("data");
						if(null!=userData && userData.length()>0){				
							userId = userData.getJSONObject(0).getString("user_id");												
						}else{
							logger.info("调用小鹅通SDK注册用户...");
							org.json.JSONObject data = new org.json.JSONObject();
							
							data.put("user_tag", "teacher");
							data.put("wx_union_id", unionId);
							org.json.JSONObject regResult = sdk.send("users.register", data, 1, "1.0");
							logger.info("注册返回结果：" + regResult);
							
							if(null!=regResult){								
								if(regResult.getInt("code")!=0){ 	//用户已占用
									//调用小鹅通SDK 获取用户user_id
									userParams = new org.json.JSONObject();						
									userParams.put("wx_union_id", unionId);
									logger.info("调用小鹅通SDK 获取用户user_id...");
									org.json.JSONObject userInfo = 
											sdk.send("users.getinfo", userParams, 1, "1.0");
									logger.info("调用小鹅通SDK获取用户结果：" + userInfo);
									
									org.json.JSONArray userDetail = userInfo.getJSONArray("data");
									if(null!=userDetail && userDetail.length()>0){				
										userId = userDetail.getJSONObject(0).getString("user_id");												
									}
								}else{
									org.json.JSONObject user_data = regResult.getJSONObject("data");
									if(null!=user_data){
										userId = user_data.getString("user_id");
									}
								}
							}
						}
						
						//调用小鹅通SDK开通老师访问视频课程权限
						//生成订单
						String daulOrderId = UUID.randomUUID().toString();
						logger.info("调用小鹅通SdK生成订单...");
						org.json.JSONObject data = new org.json.JSONObject();
						data.put("payment_type", 3); //2-单笔（单个商品）、3-付费产品包（专栏会员等）,
				        //data.put("resource_type", 3); //单笔购买时为必要参数，资源类型：1-图文、2-音频、3-视频、4-直播
				        //data.put("resource_id", "p_5bb6e34718b2d_HlWYvm9z");//单笔购买时为必要参数，资源id
				        data.put("product_id", vc.getVideoCourseId()); //购买产品包时为必要参数，产品包id
				        data.put("user_id", userId);//'user_id':'u_asdwjdnjkxkcasjb3847832478',
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
												
						//记录开通的双师视频课程列表
						try {
							TeachingDaulOrder order = new TeachingDaulOrder();
							order.setCourseId((short)0);
							order.setGenDate(new Date());
							order.setGradeId((short)(lessonType/10));
							order.setInnerOrderId(daulOrderId);
							order.setParentId(params.getString("parentId"));
							order.setSemaster((byte)currentSemaster);
							order.setStudentId(params.getString("studentId"));
							order.setTeacherId(params.getString("teacherId"));
							order.setTeachingId(params.getString("teachingId"));
							order.setUpdateTime(new Date());
							order.setVideoCourseId(vc.getVideoCourseId());
							order.setXiaoeOrderId(orderId);
							
							teachingDaulOrderDao.insertSelective(order);
						} catch (Exception e) {
							logger.error("插入老师双师视频课程权限失败！");
							throw new CommonRunException(-1, "插入老师双师视频课程权限失败！");
						}
					}										
				}
			}						
			
			return 0;
		}catch (CommonRunException e) {
			throw e;
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("插入绑定任教关系失败！");
			throw new CommonRunException(-1, "插入绑定任教关系失败！");
		}
	}

	@Override
	public List<JSONObject> getAvailableTasks(JSONObject params) {
		List<JSONObject> datas = new ArrayList<JSONObject>();
		try {
			int semaster = Semaster.getCurrentSemaster();
			//params.put("semaster", semaster);
			
			//查询可布置的视频课程列表
			List<JSONObject> availableTaskList = null;//new ArrayList<JSONObject>();
			try {
				logger.info("查询可布置的视频课程列表[params]:" + params);
				availableTaskList = daulTaskDao.selectAvailableTasks(params);				
				if(CollectionUtils.isEmpty(availableTaskList)){
					return datas;
				}
			} catch (Exception e) {
				throw new CommonRunException(-1, "查询可布置的视频课程列表失败！");
			}
			
			//查询已布置的视频课程列表
			List<StudentTask> studentTaskList = null;
			try {
				studentTaskList = studentTaskDao.selectByParams(params);				
			} catch (Exception e) {
				logger.error("查询已布置的视频课程列表失败！");
				throw new CommonRunException(-1, "查询已布置的视频课程列表失败！");
			}
			
			//生生videoCourseId - StudentTask map
			Map<String,StudentTask> videoCourseIdStudentTaskMap = new HashMap<String,StudentTask>();
			if(null!=studentTaskList){
				for(StudentTask st : studentTaskList){
					if(null!=st){
						videoCourseIdStudentTaskMap.put(st.getVideoCourseId(), st);
					}
				}
			}						
			
			//组合数据
			Map<Integer,JSONArray> videoTasksMap = new HashMap<Integer,JSONArray>(); 
			for(JSONObject task : availableTaskList){
				String videoCourseId = task.getString("videoCourseId");
				Integer videoTaskType = task.getInteger("videoCourseType");
				//归并到大类
				if(videoTaskType >= 10){
					videoTaskType /=10;
				}
				
				//过滤同步课程非当前学期课程
				if(1==videoTaskType 
						&& null != task.getInteger("semaster") 
						&& semaster!=task.getIntValue("semaster")){	
					continue;
				}
				
				JSONArray videoTasks = videoTasksMap.get(videoTaskType);
				if(null==videoTasks){
					videoTasks = new JSONArray();
					videoTasksMap.put(videoTaskType, videoTasks);
				}
				
				int taskStatus = 0;
				if(videoCourseIdStudentTaskMap.containsKey(videoCourseId)){
					task.put("studentTaskId", videoCourseIdStudentTaskMap.get(videoCourseId).getStudentTaskId());
					taskStatus = 1;
				}				
				task.put("videoCourseStatus", taskStatus);
				
				videoTasks.add(task);
			}
			
			//拼装返回结果
			for(Integer videoTaskType : videoTasksMap.keySet()){
				JSONObject task = new JSONObject();
				task.put("videoTaskType", videoTaskType);
				task.put("videoTasks", videoTasksMap.get(videoTaskType));
				
				datas.add(task);
			}
			
		} catch (CommonRunException e) {
			// TODO: handle exception
		}catch (Exception e) {
			// TODO: handle exception
		}
		return datas;
	}

	@Override
	public int distributeTask(JSONObject params) {
		// TODO Auto-generated method stub				
		try {
			//验证参数
			if(params.get("studentId")==null 
					||params.get("videoTaskType")==null 
					||params.get("videoCourseId")==null 
					||params.get("studentId")==null){
				logger.info("params:" + params.toJSONString());
				throw new CommonRunException(-1, "参数错误!");
			}
			
			//插入作业记录
			StudentTask record = new StudentTask();
			record.setCreateTime(new Date());
			record.setStudentId(params.getString("studentId"));
			record.setStudentTaskId(UUID.randomUUID().toString());
			record.setTaskStatus((byte)1);	//1：已布置（未完成），2：已完成
			record.setTeacherId(params.getString("teacherId"));
			record.setTaskType(params.getByte("videoTaskType"));
			record.setVideoCourseId(params.getString("videoCourseId"));
			record.setGradeId(params.getShort("gradeId"));
			record.setCourseId(params.getShort("courseId"));
			record.setUpdateTime(new Date());
			
			try {
				studentTaskDao.insertSelective(record);				
			} catch (Exception e) {
				throw new CommonRunException(-1, "插入作业记录失败！");
			}
			
			//更新/插入统计表
			try {
				StudentTaskStatisticKey key = new StudentTaskStatisticKey();
				key.setStudentId(params.getString("studentId"));
				key.setTeacherId(params.getString("teacherId"));
				
				StudentTaskStatistic taskStatistic = taskStatisticDao.selectByPrimaryKey(key); 
				boolean isNewRecord = false;
				if(null == taskStatistic){		
					taskStatistic = new StudentTaskStatistic();
					taskStatistic.setAccomplishRate((short)0);
					taskStatistic.setCourseId(params.getByte("courseId"));
					taskStatistic.setCreateTime(new Date());
					taskStatistic.setFinishCount((short)0);
					taskStatistic.setGradeId(params.getShort("gradeId"));
					taskStatistic.setStudentId(params.getString("studentId"));
					taskStatistic.setTeacherId(params.getString("teacherId"));
					taskStatistic.setTotalTasks((short)1);
					taskStatistic.setUnfinishCount((short)1);
					taskStatistic.setUpdateTime(new Date());
					
					isNewRecord = true;
				} else{
					taskStatistic.setTotalTasks((short)(taskStatistic.getTotalTasks() + 1));
					taskStatistic.setUnfinishCount((short)(taskStatistic.getUnfinishCount()+1));
					taskStatistic.setUpdateTime(new Date());

					Double accomplishRate = taskStatistic.getFinishCount()*1.0/taskStatistic.getTotalTasks();
					accomplishRate *= 100;					
					taskStatistic.setAccomplishRate(accomplishRate.shortValue());					
				}				
								
				if(isNewRecord){
					taskStatisticDao.insertSelective(taskStatistic);
				} else{
					taskStatisticDao.updateByPrimaryKey(taskStatistic);
				}
				
				//推送作业消息通知
				//查找家长openId 用于推送消息
				String openId = null;
				try {
					Parents p = parentDao.selectByPrimaryKey(params.getString("parentId"));
					openId = p.getOpenid();
				} catch (Exception e) {
					throw new CommonRunException(-1, "查询家长失败！");
				}
				
				if(!StringUtils.isEmpty(openId)){
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
					List<String> values = new ArrayList<String>();
					values.add("");	//mark
					values.add(sdf.format(new Date()));
					Integer courseId = params.getInteger("courseId");
					String courseName = "无";
					if(null!=courseId){
						for(Course course : Course.values()){
							if(course.getValue() == courseId){
								courseName = course.toString();
								break;
							}
						}
					}
					
					values.add(courseName);
					values.add("同步作业");
					values.add(params.getString("videoCourseName"));
					List<String> colors = new ArrayList<String>();
					colors.add("#FF0000");colors.add("#FF0000");colors.add("#FF0000");
					colors.add("#FF0000");colors.add("#FF0000");
					
					logger.info("send task params:" + params);
					wechatService.sendTempletMsg2(WeiXinConfig.APPID, 
							WeiXinConfig.SECRET, 
							WeiXinConfig.TEACHER_DISTRIBUTE_TASK_TEMPLETE_ID, 
							params.getString("h5VideoLink"), 
							openId, values, colors, null);
				}
			} catch (Exception e) {
				throw new CommonRunException(-1, "更新/插入统计表失败！");
			}
			
		} catch (CommonRunException e) {
			throw e;
		} catch (Exception e) {
			throw new CommonRunException(-1, "插入作业记录失败！");
		}
		
		return 0;
	}

	@Override
	public List<JSONObject> getStuTaskList(JSONObject params) {
		List<JSONObject> datas = new ArrayList<JSONObject>();
		
		List<JSONObject> taskList = null;
		try {
			//查询布置的作业列表
			try {				
				taskList = studentTaskDao.selectAllByParams(params);
			} catch (Exception e) {
				logger.error("查询老师布置的作业失败！");
				throw new CommonRunException(-1, "查询老师布置的作业失败！");
			}
			
			//填充数据
			if(CollectionUtils.isNotEmpty(taskList)){
				Map<Byte,JSONArray> videoTypeMap = new HashMap<Byte,JSONArray>(); 
				for(JSONObject st : taskList){					
					Byte videoTaskType = st.getByte("videoTaskType");
					
					JSONArray videoGroupDetail = videoTypeMap.get(videoTaskType);
					if(null == videoGroupDetail){
						videoGroupDetail = new JSONArray();
						videoTypeMap.put(videoTaskType, videoGroupDetail);
					}
					
					videoGroupDetail.add(st);
				}
				
				//整合数据
				for(Byte videoType : videoTypeMap.keySet()){
					JSONObject videoGroup = new JSONObject();
					videoGroup.put("videoTaskType", videoType);	//1：同步作业，2：专题作业，3：假期作业
					videoGroup.put("videoTasks", videoTypeMap.get(videoType));
					
					datas.add(videoGroup);
				}
			}
		} catch (CommonRunException e) {
			throw e;
		} catch (Exception e) {
			logger.error("内部错误！");
			throw new CommonRunException(-1, "查询老师给当前学生布置的双师课程作业列表失败！");
		}
		
		return datas;
	}

	private String getUnionId(String appId, String appSecret, String openId) throws Exception{
		//获取access_token
		logger.info("调用微信接口获取access_token...");
		StringBuffer getTockenBuffer = new StringBuffer();
		getTockenBuffer
			.append("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential")
			.append("&appid=").append(appId)
			.append("&secret=").append(appSecret);
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
		
		return wxUnionId;
	}
}
