package com.xiaoyi.manager.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.Subjects;
import com.xiaoyi.manager.dao.ICourseDao;
import com.xiaoyi.manager.domain.Course;
import com.xiaoyi.manager.service.ICourseService;
import com.xiaoyi.wechat.utils.UUIDUtil;
@Service("courseService")
public class CourseServiceImpl implements ICourseService {
	@Resource
	private ICourseDao courseDao;
	@Override
	public int insertCourse(JSONObject reqData) {
		Course course = new Course();
		course.setCourseId(UUIDUtil.getUUIDPrimary());
		course.setBigColumnId(reqData.getString("bigColumnId"));
		course.setTalkNumber(reqData.getInteger("talkNumber"));
		course.setGradeId(reqData.getInteger("gradeId"));
		course.setSubjectsId(reqData.getString("subjectsId"));
		course.setSemester(reqData.getInteger("semester"));
		course.setCourseName(reqData.getString("courseName"));
		course.setH5Link(reqData.getString("h5Link"));
		course.setCreateTime(new Date());
		course.setUpdateTime(new Date());
		course.setStatus(ConstantUtil.COURSE_STATUS_NORMAL);
		return courseDao.insertSelective(course);
	}
	@Override
	public int updateCourse(JSONObject reqData) {
		Course course = courseDao.selectByPrimaryKey(reqData.getString("courseId"));
		if(course == null) {
			return -1;
		}
		course.setTalkNumber(reqData.getInteger("talkNumber"));
		course.setGradeId(reqData.getInteger("gradeId"));
		course.setSubjectsId(reqData.getString("subjectsId"));
		course.setSemester(reqData.getInteger("semester"));
		course.setCourseName(reqData.getString("courseName"));
		course.setH5Link(reqData.getString("h5Link"));
		course.setUpdateTime(new Date());
		return courseDao.updateByPrimaryKeySelective(course);
	}
	@Override
	public int daleteCourse(JSONObject reqData) {
		Course course = courseDao.selectByPrimaryKey(reqData.getString("courseId"));
		if(course == null) {
			return -1;
		}
		course.setStatus(ConstantUtil.COURSE_STATUS_REMOVE);
		course.setUpdateTime(new Date());
		return courseDao.updateByPrimaryKeySelective(course);
	}
	@Override
	public List<JSONObject> getCourseList(JSONObject reqData) {
		List<JSONObject> result = courseDao.getCourseList(reqData);
		if(CollectionUtils.isNotEmpty(result)) {
			for (JSONObject jsonObject : result) {
				//转换科目名称
				Integer subjectsId = jsonObject.getInteger("subjectsId");
				if(null!=subjectsId) {
					for (Subjects subjects : Subjects.values()) {
						if(subjectsId == subjects.getValue()) {
							jsonObject.put("subjectsName", subjects.toString());
						}
					}
				}
				//转换年级名称
				Integer gradeId = jsonObject.getInteger("gradeId");
				if(null!=gradeId) {
					for(Grade grade : Grade.values()) {
						if(grade.getValue() == gradeId) {
							jsonObject.put("gradeName", grade.getFullGradeName());
							break;
						}
					}
				}
				
				Integer semester = jsonObject.getInteger("semester");
				if(semester != null) {
					if(semester == 0) {
						jsonObject.put("semesterName", ConstantUtil.LAST_SEMASTER);
					}else if(semester == 1) {
						jsonObject.put("semesterName", ConstantUtil.NEXT_SEMASTER);
					}
				}
			}
		}
		return result;
	}
}
