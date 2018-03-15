package com.xiaoyi.teacher.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.service.IWechatService;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.common.utils.ConstantUtil.LessonType;
import com.xiaoyi.common.utils.ConstantUtil.Level;
import com.xiaoyi.common.utils.ConstantUtil.Type;
import com.xiaoyi.common.utils.ConstantUtil.WithdrawStatus;
import com.xiaoyi.manager.dao.IOrderSumDao;
import com.xiaoyi.manager.dao.IOrdersDao;
import com.xiaoyi.manager.dao.IParentsDao;
import com.xiaoyi.manager.domain.OrderSum;
import com.xiaoyi.manager.domain.OrderSumKey;
import com.xiaoyi.manager.domain.Orders;
import com.xiaoyi.manager.domain.Parents;
import com.xiaoyi.teacher.dao.ILessonTradeDao;
import com.xiaoyi.teacher.dao.ILessonTradeSumDao;
import com.xiaoyi.teacher.dao.ISuggestionsDao;
import com.xiaoyi.teacher.dao.ITeachingRecordDao;
import com.xiaoyi.teacher.domain.LessonTrade;
import com.xiaoyi.teacher.domain.LessonTradeSum;
import com.xiaoyi.teacher.domain.Suggestions;
import com.xiaoyi.teacher.domain.TeachingRecord;
import com.xiaoyi.teacher.service.ITeachingRecordService;
import com.xiaoyi.wechat.utils.WeiXinConfig;

@Service("recordService")
public class TeachingRecordService implements ITeachingRecordService {

	@Resource
	ITeachingRecordDao teachingRecordDao;
	
	@Resource
	ILessonTradeDao lessonTradeDao;
	
	@Resource
	ILessonTradeSumDao tradeSumDao;
	
	@Resource
	ISuggestionsDao suggestionDao;
	
	@Resource
	IOrderSumDao orderSumDao;
	
	@Resource 
	IOrdersDao ordersDao;
	
	@Resource
	IParentsDao parentDao;
	
	@Autowired
	private IWechatService wechatService;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public List<JSONObject> getRecordList(JSONObject params) throws Exception {
		try {
			List<JSONObject> datas = teachingRecordDao.selectRecordsByTid(params.getString("teacherId"));
			//转换年级代码
			if(!CollectionUtils.isEmpty(datas)) {
				for(JSONObject data : datas) {
					Integer gradeId = data.getInteger("gradeId");
					
					if(null!=gradeId) {
						for(Level level : Level.values()) {
							if(level.getValue() == Math.abs(gradeId)/10) {
								data.put("gradeName", level.toString());
								break;
							}
						}
					}
				}
			}
			return datas;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}		
	}
	
