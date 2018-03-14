package com.xiaoyi.custom.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
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
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.Level;
import com.xiaoyi.custom.dao.ICustomDao;
import com.xiaoyi.custom.service.ICustomService;
import com.xiaoyi.manager.dao.IParentsDao;
import com.xiaoyi.manager.dao.IScheduleDao;
import com.xiaoyi.manager.dao.IStudentDao;
import com.xiaoyi.manager.dao.ITeacherDao;
import com.xiaoyi.manager.dao.ITeacherPayListDao;
import com.xiaoyi.manager.domain.Orders;
import com.xiaoyi.manager.domain.ParentStuRelation;
import com.xiaoyi.manager.domain.Parents;
import com.xiaoyi.manager.domain.Schedule;
import com.xiaoyi.manager.domain.Student;
import com.xiaoyi.manager.domain.Teacher;
import com.xiaoyi.manager.service.ICommonService;
import com.xiaoyi.teacher.dao.ILessonTradeDao;
import com.xiaoyi.teacher.dao.ILessonTradeSumDao;
import com.xiaoyi.teacher.dao.ISuggestionsDao;
import com.xiaoyi.teacher.domain.LessonTrade;
import com.xiaoyi.teacher.domain.LessonTradeSum;
import com.xiaoyi.teacher.domain.Suggestions;
import com.xiaoyi.teacher.domain.TeachingRecord;

@Service("customService")
public class CumstomServiceImpl implements ICustomService{
	
	@Resource  
    private IParentsDao parentDao;  
	
