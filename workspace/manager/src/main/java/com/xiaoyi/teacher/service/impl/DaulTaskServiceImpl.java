package com.xiaoyi.teacher.service.impl;

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
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.exception.CommonRunException;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.Semaster;
import com.xiaoyi.custom.dao.IStudentTaskDao;
import com.xiaoyi.custom.dao.IStudentTaskStatisticDao;
import com.xiaoyi.custom.domain.StudentTask;
import com.xiaoyi.custom.domain.StudentTaskStatistic;
import com.xiaoyi.custom.domain.StudentTaskStatisticKey;
import com.xiaoyi.manager.domain.Teacher;
import com.xiaoyi.teacher.dao.IDaulTaskDao;
import com.xiaoyi.teacher.dao.ITH5PlateDao;
import com.xiaoyi.teacher.dao.ITeachingRelationshipDao;
import com.xiaoyi.teacher.domain.TeachingRelationship;
import com.xiaoyi.teacher.service.IDaulTaskService;

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
			
			return teachingRelationshipDao.insertSelective(record);
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
			params.put("semaster", semaster);
			
			//查询可布置的视频课程列表
			List<JSONObject> availableTaskList = new ArrayList<JSONObject>();
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
			record.setTaskStatus((byte)1);	//1：已布置
			record.setTeacherId(params.getString("teacherId"));
			record.setTaskType(params.getByte("videoTaskType"));
			record.setVideoCourseId(params.getString("videoCourseId"));
			record.setGradeId(params.getShort("gradeId"));
			record.setCourseId(params.getShort("courseId"));
			
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
				if(null == taskStatistic){		
					taskStatistic = new StudentTaskStatistic();
					taskStatistic.setAccomplishRate((short)100);
					taskStatistic.s
				}
				
				
				taskStatisticDao.insertSelective(taskStatistic );
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

}
