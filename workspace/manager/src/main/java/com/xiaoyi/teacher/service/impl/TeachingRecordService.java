package com.xiaoyi.teacher.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
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
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.LessonType;
import com.xiaoyi.common.utils.ConstantUtil.Level;
import com.xiaoyi.common.utils.ConstantUtil.Type;
import com.xiaoyi.common.utils.ConstantUtil.WithdrawStatus;
import com.xiaoyi.manager.dao.IOrderSumDao;
import com.xiaoyi.manager.dao.IOrdersDao;
import com.xiaoyi.manager.dao.IParentsDao;
import com.xiaoyi.manager.dao.ISendTmpMsgFailedDao;
import com.xiaoyi.manager.dao.ITeacherDao;
import com.xiaoyi.manager.domain.OrderSum;
import com.xiaoyi.manager.domain.OrderSumKey;
import com.xiaoyi.manager.domain.Orders;
import com.xiaoyi.manager.domain.Parents;
import com.xiaoyi.manager.domain.SendTmpMsgFailed;
import com.xiaoyi.manager.domain.Teacher;
import com.xiaoyi.manager.service.IAccountService;
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

	@Resource
	ITeacherDao teacherDao;

	@Resource
	ISendTmpMsgFailedDao msgFaildDao;
	
	@Autowired
	private IWechatService wechatService;

	@Autowired
	private IAccountService accountService;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public List<JSONObject> getRecordList(JSONObject params) throws Exception {
		try {
			List<JSONObject> datas = teachingRecordDao.selectRecordsByTid(params.getString("teacherId"));
			//每月1-10号提现,其他时间不允许提现
			Calendar c = Calendar.getInstance(TimeZone.getTimeZone("GMT+08:00"));    //获取东八区时间
	        int day = c.get(Calendar.DAY_OF_MONTH);	        
	        int status = (day<=10 && 1<=day)?0:2;
			// 转换年级代码
			if (!CollectionUtils.isEmpty(datas)) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
				for (JSONObject data : datas) {
					Integer gradeId = data.getInteger("gradeId");
					
					//判断当前月份是否已提现
					try {
						if(status!=2){
							List<String> queryDates = new ArrayList<String>();
							queryDates.add(sdf.format(new Date()));
							JSONObject reqParams = new JSONObject();
							reqParams.putAll(data);
							reqParams.put("queryDates", queryDates);
							List<LessonTrade> lts = teachingRecordDao.selectTeacherLessonTradeByParams(reqParams);
							
							if(!CollectionUtils.isEmpty(lts)){
								status = 1;	//已提现
							}else{
								status = 0;	//可提现
							}
						}
						data.put("status", status);
					} catch (Exception e) {
						e.printStackTrace();
						logger.info("查询当月是否提现失败！");
					}
					if (null != gradeId) {
						for (Level level : Level.values()) {
							if (level.getValue() == Math.abs(gradeId) / 10) {
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
			String orderId = params.getString("orderId");
			String teacherId = params.getString("teacherId");
			String teachingId = params.getString("teachingId");
			Integer lessontype = params.getInteger("lessonType");
			String parentId = params.getString("parentId");
			String memberId = params.getString("memberId");

			//处理代买的情况（家长不一样）
			try {
				OrderSumKey key = new OrderSumKey();
				key.setOrderid(orderId);
				OrderSum orderSum = orderSumDao.selectByPrimaryKey(key);
				if(null!=orderSum && !parentId.equals(orderSum.getParentid())){
					parentId = orderSum.getParentid();
				}
			} catch (Exception e) {
				logger.info("查询订单汇总表失败！");
				e.printStackTrace();
				return -1;
			}
			
			
			// 判断是否已存在提现记录（当月）
			Map<String, Object> reqParams = new HashMap<String, Object>();
			reqParams.put("teacherId", teacherId);
			reqParams.put("parentId", parentId);
			reqParams.put("memberId", memberId);
			reqParams.put("lessonType", lessontype);

			JSONArray teachingDetails = null;
			List<String> queryDates = new ArrayList<String>();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
			try {
				teachingDetails = params.getJSONArray("teachingDetails");

				for (Object obj : teachingDetails) {
					JSONObject details = (JSONObject) obj;
					Date applyDate = details.getDate("teachingDate");

					if (!StringUtils.isEmpty(applyDate)) {
						// queryDates.add(sdf.format(applyDate));
					}
				}
				queryDates.add(sdf.format(new Date()));
			} catch (Exception e) {
				logger.info("Can not get teachingDetails");
				logger.error(e.getMessage());
				return -1;
			}
			/* reqParams.put("queryDate", sdf.format(new Date())); */
			reqParams.put("queryDates", queryDates);
			try {
				// 判断参数
				if (StringUtils.isEmpty(teacherId) || StringUtils.isEmpty(parentId) || StringUtils.isEmpty(memberId)
						|| StringUtils.isEmpty(lessontype)
				/* || StringUtils.isEmpty(reqParams.get("queryDate")) */) {
					return -1; // 参数错误！
				}

				// 避免重复提交
				List<LessonTrade> records = null;
				synchronized (this) {
					records = teachingRecordDao.selectTeacherLessonTradeByParams(reqParams);
					/*
					 * queryDates.clear(); for(LessonTrade record : records){
					 * queryDates.add(sdf.format(record.getApplytime())); }
					 */
				}
				if (!CollectionUtils.isEmpty(records)) {

					return -2; // 不允许重复提交提现
				}
			} catch (Exception e) {
				logger.info("查询当月提现失败！");
				logger.error(e.getMessage());
				return -3;
			}

			List<TeachingRecord> teachingRecords = new ArrayList<TeachingRecord>();

			// String lessonTradeId = UUID.randomUUID().toString();
			// 1.增加老师带课记录
			Float totalLessons = 0f;
			List<Date> addedRecordDates = new ArrayList<Date>();
			Map<String, Date> lessonTradeIdDateMap = new HashMap<String, Date>();			

			String lessonTradeId = UUID.randomUUID().toString();
			if (!CollectionUtils.isEmpty(teachingDetails)) {
				for (Object obj : teachingDetails) {
					JSONObject teachingDetail = (JSONObject) obj;
					TeachingRecord record = new TeachingRecord();
					Date teachingDate = teachingDetail.getDate("teachingDate");
					logger.info("teaching date:" + sdf.format(teachingDate));
					try {
						if (queryDates.contains(sdf.format(teachingDate))) {
							//continue;
						}
					} catch (Exception e) {
						logger.info("适配日期失败,自动忽略该条记录！");
						continue;
					}

					// lessonTradeId
					/*
					 * String lessonTradeId =null;
					 * if(lessonDateTradeIdMap.keySet()!=null &&
					 * lessonDateTradeIdMap.keySet().contains(sdf.format(
					 * teachingDate))){ lessonTradeId =
					 * lessonDateTradeIdMap.get(teachingDate); }else{
					 * lessonTradeId = UUID.randomUUID().toString(); }
					 */

					record.setOrderid(orderId);
					record.setRecordid(UUID.randomUUID().toString());
					record.setTeacherid(teacherId);
					record.setTeachingid(teachingId);
					record.setStarttime(teachingDetail.getString("startTime"));
					record.setEndtime(teachingDetail.getString("endTime"));
					record.setTeachingdate(teachingDate);
					record.setTeachingnum(teachingDetail.getFloat("checkNum"));
					record.setLessonTradeId(lessonTradeId); // 关联老师提现

					teachingRecords.add(record);

					addedRecordDates.add(teachingDate);
					lessonTradeIdDateMap.put(lessonTradeId, teachingDate);
					// 提现课时数
					totalLessons += teachingDetail.getFloat("checkNum");
				}
				try {
					// 已经提现
					if (teachingRecords.size() == 0) {
						return -2;
					}
					teachingRecordDao.insertTeachingRecords(teachingRecords);
				} catch (Exception e) {
					throw e;
				}

				// 2、增加提现记录
				LessonTrade lessonTrade = new LessonTrade();
				lessonTrade.setLessontradeid(lessonTradeId);
				lessonTrade.setApplylessons(totalLessons);
				lessonTrade.setLessontype(lessontype);
				lessonTrade.setParentid(parentId);
				lessonTrade.setMemberid(memberId);
				lessonTrade.setTeacherid(teacherId);
				lessonTrade.setStatus((byte) 1); // -1：提现失败 0：已提现 1：已提交，待家长确认
													// 2：家长已确认，待管理员审核中
				lessonTrade.setApplytime(
						new Date()/* lessonTradeIdDateMap.get(lessonTradeId) */);

				try {
					lessonTradeDao.insertSelective(lessonTrade);
				} catch (Exception e) {
					logger.error("添加提现记录失败！");
					e.printStackTrace();
					throw e;
				}

				// 3、更新建议表及提现汇总表
				try {
					// 建议表
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

					// 提现汇总表
					try {
						LessonTradeSum tradeSum = tradeSumDao.selectByPrimaryKey(teacherId);
						Float totalSubLessons = totalLessons;
						if (null == tradeSum) {
							tradeSum = new LessonTradeSum();
							tradeSum.setTeacherid(teacherId);
							tradeSum.setTotallessonnum(totalSubLessons);
							
							tradeSumDao.insertSelective(tradeSum);
						} else {
							tradeSum.setTeacherid(teacherId);
							if(null!=tradeSum.getTotallessonnum()){
								tradeSum.setTotallessonnum(totalSubLessons + tradeSum.getTotallessonnum());								
							} else {
								tradeSum.setTotallessonnum(totalSubLessons);
							}

							tradeSumDao.updateByPrimaryKeySelective(tradeSum);
						}
					} catch (Exception e) {
						logger.error("插入汇总表出错！");
						throw e;
					}

					Float leftLessonCount = 0f;
					// 更新用户订单课时数（家长）
					try {
						OrderSumKey key = new OrderSumKey();
						key.setOrderid(orderId);
						OrderSum orderSum = orderSumDao.selectByPrimaryKey(key);
						leftLessonCount = orderSum.getLessonleftnum() - totalLessons;
						orderSum.setLessonleftnum(leftLessonCount);

						// 新增家长端老师提现记录
						Orders order = new Orders();
						order.setOrderid(UUID.randomUUID().toString());
						order.setCreatetime(new Date());
						order.setLessontype(orderSum.getLessontype());
						order.setMemberid(orderSum.getMemberid());
						order.setOrderType(-1);
						order.setParentid(orderSum.getParentid());
						order.setPurchasenum(-totalLessons);

						// 提现记录入库
						ordersDao.insert(order);

						// 更新用户总课时
						orderSumDao.updateByPrimaryKeySelective(orderSum);
						//leftLessonCount = orderSum.getLessonleftnum();
						
						//剩余课时小于6个小时,自动触发缴费提醒
						if(orderSum.getLessonleftnum()<=6){
							Map<String,Object> obj = new HashMap<String,Object>();
							obj.put("orderIds", orderId);
							accountService.sendMsgsToSelectedCustom(obj);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
						throw e;
					}

					try {
						logger.info("根据家长parentId查询家长【params】：" + parentId);
						Parents parents = parentDao.selectByPrimaryKey(parentId);
						if (null == parents || null == parents.getOpenid()) {
							logger.info("家长查询为空/家长openId为空！！");
							return -1;
						}

						String teacherName = null;
						try {
							Teacher teacher = teacherDao.selectByPrimaryKey(teacherId);
							teacherName = teacher.getTeachername();
						} catch (Exception e) {
							logger.info("查询老师失败！");
							e.printStackTrace();
						}

						// SimpleDateFormat sdf = new
						// SimpleDateFormat("yyyy-MM-");
						// 根据家长openId开始推送消息（确认老师提现）
						// 消息推送给家长，进行确认
						JSONObject data = new JSONObject();
						JSONObject first = new JSONObject();
						first.put("value", "家长您好：");
						first.put("color", "#173177");
						data.put("first", first);

						JSONObject keyword1 = new JSONObject();
						keyword1.put("value", teacherName);
						keyword1.put("color", "#173177");
						data.put("keyword1", keyword1);

						LessonType lt = LessonType.convert(lessontype);
						JSONObject keyword2 = new JSONObject();
						keyword2.put("value", lt.getGradeName(false));
						keyword2.put("color", "#173177");
						data.put("keyword2", keyword2);
						params.put("data", data);
						
						JSONObject keyword3 = new JSONObject();
						keyword3.put("value", totalLessons+"(剩余："+leftLessonCount+")");
						keyword3.put("color", "#173177");
						data.put("keyword3", keyword3);
						params.put("data", data);

						JSONObject keyword4 = new JSONObject();
						keyword4.put("value", sdf.format(new Date()));
						keyword4.put("color", "#173177");
						data.put("keyword4", keyword4);
						params.put("data", data);
						
						JSONObject remark = new JSONObject();
						remark.put("value", "点击查看授课详情...");
						remark.put("color", "#FF4500");
						data.put("remark", remark);

						Calendar cal = Calendar.getInstance();
						int month = cal.get(Calendar.MONTH);

						StringBuffer extraParams = new StringBuffer();
						extraParams.append("?lessonTradeId=");
						extraParams.append(lessonTradeId);

						extraParams.append("&month=");
						extraParams.append(month);
						// 需联系前台更改
						extraParams.append("&teachingId=");
						extraParams.append(teachingId);

						logger.info("extraParams:" + extraParams.toString());
						//已捕获异常
						String result = wechatService.sendTempletMsg(WeiXinConfig.CUSTOM_LESSON_CONFIRM_MSG_TEMPLETE_ID/*LESSON_CONFIRM_MSG_TEMPLETE_ID*/,
								WeiXinConfig.LEFFON_CONFIRM_REDIRECT_URL + extraParams.toString(), parents.getOpenid(),
								data);
						
						//存储模板消息发送结果
						SendTmpMsgFailed msgFailed = new SendTmpMsgFailed();
						msgFailed.setLessontradeid(lessonTradeId);
						msgFailed.setOpenid(parents.getOpenid());
						msgFailed.setCreatetime(new Date());
						msgFailed.setMsgContent(data.toJSONString());
						msgFailed.setTargetUrl(WeiXinConfig.LEFFON_CONFIRM_REDIRECT_URL + extraParams.toString());
						msgFailed.setTempletId(WeiXinConfig.CUSTOM_LESSON_CONFIRM_MSG_TEMPLETE_ID/*LESSON_CONFIRM_MSG_TEMPLETE_ID*/);
						msgFailed.setRepeatedTimes((byte)0);
					
						//默认失败
						msgFailed.setStatus((byte)-1);
						if(null!=result){
							//解析结果
							try {
								JSONObject rtJSON = JSONObject.parseObject(result);
								
								if(null!=rtJSON){									
									msgFailed.setMsgid(rtJSON.getString("msgid"));	
									msgFailed.setStatus((byte)(rtJSON.getIntValue("errcode")==0?0:-1));
								}
							} catch (Exception e) {
								e.printStackTrace();
								logger.info("解析模板消息发送结果失败！");
							}
						}
												
						//插入发送失败模板表
						try {							
							msgFaildDao.insertSelective(msgFailed);
						} catch (Exception e) {
							logger.info("插入模板消息失败！");
							e.printStackTrace();
						}
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
			JSONObject tradeSumMap = new JSONObject();

			if (null == tradeSum) {
				tradeSum = new LessonTradeSum();
			}
			tradeSumMap.put("totalIncome", tradeSum.getTotalincome() == null ? 0 : tradeSum.getTotalincome());
			tradeSumMap.put("withDrawLessonNum",
					tradeSum.getWithdrawlessonnum() == null ? 0 : tradeSum.getWithdrawlessonnum());
			tradeSumMap.put("checkedLessonNum",
					tradeSum.getCheckedlessonnum() == null ? 0 : tradeSum.getCheckedlessonnum());
			tradeSumMap.put("frozenLessonNum",
					tradeSum.getFrozenlessonnum() == null ? 0 : tradeSum.getFrozenlessonnum());

			return tradeSumMap;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	/**
	 * "parentName":"王家长", "status": 提现状态, "telNum":"18711018800",
	 * "studentName":"333333", "notes": 评价, "lessonType": 212, "feedback": 家长反馈,
	 * "applyLessons": 申请提现课时数, “actualIncome”: 实际到账课时
	 */
	@Override
	public List<JSONObject> queryWithdrawRecords(JSONObject params) {
		try {
			List<JSONObject> lessonTradeList = teachingRecordDao.selectLSRecordByParams(params);
			if (!CollectionUtils.isEmpty(lessonTradeList)) {
				// List<JSONObject> datas = new ArrayList<JSONObject>();
				for (JSONObject lt : lessonTradeList) {
					// 补全上门类型
					if (lt.getInteger("lessonType") != null) {
						String type = lt.getInteger("lessonType") > 0 ? Type.STU_GO.toString() : Type.TEA_GO.toString();
						lt.put("type", type);

						// 补全年级名称
						LessonType lessonType = LessonType.convert(lt.getIntValue("lessonType"));
						if (null != lessonType) {
							lt.put("gradeName", lessonType.getGradeName(false));
						}

						Integer status = lt.getInteger("status");
						if (null != status) {
							// 计算实际到账课时数
							Float applyLessons = lt.getFloat("applyLessons");
							Float frozenLessons = lt.getFloat("frozenLessons");
							if (null != applyLessons && status.intValue() == 0) {
								if (frozenLessons == null) {
									frozenLessons = 0f;
								}
								lt.put("actualIncome", applyLessons - frozenLessons);
							} else {
								lt.put("actualIncome", 0);
							}

							// 转换提现状态
							WithdrawStatus withDrawStatus = WithdrawStatus.convert(lt.getIntValue("status"));
							if (null != withDrawStatus) {
								lt.put("status", withDrawStatus.toString());
							}
						}
					}

				}
				return lessonTradeList;
			}
			if(null==lessonTradeList){
				lessonTradeList = new ArrayList<JSONObject>();
			}
			return lessonTradeList;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	@Transactional
	@Override
	public int updateLessonTrade(
			String lessonTradeId/* , Integer updatedFrozenLessons */) {
		// int rtcode = 0;
		if (StringUtils.isEmpty(lessonTradeId)) {
			return 0;
		}
		LessonTrade record = null;
		try {
			logger.info("查询老师提现记录【LessonTradeId】：" + lessonTradeId);
			record = lessonTradeDao.selectByPrimaryKey(lessonTradeId);
		} catch (Exception e) {
			logger.info("查询老师提现记录失败！");
			e.printStackTrace();
		}
		// 设置老师提现成功
		record.setStatus((byte) 0);

		// 更新老师课时提现状态
		try {
			lessonTradeDao.updateByPrimaryKeySelective(record);
		} catch (Exception e) {
			logger.info("更新提现状态失败！");
			logger.error(e.getMessage());
			throw e;
		}

		// 更新老师实际到账数额
		String teacherId = record.getTeacherid();
		LessonTradeSum tradeSum = null;
		try {
			tradeSum = tradeSumDao.selectByPrimaryKey(teacherId);			
			// tradeSum.setFrozenlessonnum(updatedFrozenLessons.shortValue());
			if(null==tradeSum){
				tradeSum = new LessonTradeSum();
				tradeSum.setTotalincome(0d);
				
				Float applyLessons = 0f;
				if(record.getApplylessons()!=null){
					applyLessons = record.getApplylessons();
				}
				tradeSum.setTotallessonnum(applyLessons);
				tradeSum.setCheckedlessonnum(applyLessons);
				tradeSum.setFrozenlessonnum(0f);
				tradeSum.setWithdrawlessonnum(applyLessons);
			}
			
			tradeSum.setTeacherid(teacherId);
			if(tradeSum.getTotalincome()==null){
				tradeSum.setTotalincome(0d);
			}
			tradeSum.setTotalincome(record.getActualPay() + tradeSum.getTotalincome());
			if(tradeSum.getWithdrawlessonnum()==null){
				tradeSum.setWithdrawlessonnum(0f);
			}
			tradeSum.setWithdrawlessonnum((record.getApplylessons()+tradeSum.getWithdrawlessonnum()));
			
			return tradeSumDao.updateByPrimaryKeySelective(tradeSum);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}
