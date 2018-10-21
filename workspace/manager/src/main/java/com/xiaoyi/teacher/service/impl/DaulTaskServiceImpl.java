package com.xiaoyi.teacher.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.exception.CommonRunException;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.custom.dao.IStudentTaskStatisticDao;
import com.xiaoyi.custom.domain.StudentTaskStatistic;
import com.xiaoyi.custom.domain.StudentTaskStatisticKey;
import com.xiaoyi.manager.dao.ITeacherDao;
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


}
