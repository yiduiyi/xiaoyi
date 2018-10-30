package com.xiaoyi.custom.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.exception.CommonRunException;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.LessonType;
import com.xiaoyi.common.utils.ConstantUtil.Level;
import com.xiaoyi.common.utils.ConstantUtil.Semaster;
import com.xiaoyi.common.utils.DateUtils;
import com.xiaoyi.custom.dao.ICustomDao;
import com.xiaoyi.custom.dao.IDaulVideoOrderDao;
import com.xiaoyi.custom.dao.IStudentTaskDao;
import com.xiaoyi.custom.dao.IStudentTaskStatisticDao;
import com.xiaoyi.custom.domain.DaulVideoOrder;
import com.xiaoyi.custom.domain.StudentTask;
import com.xiaoyi.custom.domain.StudentTaskStatistic;
import com.xiaoyi.custom.domain.StudentTaskStatisticKey;
import com.xiaoyi.custom.service.ICustomService;
import com.xiaoyi.manager.dao.ILessonTypeDao;
import com.xiaoyi.manager.dao.IOrderSumDao;
import com.xiaoyi.manager.dao.IParentsDao;
import com.xiaoyi.manager.dao.IScheduleDao;
import com.xiaoyi.manager.dao.IStudentDao;
import com.xiaoyi.manager.dao.ITeacherDao;
import com.xiaoyi.manager.dao.ITeacherPayListDao;
import com.xiaoyi.manager.dao.ITradeComplainsDao;
import com.xiaoyi.manager.domain.LessonTypeKey;
import com.xiaoyi.manager.domain.OrderSum;
import com.xiaoyi.manager.domain.OrderSumKey;
import com.xiaoyi.manager.domain.Orders;
import com.xiaoyi.manager.domain.ParentStuRelation;
import com.xiaoyi.manager.domain.Parents;
import com.xiaoyi.manager.domain.Schedule;
import com.xiaoyi.manager.domain.Student;
import com.xiaoyi.manager.domain.Teacher;
import com.xiaoyi.manager.domain.TradeComplains;
import com.xiaoyi.manager.service.ICommonService;
import com.xiaoyi.teacher.dao.ILessonTradeDao;
import com.xiaoyi.teacher.dao.ILessonTradeSumDao;
import com.xiaoyi.teacher.dao.ISuggestionsDao;
import com.xiaoyi.teacher.dao.ITeacherBalanceDao;
import com.xiaoyi.teacher.dao.ITeacherBalanceFromDao;
import com.xiaoyi.teacher.dao.ITeachingRelationshipDao;
import com.xiaoyi.teacher.domain.ClassFees;
import com.xiaoyi.teacher.domain.LessonTrade;
import com.xiaoyi.teacher.domain.LessonTradeSum;
import com.xiaoyi.teacher.domain.Suggestions;
import com.xiaoyi.teacher.domain.TeachingRecord;
import com.xiaoyi.teacher.domain.TeachingRelationship;
import com.xiaoyi.teacher.service.IClassFeesService;

@Service("customService")
public class CumstomServiceImpl implements ICustomService {

	@Resource
	IParentsDao parentDao;

	@Resource
	ICustomDao customDao;

	@Resource
	IScheduleDao scheduleDao;

	@Resource
	ITeacherDao teacherDao;

	@Resource
	IStudentDao studentDao;

	@Resource
	ILessonTradeDao lessonTradeDao;

	@Resource
	ILessonTradeSumDao tradeSumDao;

	@Resource
	ISuggestionsDao suggestionDao;

	@Resource
	ITeacherPayListDao payListDao;

	@Resource
	IOrderSumDao orderSumDao;

	@Resource
	ILessonTypeDao lessonTypeDao;

	@Resource
	ITeacherBalanceFromDao balanceFromDao;

	@Resource
	ITeacherBalanceDao balanceDao;

	@Resource
	ICommonService commonService;

	@Resource
	ITradeComplainsDao tradeCompainsDao;

	@Resource
	IClassFeesService classFeesService;
	
	@Resource 
	IDaulVideoOrderDao daulOrderDao;
	
	@Resource 
	ITeachingRelationshipDao teachingRelationshipDao;
	
	@Resource
	IStudentTaskDao studentTaskDao;
	
