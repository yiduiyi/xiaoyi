package com.xiaoyi.manager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.VideoCourseType;
import com.xiaoyi.manager.dao.IVideoCourseDao;
import com.xiaoyi.manager.domain.VideoCourse;
import com.xiaoyi.manager.service.IVideoCourseService;
import com.xiaoyi.wechat.utils.UUIDUtil;
@Service("videoCourseService")
public class VideoCourseServiceImpl implements IVideoCourseService{
	@Resource
	private IVideoCourseDao videoCourseDao;
	@Override
	public List<JSONObject> getDaulLessonList(JSONObject reqData) {
		List<JSONObject> list = videoCourseDao.getDaulLessonList(reqData);
		if(CollectionUtils.isNotEmpty(list)) {
			for (JSONObject jsonObject : list) {
				Integer gradeId = jsonObject.getInteger("gradeId");
				if (null != gradeId) {
					for (Grade grade : Grade.values()) {
						if (grade.getValue() == gradeId) {
							jsonObject.put("gradeName", grade.getFullGradeName());
							break;
						}
					}
				}
				Integer courseId = jsonObject.getInteger("courseId");
				if (null != courseId) {
					for (Course course : Course.values()) {
						if (course.getValue() == courseId) {
							jsonObject.put("courseName", course.toString());
							break;
						}
					}
				}
				Integer semasterId = jsonObject.getInteger("semester");
				if(semasterId != null) {
					String semasterName = null;
					if(semasterId == 1) {
						semasterName = ConstantUtil.LAST_SEMASTER;
					}else if(semasterId == 2) {
						semasterName = ConstantUtil.NEXT_SEMASTER;
					}
					jsonObject.put("semasterName", semasterName);
				}
				Integer videoCourseType = jsonObject.getInteger("videoCourseType");
				if(videoCourseType != null) {
					for (VideoCourseType videoCourseTypeValue : VideoCourseType.values()) {
						if (videoCourseTypeValue.getValue() == videoCourseType) {
							jsonObject.put("videoCourseType", videoCourseTypeValue.toString());
							break;
						}
					}
				}
			}
		}
		return list;
	}
	@Override
	public int insertDaulLesson(JSONObject reqData) {
		VideoCourse videoCourse = new VideoCourse();
		videoCourse.setVideoCourseId(UUIDUtil.getUUIDPrimary());
		videoCourse.setVideoCourseName(reqData.getString("videoName"));
		videoCourse.setGradeId(reqData.getShort("gradeId"));
		videoCourse.setCourseId(reqData.getShort("courseId"));
		videoCourse.setSemaster(reqData.getByte("semaster"));
		videoCourse.setH5VideoLink(reqData.getString("h5VideoLink"));
		videoCourse.setVideoCourseType(reqData.getByte("videoCourseType"));
		return videoCourseDao.insertSelective(videoCourse);
	}
	@Override
	public int updateDaulLesson(JSONObject reqData) {
		VideoCourse videoCourse = videoCourseDao.selectByPrimaryKey(reqData.getString("videoCourseId"));
		if(videoCourse == null ) {
			return -1;
		}
		videoCourse.setVideoCourseName(reqData.getString("videoName"));
		videoCourse.setGradeId(reqData.getShort("gradeId"));
		videoCourse.setCourseId(reqData.getShort("courseId"));
		videoCourse.setSemaster(reqData.getByte("semaster"));
		videoCourse.setH5VideoLink(reqData.getString("h5VideoLink"));
		videoCourse.setVideoCourseType(reqData.getByte("videoCourseType"));
		return videoCourseDao.updateByPrimaryKeySelective(videoCourse);
	}

}
