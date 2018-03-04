package com.xiaoyi.custom.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

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
import com.xiaoyi.manager.domain.Orders;
import com.xiaoyi.manager.domain.ParentStuRelation;
import com.xiaoyi.manager.domain.Parents;
import com.xiaoyi.manager.domain.Schedule;
import com.xiaoyi.manager.domain.Student;
import com.xiaoyi.manager.domain.Teacher;
import com.xiaoyi.manager.service.ICommonService;

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

}