	@Resource
	IStudentTaskStatisticDao studentTaskStatisticDao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public List<JSONObject> queryTransactionCourses(String openId) {
		List<JSONObject> datas = new ArrayList<JSONObject>();
		try {
			// 查询家长微信号对应的parentId
			Parents parents = null;
			try {
				parents = parentDao.selectByOpenId(openId);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			String parentId = null;
			if (null != parents) {
				parentId = parents.getParentid();
			}

			// 查询家长对应的课时购买与消费情况
			List<Orders> orderList = null;
			try {
				orderList = customDao.selectTransactionOrders(parentId);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}

			// 必须是非空集合
			if (CollectionUtils.isEmpty(orderList)) {
				return datas;
			}

			SimpleDateFormat myFmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			JSONObject lessonSummary = new JSONObject(); // 学生生门
			JSONObject lessonSummary1 = new JSONObject();	//一对二
			JSONObject lessonSummary2 = new JSONObject(); // 老师上门
			JSONObject lessonSummary3 = new JSONObject(); // 双师
			for (Orders order : orderList) {
				JSONArray details = null;

				// 学生上门
				JSONObject detail = new JSONObject();
				switch(order.getTeachingWay()){
				case 0:
					details = lessonSummary.getJSONArray("details");
					if (null == details) {
						details = new JSONArray();										
					}
					lessonSummary.put("details", details);
					lessonSummary.put("orderType", 0);
					break;
				case 1:
					details = lessonSummary2.getJSONArray("details");
					if (null == details) {
						details = new JSONArray();										
					}
					lessonSummary2.put("details", details);
					lessonSummary2.put("orderType", 1);
					break;					
				case 2:
					details = lessonSummary1.getJSONArray("details");
					if (null == details) {
						details = new JSONArray();										
					}
					lessonSummary1.put("details", details);
					lessonSummary1.put("orderType", 2);
					break;
				case 3:
				case 4:
					details = lessonSummary3.getJSONArray("details");
					if (null == details) {
						details = new JSONArray();										
					}
					lessonSummary3.put("details", details);
					lessonSummary3.put("orderType", 3);
					break;
				}				
				detail.put("teachingTime", myFmt.format(order.getCreatetime()));
				
				/*if (order.getLessontype() > 0) {
					details = lessonSummary.getJSONArray("details");
					if (null == details) {
						details = new JSONArray();
						lessonSummary.put("details", details);
						lessonSummary.put("orderType", "of");
					}
					detail.put("teachingTime", myFmt.format(order.getCreatetime()));

				} else {// 老师上门
					details = lessonSummary2.getJSONArray("details");
					if (null == details) {
						details = new JSONArray();
						lessonSummary2.put("details", details);
						lessonSummary2.put("orderType", "on");
					}
					detail.put("usedTime", myFmt.format(order.getCreatetime()));
				}*/
				detail.put("transactionType", order.getOrderType());
				detail.put("cnt", order.getPurchasenum());
				detail.put("transDate", myFmt.format(order.getCreatetime()));

				details.add(detail);
			}

			if (CollectionUtils.isEmpty(lessonSummary)) {
				lessonSummary.put("orderType", 0);
				lessonSummary.put("details", new JSONArray());
			}
			if (CollectionUtils.isEmpty(lessonSummary1)) {
				lessonSummary1.put("orderType", 2);
				lessonSummary1.put("details", new JSONArray());
			}
			if (CollectionUtils.isEmpty(lessonSummary2)) {
				lessonSummary2.put("orderType", 1);
				lessonSummary2.put("details", new JSONArray());
			}
			if (CollectionUtils.isEmpty(lessonSummary3)) {
				lessonSummary3.put("orderType", 3);
				lessonSummary3.put("details", new JSONArray());
			}
			
			datas.add(lessonSummary);
			datas.add(lessonSummary1);
			datas.add(lessonSummary2);
			datas.add(lessonSummary3);
			
			return datas;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Transactional
	@Override
	public int commitSchedule(JSONObject params) {
		String scheduleType = params.getString("orderType");
		Integer gradeId = params.getInteger("gradeId");
		Integer subjectId = params.getInteger("subjectId");
		String studentName = params.getString("studentName");
		String telNum = params.getString("telphone");
		// String weixin = params.getString("weixin");
		String openId = params.getString("openId");

		try {
			JSONObject reqParams = new JSONObject();
			reqParams.put("telNum", telNum);
			reqParams.put("openId", openId);
			// reqParams.put("parentName", null);
			reqParams.put("studentName", studentName);
			reqParams.put("weChatNum", params.get("weixin"));
			JSONObject relations = commonService.addOrGetPSR(reqParams);
			if (null == relations) {
				return -1;
			}

			// 拼装lessonType
			StringBuffer sb = new StringBuffer();
			if ("on".equals(scheduleType)) {
				sb.append("-");
			}
			if (null != gradeId) {
				sb.append(gradeId);
			}
			if (null != subjectId) {
				sb.append(subjectId);
			}
			int lessonType = Integer.parseInt(sb.toString());

			try {
				Parents parents = (Parents) relations.get("parents");
				ParentStuRelation relation = (ParentStuRelation) relations.get("relation");
				if (null == parents || null == relation) {
					return -1;
				}

				Schedule schedule = new Schedule();
				schedule.setScheduleid(UUID.randomUUID().toString());
				schedule.setMemberid(relation.getMemberid());
				schedule.setParentid(relation.getParentid());
				schedule.setLessontype(lessonType);
				schedule.setNotes("未处理");
				schedule.setStatus((byte) 0);
				// schedule.setTeacherid(null);
				schedule.setCreatetime(new Date());

				scheduleDao.insertSelective(schedule);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return 0;
	}

	@Override
	public List<JSONObject> getMySchedules(String openId) {
		List<JSONObject> datas = new ArrayList<JSONObject>();

		try {
			Parents parents = null;
			try {
				parents = parentDao.selectByOpenId(openId);
			} catch (Exception e) {
				logger.info(e.getMessage());
				throw e;
			}
			String parentId = null;
			if (null != parents && null != parents.getParentid()) {
				parentId = parents.getParentid();
			}

			// 获取学生预约列表
			List<Schedule> scheduleList = null;
			try {
				scheduleList = customDao.selectScheduleByParentsId(parentId);
			} catch (Exception e) {
				logger.info(e.getMessage());
				throw e;
			}

			if (!CollectionUtils.isEmpty(scheduleList)) {
				SimpleDateFormat myFmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				for (Schedule schedule : scheduleList) {
					JSONObject data = new JSONObject();
					Integer lessonType = schedule.getLessontype();
					if (null != lessonType) {
						// 预约类型
						data.put("orderType", lessonType > 0 ? "of" : "on");
						int gradeId = Math.abs(lessonType / 10);

						// 年级
						for (Level level : Level.values()) {
							if (gradeId == level.getValue()) {
								data.put("gradeName", level.toString());
								break;
							}
						}

						// 科目
						int courseId = Math.abs(lessonType % 10);
						for (Course course : Course.values()) {
							if (courseId == course.getValue()) {
								data.put("subjectName", course.toString());
								break;
							}
						}
					}

					data.put("telphone", parents.getTelnum());

					// 查询指派老师
					if (schedule.getTeacherid() != null) {
						JSONArray teachers = new JSONArray();
						JSONObject t = new JSONObject();
						Teacher teacher = teacherDao.selectByPrimaryKey(schedule.getTeacherid());
						t.put("teacherName", teacher.getTeachername());
						teachers.add(t);

						data.put("teacher", "");
					}

					// 查询学生姓名
					if (null != schedule.getMemberid()) {
						Student student = studentDao.selectByPrimaryKey(schedule.getMemberid());
						data.put("studentName", student.getName());
					}
					data.put("statusName", schedule.getNotes());
					data.put("orderDate", myFmt.format(schedule.getCreatetime()));

					datas.add(data);
				}
			}

		} catch (Exception e) {
			logger.info(e.getMessage());
			throw e;
		}
		return datas;
	}

	@Transactional
	@Override
	public int confirmTRecords(JSONObject params) {
		String openId = params.getString("openId");
		String lessonTradeId = params.getString("lessonTradeId");
		Short feedback = params.getShort("feedback");
		String notes = params.getString("notes");

		try {
			if (null == openId || null == lessonTradeId) {
				return -1;
			}

			// 校验身份（openId校验）
			logger.info("openId:" + openId);
			Parents parents = parentDao.selectByOpenId(openId);
			if (null == parents) {
				return -2;
			}
			LessonTrade record = lessonTradeDao.selectByPrimaryKey(lessonTradeId);
			if (null == record || record.getParentid() == null || !record.getParentid().equals(parents.getParentid())) {
				logger.info("record:" + record);
				logger.info("parents:" + parents);
				return -2;
			}

			// 同步更新订单（避免重复点击确认）
			synchronized (this) {
				// 已确认过的订单
				if (null != record && record.getStatus() != null && record.getStatus().intValue() != 1) {
					return -3;
				}

				logger.info("lessonTradeId:" + lessonTradeId);
				logger.info("feedback:" + feedback);
				logger.info("notes:" + notes);
				record.setStatus((byte) 2);// 家长已确认
				record.setFeedback((String.valueOf(feedback))); // 反馈
				record.setNotes(notes); // 对老师的建议

				// 计算提现金额
				logger.info("teacherId: " + record.getTeacherid());
				logger.info("applylessons: " + record.getApplylessons());
				logger.info("lessontype: " + record.getLessontype());
				logger.info("feedback: " + feedback);
				logger.info("teachingWay: "+ record.getTeachingWay());
				
				// 计算提现金额&解冻课时数
				calcTeacherPay(record);
				
				// 更新老师课时提现状态
				try {
					lessonTradeDao.updateByPrimaryKeySelective(record);
				} catch (Exception e) {
					logger.info("更新提现状态失败！");
					logger.error(e.getMessage());
					throw new RuntimeException();
				}
			}
			// 更新老师提现汇总表
			try {
				LessonTradeSum lessonTradeSum = tradeSumDao.selectByPrimaryKey(record.getTeacherid());

				if (null != lessonTradeSum) {
					lessonTradeSum.setTeacherid(record.getTeacherid());
					// Double totalIncome = 0d;
					Float checkedLessonNum = lessonTradeSum.getCheckedlessonnum();
					// 计算收入（移至企业付款成功界面）
					// totalIncome =

					// 计算提现到账总课时数(家长已确认)
					if (null != checkedLessonNum) {
						if (null != record.getApplylessons()) {
							checkedLessonNum = (record.getApplylessons() + checkedLessonNum);
						}
					} else {
						checkedLessonNum = record.getApplylessons();
					}

					// 更新冻结课时总数
					lessonTradeSum.setCheckedlessonnum(checkedLessonNum);
					if (record.getFrozenLessons() > 0) {
						Float curFromzenLessons = (lessonTradeSum.getFrozenlessonnum() > record.getFrozenLessons())
								? lessonTradeSum.getFrozenlessonnum()
								: 0;
						lessonTradeSum.setFrozenlessonnum(curFromzenLessons);
					}
					// lessonTradeSum.setWithdrawlessonnum(null);

					if (tradeSumDao.updateByPrimaryKeySelective(lessonTradeSum) > 0) {
						return 0;
					}

				}
			} catch (Exception e) {
				logger.info("更新教师提现汇总表出错！");
				logger.error(e.getMessage());
				throw new RuntimeException();
			}

			return 0;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<JSONObject> queryStuTeachingReport(JSONObject params) {
		String teachingId = params.getString("teachingId");
		String queryDate = params.getString("queryDate");
		String questLessonTradeId = params.getString("lessonTradeId");
		String openId = params.getString("openId");

		List<JSONObject> datas = new ArrayList<JSONObject>();
		try {
			StringBuffer dateTime = new StringBuffer();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
			Calendar cal = Calendar.getInstance();
			if (StringUtils.isEmpty(queryDate)) {
				cal.setTime(new Date());
				cal.add(Calendar.MONTH, -1);
				dateTime.append(sdf.format(cal.getTime()));
			} else {
				String yearMon[] = queryDate.split("-");
				if (yearMon == null || yearMon.length < 2 || yearMon[0] == null || yearMon[1] == null) {
					cal.setTime(new Date());
					// cal.add(Calendar.MONTH, -1);
					dateTime.append(sdf.format(cal.getTime()));
				} else {
					Integer year = Integer.parseInt(yearMon[0]);
					Integer month = Integer.parseInt(yearMon[1]);

					dateTime.append(year);
					if (yearMon[1] != null && !yearMon[1].startsWith("0")) {
						dateTime.append("0");
					}
					dateTime.append(month);
				}
			}

			// 根据openId获取家长登录信息(非点击模板消息的方式)
			List<String> lessonTradeIdList = new ArrayList<String>();
			if (StringUtils.isNotEmpty(openId) && StringUtils.isEmpty(questLessonTradeId)) {
				Parents parent = parentDao.selectByOpenId(openId);
				Map<String, Object> reqData = new HashMap<String, Object>();
				reqData.put("parentId", parent.getParentid());
				reqData.put("queryMonth", dateTime.toString());

				logger.info("查询lessonTradeList[params]:" + reqData.toString());
				List<LessonTrade> lessonTradeList = lessonTradeDao.selectByParams(reqData);
				if (!CollectionUtils.isEmpty(lessonTradeList)) {
					for (LessonTrade record : lessonTradeList) {
						lessonTradeIdList.add(record.getLessontradeid());
					}
				}
			} else {
				lessonTradeIdList.add(questLessonTradeId);
			}

			for (String lessonTradeId : lessonTradeIdList) {
				// 去空
				if (StringUtils.isEmpty(lessonTradeId)) {
					continue;
				}
				JSONObject data = new JSONObject();
				if (/* StringUtils.isNotEmpty(teachingId) */true) {
					Map<String, Object> reqData = new HashMap<String, Object>();

					reqData.put("teachingId", teachingId);

					// (默认)提现上个月的课时
					boolean isConfirmed = false;

					logger.info("teachingId:" + teachingId);
					logger.info("lessonTradeId:" + lessonTradeId);

					reqData.put("lessonTradeId", lessonTradeId);

					List<TeachingRecord> teachingRecords = customDao.selectTeachingRecordsByTeachingId(reqData);
					if (!CollectionUtils.isEmpty(teachingRecords)) {

						// 获取上课日期、时间段及上课课时数
						JSONArray teachingDetails = new JSONArray();
						Float totalCheckLessons = 0f;
						Iterator<TeachingRecord> tRecordsIter = teachingRecords.iterator();
						TeachingRecord tRecord = null;
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						while (tRecordsIter.hasNext()) {
							tRecord = tRecordsIter.next();
							if (null == tRecord) { // 去空
								tRecordsIter.remove();
								continue;
							}
							// tRecord = tRecordsIter.next();
							JSONObject teachingDetail = new JSONObject();
							if (null != tRecord.getTeachingdate()) {
								teachingDetail.put("teachingDate", format.format(tRecord.getTeachingdate()));
							}
							StringBuffer sb = new StringBuffer();
							sb.append(tRecord.getStarttime());
							sb.append(" ~ ");
							sb.append(tRecord.getEndtime());

							teachingDetail.put("teachingTime", sb.toString());
							teachingDetail.put("teachingNum", tRecord.getTeachingnum());

							// 月提现课时总数
							if (tRecord.getTeachingnum() != null) {
								totalCheckLessons += tRecord.getTeachingnum();
							}

							teachingDetails.add(teachingDetail);
						}
						data.put("teachingDetails", teachingDetails);
						data.put("totalCheckLessons", totalCheckLessons);

						// 补充其他信息
						if (null != tRecord) {
							// 获取老师姓名
							String teacherId = tRecord.getTeacherid();
							if (StringUtils.isNotBlank(teacherId)) {
								Teacher teacher = null;
								try {
									logger.info("查询老师：{teacherId:" + teacherId + "}");
									teacher = teacherDao.selectByPrimaryKey(teacherId);
								} catch (Exception e) {
									logger.info("查询老师出错！");
									logger.error(e.getMessage());
								}
								if (null != teacher) {
									data.put("teacherName", teacher.getTeachername());
									data.put("teacherId", teacherId);
								}
							}
							// 关联的课时交易Id
							data.put("lessonTradeId", tRecord.getLessonTradeId());

							try {
								if (null != tRecord.getLessonTradeId()) {
									logger.info("查询建议：lessonTradeId", tRecord.getLessonTradeId());
									Suggestions suggestions = suggestionDao
											.selectByPrimaryKey(tRecord.getLessonTradeId());
									logger.info("convert string to array...");
									try {

										logger.info("parse suggetions string to array[original]:"
												+ suggestions.getSuggestions());
										// logger.info("parsed
										// array:"+JSONObject.parseArray(suggestions.getSuggestions()));
										StringBuffer tt = new StringBuffer();
										tt.append(suggestions.getSuggestions());
										String ttString = tt.subSequence(1, tt.length() - 1).toString();
										// System.out.println(ttString);

										data.put("suggestions", Arrays.asList(ttString.split(",")));

										tt.delete(0, tt.length());
										tt.append(suggestions.getSituations());
										ttString = tt.subSequence(1, tt.length() - 1).toString();
										data.put("situations", Arrays.asList(ttString.split(",")));
									} catch (Exception e) {
										logger.info("parse Suggestions erro!");
										e.printStackTrace();
									}

									// 查询订单当前状态
									try {
										logger.info("查询lessonTrade状态【lessonTradeId】：" + tRecord.getLessonTradeId());
										LessonTrade lessonTrade = lessonTradeDao
												.selectByPrimaryKey(tRecord.getLessonTradeId());
										Byte status = 1; // 1: 家长未确认, 2: 家长已确认
										if (null != lessonTrade) {
											status = lessonTrade.getStatus();

											logger.info("status:" + status);
											if (null != status && (status != 1)) { // 已经确认
												isConfirmed = true;
												status = 2;
											}
											data.put("status", status);
											data.put("parentId", lessonTrade.getParentid());
											data.put("memberId", lessonTrade.getMemberid());
											// 已经确认-补充家长评价
											if (isConfirmed) {
												data.put("notes", lessonTrade.getNotes());
												data.put("feedback", lessonTrade.getFeedback());
											}
										}
									} catch (Exception e) {
										logger.info("查询当前订单状态出错！");
										e.printStackTrace();
									}
								}
							} catch (Exception e) {
								logger.info("查询建议出错！");
								logger.error(e.getMessage());
							}
							datas.add(data);
							// return data;
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("内部错误！");
		}
		return datas;
	}

	/**
	 * 计算老师提现课时对应的报酬
	 * 
	 * @param teacherId
	 * @param applylessons
	 * @return
	 */
	private LessonTradeSum calcTeacherPay(LessonTrade trade) {
		String teacherId = trade.getTeacherid();
		Float applylessons = trade.getApplylessons();
		Integer lessonType = trade.getLessontype();
		Short feedback = Short.valueOf(trade.getFeedback());

		// 查询提现课时(价目表)
		logger.info("lessonType:" + lessonType + ",applylessons: " + applylessons);
		/*
		 * TeacherPayList priceList = null; if(null!=lessonType && applylessons!=null) {
		 * TeacherPayListKey keys = new TeacherPayListKey(); //设置默认值（满意）
		 * if(null==feedback) { feedback = 1; } keys.setFeedbackid(feedback);
		 * keys.setLessontypeid(lessonType);
		 * 
		 * logger.info("查询priceList【keys】:"+keys.toString()); priceList =
		 * payListDao.selectByPrimaryKey(keys);
		 * logger.info("查询结果：priceList.getReward():"+priceList.getReward()); }
		 */
		Teacher teacher = teacherDao.selectByPrimaryKey(teacherId);
		ClassFees classFees = null;
		if (null != teacher) {
			if (null != lessonType && applylessons != null) {
				Integer gradeId = 0;
				Short teachingType = trade.getTeachingWay();//0;
				Byte teachingLevel = 0;
				JSONObject jsonObject = new JSONObject();
				for (LessonType lessonTypes : LessonType.values()) {
					if (lessonType == lessonTypes.getValue()) {
						gradeId = lessonTypes.getGradeId(false);
						//teachingType = lessonTypes.getType();
						break;
					}
				}
				teachingLevel = teacher.getTeachinglevel();
				// 设置默认值（满意）
				if (null == feedback) {
					feedback = 1;
				}
				jsonObject.put("gradeId", gradeId);
				jsonObject.put("teachingType", teachingType);
				jsonObject.put("teachingLevel", teachingLevel);
				jsonObject.put("feedback", feedback);
				classFees = classFeesService.getClassFeesByParam(jsonObject);
				logger.info("查询结果：classFees.getClassCost():" + classFees.getClassCost());
			}
		}

		// 价格查询出错！
		if (null == classFees || classFees.getClassCost() == null) {
			logger.info("查询classFees结果为空/没有对应价格表！");
			return null;
		}

		// String teacherId = lessonTrade.getTeacherid();
		LessonTradeSum tradeSum = null;

		try {
			logger.info("根据teacherId查询LessonTradeSum表【teacherId】:" + teacherId);
			tradeSum = tradeSumDao.selectByPrimaryKey(teacherId);
		} catch (Exception e) {
			logger.info("根据teacherId查询LessonTradeSum表失败！");
			throw e;
		}

		// 结算时减去被冻结课时
		Float checkLessons = 0f;
		if (null != tradeSum) {
			logger.info("计算结算课时数(扣除冻结课时后所得)...");
			logger.info("冻结课时数：" + tradeSum.getFrozenlessonnum());
			logger.info("提现课时数：" + applylessons);
			if (tradeSum.getFrozenlessonnum() != null) {
				checkLessons = (applylessons >= tradeSum.getFrozenlessonnum())
						? (applylessons - tradeSum.getFrozenlessonnum())
						: 0;
			} else {
				checkLessons = applylessons;
			}
			logger.info("计算所得接榫课时数：" + checkLessons);

			// 更新提现总表的冻结课时数
			float newAddedFrozenLessons = applylessons - checkLessons;
			tradeSum.setFrozenlessonnum((tradeSum.getFrozenlessonnum() == null ? 0
					: tradeSum.getFrozenlessonnum() - newAddedFrozenLessons));
			logger.info("更新提现总表的冻结课时数");
			try {
				tradeSumDao.updateByPrimaryKeySelective(tradeSum);
			} catch (Exception e) {
				logger.error("更新提现总表的冻结课时数");
				e.printStackTrace();
				throw e;
			}
		} else {
			logger.info("LessonTradeSum 为空(第一次提现)！");
			checkLessons = applylessons;
		}

		// 设置解冻课时
		trade.setFrozenLessons(applylessons - checkLessons);

		// 设置提现金额
		logger.info("提现金额：" + checkLessons * classFees.getClassCost());
		trade.setActualPay(checkLessons * classFees.getClassCost());
		return tradeSum;
	}

	@Transactional
	@Override
	public int insertComplains(JSONObject params) {
		try {
			String lessonTradeId = params.getString("lessonTradeId");
			if (StringUtils.isEmpty(lessonTradeId)) {
				return 0;
			}

			// 更新提现状态（4：老师被家长投诉）
			try {
				LessonTrade tradeRecord = new LessonTrade();
				tradeRecord.setLessontradeid(lessonTradeId);
				tradeRecord.setStatus((byte) 4);

				lessonTradeDao.updateByPrimaryKeySelective(tradeRecord);
			} catch (Exception e) {
				e.printStackTrace();
				logger.info("更新提现状态失败！");
				return 0;
			}

			TradeComplains record = new TradeComplains();
			record.setComplainContent(params.getString("complaintContent"));
			record.setComplainTime(new Date());
			record.setTeacherid(params.getString("teacherId"));
			record.setLessontradeid(params.getString("lessonTradeId"));

			return tradeCompainsDao.insertSelective(record);
		} catch (Exception e) {
			logger.info("插入投诉失败！");
			logger.error(e.getMessage());
			return 0;
		}
	}

	@Override
	public JSONObject getDebt(JSONObject params) {
		JSONObject result = new JSONObject();
		String orderId = params.getString("orderId");
		if (StringUtils.isEmpty(orderId)) {
			logger.info("参数错误,orderId为空！");
			return null;
		}
		try {
			OrderSumKey key = new OrderSumKey();
			key.setOrderid(orderId);
			OrderSum orderSum = orderSumDao.selectByPrimaryKey(key);

			if (null != orderSum && orderSum.getLessontype() != null) {
				LessonTypeKey lessonTypeKey = new LessonTypeKey();
				lessonTypeKey.setCoursecnt((short) 30);
				lessonTypeKey.setLessontype(orderSum.getLessontype());
				com.xiaoyi.manager.domain.LessonType lessonType = lessonTypeDao.selectByPrimaryKey(lessonTypeKey);

				float ownLessonNum = orderSum.getLessonleftnum();
				logger.info("补缴课时数：" + ownLessonNum);
				float amount = ownLessonNum;
				if (ownLessonNum > 0) {
					return result;
				}
				ownLessonNum *= -1;
				amount = ownLessonNum * (lessonType.getDiscountprice() / 30);
				logger.info("家长应付金额：" + amount);

				result.put("shouldPay", amount);
				result.put("ownLessonNum", ownLessonNum);
			}
		} catch (Exception e) {
			logger.info("查询家长欠费课时详情失败！");
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<JSONObject> getPSRList(String openid) {
		return customDao.getPSRList(openid);
	}

	@Override
	public List<JSONObject> getStuTeachingDetailByMonth(JSONObject reqData) {
		List<JSONObject> result = null;
		try {
			// 适配前端日期
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			Date date = sdf.parse(reqData.getString("queryMonth"));
			String queryDateFormatString = sdf.format(date);

			reqData.put("queryMonth", queryDateFormatString);
			result = customDao.getStuTeachingDetailByMonth(reqData);
			if (!CollectionUtils.isEmpty(result)) {
				for (JSONObject jsonObject : result) {
					jsonObject.put("teachingTime", DateUtils.starTimeJoinEndTime(jsonObject.getDate("startTime"),
							jsonObject.getDate("endTime")));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<JSONObject> getDaulTransactionCourses(String openId) {
		// TODO Auto-generated method stub
		List<JSONObject> datas = new ArrayList<JSONObject>();
		try {
			Parents p = parentDao.selectByOpenId(openId);
			String parentId = p.getParentid();
			
			JSONObject params = new JSONObject();
			params.put("parentId", parentId);
			List<DaulVideoOrder> daulVideoOrders = daulOrderDao.selectByParams(params);
			
			if(!CollectionUtils.isEmpty(daulVideoOrders)){
				for(DaulVideoOrder order : daulVideoOrders){
					JSONObject data = new JSONObject();
					
					//转换年级
					Short gradeId = order.getGradeId();
					data.put("gradeId", gradeId);
					if(null!=gradeId){
						for(Grade g : Grade.values()){
							if(g.getValue() == gradeId){
								data.put("gradeName", g.getFullGradeName());
								break;
							}
						}
					}
					
					//获取courseName					
					Short videoCourseType = order.getVideoCourseType();
					data.put("videoCourseType", videoCourseType);
					
					Short semaster = order.getSemaster();
					data.put("semaster", semaster);
					
					StringBuffer courseName = new StringBuffer();
					if(null!=videoCourseType){
						switch(videoCourseType){
						case 1:
							courseName.append("同步");
							break;
						case 2:
							courseName.append("专题");
							break;
						case 3:
							courseName.append("假期");							
							break;
						}
					}
					for(Semaster s : Semaster.values()){
						if(s.getValue() == semaster){
							courseName.append(s.getSimpleName()+"册");
							break;
						}
					}
					
					data.put("courseName", courseName.toString());					
					
					datas.add(data);
				}
			}			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("查询家长购买双师同步视频订单出错！");
		}
		
		return datas;
	}

	@Override
	public List<JSONObject> getStudentBondCourses(String openId) {
		List<JSONObject> datas = new ArrayList<JSONObject>();
		
		try {
			List<JSONObject> psrList = null;
			try {
				psrList = customDao.getPSRList(openId);				
			} catch (Exception e) {
				logger.error("查询家长-学生关系出错![openId]:" + openId);
				throw new CommonRunException(-1, "查询家长-学生关系出错！");
			}
			if(!CollectionUtils.isEmpty(psrList)){
				List<String> studentIds = new ArrayList<String>();
				for(JSONObject psr : psrList){
					studentIds.add(psr.getString("studentId"));
				}

				//(年级)科目列表 & 作业完成率
				List<JSONObject> relationshipList = null;
				try {
					relationshipList = teachingRelationshipDao.selectTeachingRelationshipAndAccomplishRate(studentIds);						
				} catch (Exception e) {
					e.printStackTrace();
					throw new CommonRunException(-1, "查询老师所带学生&作业完成率失败！");
				}
				
				//学生列表
				for(JSONObject psr : psrList){
					JSONObject stu = new JSONObject();
					
					stu.put("studentId", psr.get("studentId"));
					stu.put("studentName", psr.get("studentName"));

					if(!CollectionUtils.isEmpty(relationshipList)){
						JSONArray courseList = new JSONArray();
						for(JSONObject course : relationshipList){
							//过滤其他学生
							if(course.getString("studentId")==null 
									|| !course.getString("studentId").equals(psr.get("studentId"))){
								continue;
							}
							
							//年级
							Integer gradeId = course.getInteger("gradeId");
							for(Grade g : Grade.values()){
								if(gradeId == g.getValue()){
									course.put("gradeName", g.getFullGradeName());									
								}
							}
							
							//科目
							Integer courseId = course.getInteger("courseId");
							for(Course c : Course.values()){
								if(c.getValue() == courseId){
									course.put("courseName", c.toString());									
								}
							}
							
							//作业完成率
							if(StringUtils.isEmpty(course.getString("accomplishRate"))){
								course.put("accomplishRate", 100);
							}
							
							courseList.add(course);
						}
						
						//只有老师设定了作业（年级+科目）才会在家长端显示作业
						if(courseList.size()!=0){
							stu.put("courseList", courseList);
							datas.add(stu);
						}
					}
				}				
			}
		
		} catch (CommonRunException e) {
			
		} catch (Exception e) {
			logger.error("获取学生绑定的科目失败！");
			throw new CommonRunException(-1, "获取学生绑定的科目失败！");
		}
		return datas;
	}

	@Override
	public List<JSONObject> getBondSubGrades(JSONObject params) {
		List<JSONObject> datas = new ArrayList<JSONObject>();
		
		try {
			String openId = params.getString("openId");
			List<JSONObject> psrList = null;

			//查询家长-学生关系
			List<String> studentIds = new ArrayList<String>();
			try {
				psrList = customDao.getPSRList(openId);								
				//判空
				if(CollectionUtils.isEmpty(psrList)){
					return datas;
				}												
			} catch (Exception e) {
				logger.error("查询家长-学生关系出错![openId]:" + openId);
				throw new CommonRunException(-1, "查询家长-学生关系出错！");
			}
			
			//查找年级-科目
			try {					
				for(JSONObject psr : psrList){
					studentIds.add(psr.getString("studentId"));
				}
				if(studentIds.size()==0){
					return datas;
				}
				List<JSONObject> relations = 
						teachingRelationshipDao.selectTeachingRelationshipAndAccomplishRate(studentIds);
				List<String> subGrades = new ArrayList<String>();
				for(JSONObject relation : relations){
					StringBuffer sb = new StringBuffer();
					Short courseId = relation.getShort("courseId");
					Short gradeId = relation.getShort("gradeId");
					sb.append(courseId);
					sb.append("-");
					sb.append(gradeId);
					
					if(subGrades.contains(sb.toString())){
						continue;
					}
					subGrades.add(sb.toString());
					
					//补充年级，科目名称
					for(Course c : Course.values()){
						if(c.getValue() == courseId){
							relation.put("courseName", c.toString());
							break;
						}
					}
					for(Grade g : Grade.values()){
						if(g.getValue() == gradeId){
							relation.put("gradeName", g.getFullGradeName());
							break;
						}
					}
					datas.add(relation);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("查找年级-科目失败！");
				throw new CommonRunException(-1, "查找年级-科目失败！");
			}
		} catch (CommonRunException e) {
			throw e;
		} catch (Exception e) {
			throw new CommonRunException(-1, "内部错误！");
		}
		return datas;
	}

	@Override
	public List<JSONObject> getAvailableVideos(JSONObject params) {
		// TODO Auto-generated method stub
		List<JSONObject> datas = new ArrayList<JSONObject>();
		try {
			String parentId = null;
			try {
				logger.info("根据openId查询家长【openId】：" + params.getString("openId"));
				Parents parent = parentDao.selectByOpenId(params.getString("openId"));
				
				parentId = parent.getParentid();
			} catch (Exception e) {
				throw new CommonRunException(-1, "查询家长出错！");
			}
			
			//查询视频列表
			List<JSONObject> availableVideos = null;
			try {
				params.put("semaster", Semaster.getCurrentSemaster());//只显示当前学期的视频课程
				params.put("parentId", parentId);
				
				availableVideos = daulOrderDao.selectAvailableVideoCourses(params);
			} catch (Exception e) {
				logger.warn("查询可用双师视频课程列表出错！");
				throw new CommonRunException(-1, "查询可用双师视频课程列表出错！");				
			}
			
			//拼装数据
			if(!CollectionUtils.isEmpty(availableVideos)){
				Map<Integer,JSONArray> videoGroupMap = new HashMap<Integer, JSONArray>();
				for(JSONObject video : availableVideos){
					Integer group = video.getInteger("videoCourseType");
					if(null==group){
						continue;
					}
					
					JSONArray videoGroup = videoGroupMap.get(group);
					if(null==videoGroup){
						videoGroup = new JSONArray();
						videoGroupMap.put(group, videoGroup);						
					}					
					
					videoGroup.add(video);						
				}
				
				//组合各个组（三大类：同步，专题和假期）
				for(Integer videoCourseType : videoGroupMap.keySet()){
					JSONObject videoGroup = new JSONObject();
					
					videoGroup.put("videoCourseType", videoCourseType);
					videoGroup.put("videoCourseTasks", videoGroupMap.get(videoCourseType));
					datas.add(videoGroup);
				}
			}
			
		} catch (CommonRunException e) {
			throw e;
		}catch (Exception e) {
			// TODO: handle exception
			throw new CommonRunException(-1, "内部错误！");
		}
		
		return datas;
	}

	@Override
	public List<JSONObject> getDistributedTasks(JSONObject params) {
		List<JSONObject> datas = new ArrayList<JSONObject>();
		List<JSONObject> tasks = null;
		try {
			//验证参数
			if(params.get("studentId")==null
					|| params.get("gradeId")==null
					|| params.get("courseId")==null){
				logger.info("入参【params】：" + params);
				throw new CommonRunException(-1, "参数错误！");
			}
			
			try {
				tasks = studentTaskDao.selectAllByParams(params);				
			} catch (Exception e) {
				logger.error("查询老师布置的作业失败！");
				throw new CommonRunException(-1, "查询老师布置的作业失败！");
			}
			
			//拼装数据
			if(null!=tasks){
				Map<Byte,JSONArray> taskTypeMap = new HashMap<Byte, JSONArray>();
				for(JSONObject task : tasks){
					Byte taskType = task.getByte("videoTaskType");
					if(null == taskType){
						continue;
					}
					
					JSONArray taskList = taskTypeMap.get(taskType);
					if(null == taskList){
						taskList = new JSONArray();
						taskTypeMap.put(taskType, taskList);
					}
					taskList.add(task);					
				}
				
				//归类
				for(Byte taskType : taskTypeMap.keySet()){
					JSONObject task = new JSONObject();
					task.put("videoCourseType", taskType);
					task.put("taskList", taskTypeMap.get(taskType));
					
					datas.add(task);
				}
			}
			
		}  catch (CommonRunException e) {
			throw e;
		}catch (Exception e) {
			// TODO: handle exception
			logger.error("内部错误！");
			throw new CommonRunException(-1, "内部错误！");
		}
		
		return datas;
	}

	@Transactional
	@Override
	public int modifyTaskStatus(JSONObject params) {
		try {
			//验证参数
			logger.info("修改作业【parmas】："+params.toJSONString());
			if(params.getString("studentTaskId")==null){
				throw new CommonRunException(-1, "参数错误！");
			}
			
			StudentTask record = new StudentTask();
			record.setStudentTaskId(params.getString("studentTaskId"));
			record.setTaskStatus((byte)2);
			record.setVideoCourseId(params.getString("videoCourseId"));
			
			//更新作业状态
			try {
				studentTaskDao.updateByPrimaryKeySelective(record);				
			} catch (Exception e) {
				logger.error("更新作业状态失败！");
				throw new CommonRunException(-1, "更新作业状态失败！");
			}
			
			//查询统计参数（studentId,teacherId）
			record = studentTaskDao.selectByPrimaryKey(record);
			if(null == record){
				
				logger.warn("没有找到对应的作业！");
				return 0;
			}
			
			//更新作业完成率
			try {
				StudentTaskStatisticKey key = new StudentTaskStatisticKey();
				key.setStudentId(record.getStudentId());
				key.setTeacherId(record.getTeacherId());
				
				StudentTaskStatistic statistics = studentTaskStatisticDao.selectByPrimaryKey(key );
				if(null!=statistics){
					Short finishCount = (short) (statistics.getFinishCount()+1);
					Short unFinishCount = statistics.getUnfinishCount();
					Short allTaskCount = statistics.getTotalTasks();
					Double accomplishRate = finishCount*1.0/allTaskCount;
					accomplishRate *= 100;
					
					statistics.setAccomplishRate(accomplishRate.shortValue());
					statistics.setUpdateTime(new Date());
					statistics.setFinishCount((short)finishCount);
					statistics.setUnfinishCount((short)--unFinishCount);
					
					studentTaskStatisticDao.updateByPrimaryKeySelective(statistics );
				}
			} catch (Exception e) {
				throw new CommonRunException(-1, "更新学生作业完成率失败！");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new CommonRunException(-1, "修改作业状态（已完成）失败！");
		}
		return 0;
	}

}