	@Transactional
	@Override
	public int insertTeachingRecords(JSONObject params) {
		try {
			String orderId  = params.getString("orderId");
			String teacherId = params.getString("teacherId");
			String teachingId = params.getString("teachingId");
			Integer lessontype = params.getInteger("lessonType");
			String parentId = params.getString("parentId");
			String memberId = params.getString("memberId");
			
			//判断是否已存在提现记录（当月）
			Map<String,Object> reqParams = new HashMap<String,Object>();
			reqParams.put("teacherId", teacherId);
			reqParams.put("parentId", parentId);
			reqParams.put("memberId", memberId);
			reqParams.put("lessonType", lessontype);
			reqParams.put("queryDate", new SimpleDateFormat("yyyyMM").format(new Date()));
			
			try {
				//判断参数
				if(StringUtils.isEmpty(teacherId) || StringUtils.isEmpty(parentId)
						|| StringUtils.isEmpty(memberId) || StringUtils.isEmpty(lessontype)
						|| StringUtils.isEmpty(reqParams.get("queryDate"))){
					return -1;	//参数错误！
				}
				
				List<LessonTrade>records = teachingRecordDao.selectTeacherLessonTradeByParams(reqParams);				
				if(!CollectionUtils.isEmpty(records)){
					return -2;	//不允许重复提交提现
				}
			} catch (Exception e) {
				logger.info("查询当月提现失败！");
				logger.error(e.getMessage());
				return -3;
			}
			
			
			List<TeachingRecord> teachingRecords = new ArrayList<TeachingRecord>();
			JSONArray teachingDetails = null;
			try {
				teachingDetails = params.getJSONArray("teachingDetails");
			}catch (Exception e) {
				logger.info("Can not get teachingDetails");
				logger.error(e.getMessage());
				return -1;
			}
			
			String lessonTradeId = UUID.randomUUID().toString();
			//1.增加老师带课记录
			int totalLessons = 0;
			if(!CollectionUtils.isEmpty(teachingDetails)){
				for(Object obj : teachingDetails){
					JSONObject teachingDetail = (JSONObject)obj;
					TeachingRecord record = new TeachingRecord();
					record.setOrderid(orderId);
					record.setRecordid(UUID.randomUUID().toString());
					record.setTeacherid(teacherId);
					record.setTeachingid(teachingId);
					record.setStarttime(teachingDetail.getString("startTime"));
					record.setEndtime(teachingDetail.getString("endTime"));
					record.setTeachingdate(teachingDetail.getDate("teachingDate"));
					record.setTeachingnum(teachingDetail.getShort("checkNum"));
					record.setLessonTradeId(lessonTradeId);	//关联老师提现
					
					teachingRecords.add(record);
					
					//提现课时数
					totalLessons+=teachingDetail.getInteger("checkNum");
				}
				try {
					teachingRecordDao.insertTeachingRecords(teachingRecords);				
				} catch (Exception e) {
					throw e;
				}
				
				//2、增加提现记录				
				LessonTrade lessonTrade = new LessonTrade();
				lessonTrade.setLessontradeid(lessonTradeId);
				lessonTrade.setApplylessons((short)totalLessons);
				lessonTrade.setLessontype(lessontype);
				lessonTrade.setParentid(parentId);
				lessonTrade.setMemberid(memberId);
				lessonTrade.setTeacherid(teacherId);
				lessonTrade.setStatus((byte) 1);	//1: 已提交, 2：提现成功, -1：提现失败
				lessonTrade.setApplytime(new Date());
				
				try {
					lessonTradeDao.insertSelective(lessonTrade);
				} catch (Exception e) {
					logger.error("添加提现记录失败！");
					e.printStackTrace();
					throw e;
				}
				
				//3、更新建议表及提现汇总表
				try {
					//建议表
					Suggestions suggestion = new Suggestions();
					
					suggestion.setLessontradeid(lessonTradeId);
					suggestion.setSituations(params.getString("situations"));
					suggestion.setSuggestions(params.getString("suggestions"));
					try {
						suggestionDao.insertSelective(suggestion);						
					} catch (Exception e) {
						logger.error("插入建议表出错！");
						throw e;
					}
					
					//提现汇总表
					try {
						LessonTradeSum tradeSum = tradeSumDao.selectByPrimaryKey(teacherId);
						int totalSubLessons = totalLessons;
						if(null==tradeSum){
							tradeSum = new LessonTradeSum();
							tradeSum.setTeacherid(teacherId);
							tradeSum.setTotallessonnum((short) 0);
							
							tradeSumDao.insertSelective(tradeSum);
						}
						
						tradeSum.setTeacherid(teacherId);
						tradeSum.setTotallessonnum((short)(totalSubLessons+tradeSum.getTotallessonnum()));
						
						tradeSumDao.updateByPrimaryKeySelective(tradeSum);
					} catch (Exception e) {
						logger.error("插入汇总表出错！");
						throw e;
					}
					
					int leftLessonCount = 0;
					//更新用户订单课时数（家长）
					try {
						OrderSumKey key = new OrderSumKey();
						key.setOrderid(orderId);
						OrderSum orderSum = orderSumDao.selectByPrimaryKey(key);											
						orderSum.setLessonleftnum((short)(orderSum.getLessonleftnum()-totalLessons));
						
						//新增家长端老师提现记录
						Orders order = new Orders();
						order.setOrderid(UUID.randomUUID().toString());
						order.setCreatetime(new Date());
						order.setLessontype(orderSum.getLessontype());
						order.setMemberid(orderSum.getMemberid());
						order.setOrderType(-1);
						order.setParentid(orderSum.getParentid());
						order.setPurchasenum((short)-totalLessons);
						
						//提现记录入库
						ordersDao.insert(order);
						
						//更新用户总课时
						orderSumDao.updateByPrimaryKeySelective(orderSum);						
						leftLessonCount = orderSum.getLessonleftnum();
					} catch (Exception e) {
						e.printStackTrace();
						throw e;
					}
					
					try {
						logger.info("根据家长parentId查询家长【params】："+parentId);
						Parents parents = parentDao.selectByPrimaryKey(parentId);
						if(null==parents || null==parents.getOpenid()){
							logger.info("家长查询为空/家长openId为空！！");
							return -1;
						}
						
						//根据家长openId开始推送消息（确认老师提现）
						//消息推送给家长，进行确认
						JSONObject data = new JSONObject();
						JSONObject first = new JSONObject();
						first.put("value", "课时确认");
						first.put("color", "#173177");
						data.put("first", first);
						
						JSONObject keyword1 = new JSONObject();
						keyword1.put("value", "XX老师");
						keyword1.put("color", "#173177");		
						data.put("keyword1", keyword1);
						
						JSONObject keyword2 = new JSONObject();
						keyword2.put("value", "补习");
						keyword2.put("color", "#173177");		
						data.put("keyword2", keyword2);
						params.put("data", data);
						
						JSONObject keyword3 = new JSONObject();
						keyword3.put("value", leftLessonCount+" 小时");
						keyword3.put("color", "#173177");		
						data.put("keyword3", keyword3);						
						String extraParams="?teachingId="+teachingId;
						logger.info("extraParams:"+extraParams);
						wechatService.sendTempletMsg(WeiXinConfig.LESSON_CONFIRM_MSG_TEMPLETE_ID, 
								WeiXinConfig.LEFFON_CONFIRM_REDIRECT_URL + extraParams, 
								parents.getOpenid(), 
								data);
					} catch (Exception e) {
						logger.error("查询家长角色出错！");
						logger.error(e.getMessage());
					}
				} catch (Exception e) {
					e.printStackTrace();
					throw e;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return 0;
	}

	@Override
	public JSONObject getTRecordSum(JSONObject params) throws Exception {
		try {
			LessonTradeSum tradeSum = tradeSumDao.selectByPrimaryKey(params.getString("teacherId"));
			if(null!=tradeSum) {
				JSONObject tradeSumMap = new JSONObject();
				tradeSumMap.put("totalIncome", tradeSum.getTotalincome());
				tradeSumMap.put("withDrawLessonNum", tradeSum.getWithdrawlessonnum());
				tradeSumMap.put("checkedLessonNum", tradeSum.getCheckedlessonnum());
				tradeSumMap.put("frozenLessonNum", tradeSum.getFrozenlessonnum());
				
				return tradeSumMap;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	/**
	 * "parentName":"王家长",
		"status": 提现状态,
		"telNum":"18711018800",
		"studentName":"333333",
		"notes": 评价,
		"lessonType": 212,
		"feedback": 家长反馈,
		"applyLessons": 申请提现课时数,
		“actualIncome”: 实际到账课时
	 */
	@Override
	public List<JSONObject> queryWithdrawRecords(JSONObject params) {
		try {
			List<JSONObject> lessonTradeList = teachingRecordDao.selectLSRecordByParams(params);
			if(!CollectionUtils.isEmpty(lessonTradeList)){
				//List<JSONObject> datas = new ArrayList<JSONObject>();
				for(JSONObject lt : lessonTradeList){
					//补全上门类型
					if(lt.getInteger("lessonType")!=null){
						String type = lt.getInteger("lessonType")>0
								?Type.STU_GO.toString():Type.TEA_GO.toString();
						lt.put("type", type);
						
						//补全年级名称
						LessonType lessonType = LessonType.convert(lt.getIntValue("lessonType"));
						if(null!=lessonType){
							lt.put("gradeName", lessonType.getGradeName(false));							
						}
						
						Integer status = lt.getInteger("status");
						if(null!=status) {
							//计算实际到账课时数
							Float applyLessons = lt.getFloat("applyLessons");
							Float frozenLessons = lt.getFloat("frozenLessons");
							if(null!=applyLessons && status.intValue()==0) {
								if(frozenLessons==null) {
									frozenLessons=0f;
								}
								lt.put("actualIncome", applyLessons-frozenLessons);
							}else {
								lt.put("actualIncome", 0);
							}
						
							//转换提现状态  
							WithdrawStatus withDrawStatus = WithdrawStatus.convert(lt.getIntValue("status"));
							if(null!=withDrawStatus) {
								lt.put("status", withDrawStatus.toString());
							}
						}
					}
					
				}
				return lessonTradeList;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}