	@Resource 
	private ICustomDao customDao;
	
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
	private ICommonService commonService;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public List<JSONObject> queryTransactionCourses(String openId) {
		List<JSONObject> datas = new ArrayList<JSONObject>();
		try {
			//查询家长微信号对应的parentId
			Parents parents = null;
			try {
				parents = parentDao.selectByOpenId(openId);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			String parentId = null;
			if(null!=parents) {
				parentId = parents.getParentid();								
			}

			//查询家长对应的课时购买与消费情况
			List<Orders> orderList = null;
			try {
				orderList = customDao.selectTransactionOrders(parentId);
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			
			//必须是非空集合
			if(CollectionUtils.isEmpty(orderList)) {
				return datas;
			}
			
			
			SimpleDateFormat myFmt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			JSONObject lessonSummary = new JSONObject();	//学生生门			
			JSONObject lessonSummary2 = new JSONObject();	//老师上门
			for(Orders order : orderList) {
				JSONArray details = null;
				
				//学生上门				
				JSONObject detail = new JSONObject();
				if(order.getLessontype()>0) {
					details = lessonSummary.getJSONArray("details");
					if(null==details) {
						details = new JSONArray();
						lessonSummary.put("details", details);
						lessonSummary.put("orderType", "of");
					}
					detail.put("teachingTime", myFmt.format(order.getCreatetime()));

				}else {//老师上门
					details = lessonSummary2.getJSONArray("details");
					if(null==details) {
						details = new JSONArray();
						lessonSummary2.put("details", details);
						lessonSummary2.put("orderType", "on");
					}
					detail.put("usedTime", myFmt.format(order.getCreatetime()));
				}
				detail.put("transactionType", order.getOrderType());
				detail.put("cnt", order.getPurchasenum());
				detail.put("transDate", myFmt.format(order.getCreatetime()));
				
				details.add(detail);
			}
			
			if(CollectionUtils.isEmpty(lessonSummary)) {
				lessonSummary.put("orderType", "on");
				lessonSummary.put("details", new JSONArray());
			}
			if(CollectionUtils.isEmpty(lessonSummary2)) {
				lessonSummary2.put("orderType", "on");
				lessonSummary2.put("details", new JSONArray());
			}
			
			datas.add(lessonSummary);
			datas.add(lessonSummary2);
			
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
		String weixin = params.getString("weixin");
		String openId = params.getString("openId");
		
		try {
			JSONObject reqParams = new JSONObject();
			reqParams.put("telNum", telNum);
			reqParams.put("openId", openId);
			//reqParams.put("parentName", null);
			reqParams.put("studentName", studentName);
			reqParams.put("weChatNum", params.get("weixin"));
			JSONObject relations = commonService.addOrGetPSR(reqParams);
			if(null==relations) {
				return -1;
			}
			
			//拼装lessonType
			StringBuffer sb = new StringBuffer();
			if("on".equals(scheduleType)) {
				sb.append("-");
			}
			if(null!=gradeId) {
				sb.append(gradeId);
			}
			if(null!=subjectId) {
				sb.append(subjectId);
			}
			int lessonType = Integer.parseInt(sb.toString());
			
			try {
				Parents parents = (Parents)relations.get("parents");
				ParentStuRelation relation = (ParentStuRelation)relations.get("relation");
				if(null==parents
						|| null==relation) {
					return -1;
				}
				
				Schedule schedule = new Schedule();
				schedule.setScheduleid(UUID.randomUUID().toString());
				schedule.setMemberid(relation.getMemberid());
				schedule.setParentid(relation.getParentid());
				schedule.setLessontype(lessonType);
				schedule.setNotes("未处理");
				schedule.setStatus((byte)0);
				//schedule.setTeacherid(null);				
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
			if(null!=parents && null!=parents.getParentid()) {
				parentId = parents.getParentid();
			}
			
			//获取学生预约列表
			List<Schedule> scheduleList = null;
			try {
				scheduleList = customDao.selectScheduleByParentsId(parentId);				
			} catch (Exception e) {
				logger.info(e.getMessage());
				throw e;
			}
			
			if(!CollectionUtils.isEmpty(scheduleList)) {
				SimpleDateFormat myFmt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				for(Schedule schedule : scheduleList) {
					JSONObject data = new JSONObject();
					Integer lessonType = schedule.getLessontype();
					if(null!=lessonType) {
						//预约类型
						data.put("orderType", lessonType>0?"of":"on");						
						int gradeId = Math.abs(lessonType/10);
						
						//年级
						for(Level level : Level.values()) {
							if(gradeId == level.getValue()) {
								data.put("gradeName", level.toString());
								break;
							}
						}
						
						//科目
						int courseId = Math.abs(lessonType%10);
						for(Course course : Course.values()) {
							if(courseId == course.getValue()) {
								data.put("subjectName", course.toString());
								break;
							}
						}
					}
					
					data.put("telphone", parents.getTelnum());
					
					//查询指派老师
					if(schedule.getTeacherid()!=null) {
						JSONArray teachers = new JSONArray();
						JSONObject t = new JSONObject();
						Teacher teacher = 
								teacherDao.selectByPrimaryKey(schedule.getTeacherid() );
						 t.put("teacherName", teacher.getTeachername());
						 teachers.add(t);
						 
						 data.put("teacher", "");
					}
					
					//查询学生姓名
					if(null!=schedule.getMemberid()) {
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
	public LessonTrade confirmTRecords(JSONObject params) {
		String openId = params.getString("openId");
		String lessonTradeId = params.getString("lessonTradeId");
		String feedback = params.getString("feedback");
		String notes = params.getString("notes");
		
		try {
			if(null==openId || null==lessonTradeId) {
				return null;
			}
			
			//校验身份（openId校验）
			logger.info("openId:"+openId);
			Parents parents = parentDao.selectByOpenId(openId);
			if(null==parents) {
				return null;
			}
			LessonTrade record = lessonTradeDao.selectByPrimaryKey(lessonTradeId);
			if(null==record 
					|| record.getParentid()==null
					|| !record.getParentid().equals(parents.getParentid())) {
				logger.info("record:"+record);
				logger.info("parents:"+parents);
				return null;
			}
			
			logger.info("lessonTradeId:"+lessonTradeId);			
			record.setStatus((byte)2);//家长已确认
			record.setFeedback(feedback);	//反馈
			record.setNotes(notes);		//对老师的建议
			
			//更新老师课时提现状态
			try {
				lessonTradeDao.updateByPrimaryKeySelective(record);
			} catch (Exception e) {
				logger.info("更新提现状态失败！");
				logger.error(e.getMessage());
				return null;
			}
			
			//更新老师提现汇总表
			try {
				LessonTradeSum lessonTradeSum 
					= tradeSumDao.selectByPrimaryKey(record.getTeacherid());
				
				if(null!=lessonTradeSum){
					lessonTradeSum.setTeacherid(record.getTeacherid());
					//Double totalIncome = 0d;
					Short checkedLessonNum = lessonTradeSum.getCheckedlessonnum();
					//计算收入（移至企业付款成功界面）
					//totalIncome = 
					
					//计算提现到账总课时数(家长已确认)
					if(null!=checkedLessonNum){
						if(null!=record.getApplylessons()){
							checkedLessonNum = (short)(record.getApplylessons() + checkedLessonNum);   				
						}
					}else{
						checkedLessonNum = record.getApplylessons();
					}
					
					//lessonTradeSum.setTotalincome(null);
					lessonTradeSum.setCheckedlessonnum(checkedLessonNum);
					//lessonTradeSum.setWithdrawlessonnum(null);
					
					if(tradeSumDao.updateByPrimaryKeySelective(lessonTradeSum)>0) {
						return record;
					}
					
				}
			} catch (Exception e) {
				logger.info("更新教师提现汇总表出错！");
				logger.error(e.getMessage());
			}
			
			return null;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public JSONObject queryStuTeachingReport(JSONObject params) {
		String teachingId = params.getString("teachingId");
		JSONObject data = null;
		try {
			if(StringUtils.isNotEmpty(teachingId)){
				List<TeachingRecord> teachingRecords = customDao.selectTeachingRecordsByTeachingId(teachingId);
				if(!CollectionUtils.isEmpty(teachingRecords)){
					data = new JSONObject();
					//获取上课日期、时间段及上课课时数
					JSONArray teachingDetails = new JSONArray();
					int totalCheckLessons = 0;
					Iterator<TeachingRecord> tRecordsIter = teachingRecords.iterator();
					TeachingRecord tRecord = null;
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					while(tRecordsIter.hasNext()){
						tRecord = tRecordsIter.next();
						if(null==tRecord){	//去空
							tRecordsIter.remove();
						}
						//tRecord = tRecordsIter.next();
						JSONObject teachingDetail = new JSONObject();
						teachingDetail.put("teachingDate", format.format(tRecord.getTeachingdate()));
						
						StringBuffer sb = new StringBuffer();
						sb.append(tRecord.getStarttime());
						sb.append(" ~ ");
						sb.append(tRecord.getEndtime());
						
						teachingDetail.put("teachingTime", sb.toString());
						teachingDetail.put("teachingNum", tRecord.getTeachingnum());
						
						//月提现课时总数
						if(tRecord.getTeachingnum()!=null){
							totalCheckLessons += tRecord.getTeachingnum();
						}
						
						teachingDetails.add(teachingDetail);
					}
					data.put("teachingDetails", teachingDetails);
					data.put("totalCheckLessons", totalCheckLessons);
					
					//补充其他信息				
					if(null!=tRecord){
						//获取老师姓名	
						String teacherId = tRecord.getTeacherid();
						if(StringUtils.isNotBlank(teacherId)){
							Teacher teacher = null;
							try {
								logger.info("查询老师：{teacherId:"+teacherId+"}");
								teacher = teacherDao.selectByPrimaryKey(teacherId);								
							} catch (Exception e) {
								logger.info("查询老师出错！");
								logger.error(e.getMessage());
							}
							if(null!=teacher){
									data.put("teacherName", teacher.getTeachername());
									data.put("teacherId", teacherId);
								}
							}
						//关联的课时交易Id
						data.put("lessonTradeId", tRecord.getLessonTradeId());
						
						try {
							if(null!=tRecord.getLessonTradeId()){
								logger.info("查询建议：lessonTradeId", tRecord.getLessonTradeId());
								Suggestions suggestions = suggestionDao.selectByPrimaryKey(tRecord.getLessonTradeId());
								data.put("suggestions", suggestions.getSuggestions());
								data.put("situations", suggestions.getSituations());
							}
						} catch (Exception e) {
							logger.info("查询建议出错！");
							logger.error(e.getMessage());
						}
						return data;
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	@Transactional
	@Override
	public int updateLessonTrade(LessonTrade record,Integer updatedFrozenLessons) {		
		if(null==record) {
			return 0;
		}			
		//设置老师提现成功
		record.setStatus((byte)0);
		
		//更新老师课时提现状态		
		try {
			lessonTradeDao.updateByPrimaryKeySelective(record);
		} catch (Exception e) {
			logger.info("更新提现状态失败！");
			logger.error(e.getMessage());
			throw e;
		}
		
		//更新老师课时提现总表
		String teacherId = record.getTeacherid();
		LessonTradeSum tradeSum = new LessonTradeSum();
		try {
			tradeSum.setFrozenlessonnum(updatedFrozenLessons.shortValue());
			tradeSum.setTeacherid(teacherId);
			
			return tradeSumDao.updateByPrimaryKeySelective(tradeSum);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}			
	}

}
