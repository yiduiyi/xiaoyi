package com.xiaoyi.manager.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.exception.CommonRunException;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.Semaster;
import com.xiaoyi.common.utils.ConstantUtil.VideoCourseType;
import com.xiaoyi.manager.dao.IVideoCourseDao;
import com.xiaoyi.manager.domain.VideoCourse;
import com.xiaoyi.manager.service.IVideoCourseService;
import com.xiaoyi.wechat.utils.UUIDUtil;
@Service("videoCourseService")
public class VideoCourseServiceImpl implements IVideoCourseService{
	@Resource
	private IVideoCourseDao videoCourseDao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public List<JSONObject> getDaulLessonList(JSONObject reqData) {
		List<JSONObject> datas = new ArrayList<JSONObject>();
		try {
			List<VideoCourse> list = videoCourseDao.selectVideoCourseListByConditions(reqData);//.getDaulLessonList(reqData);
			if(CollectionUtils.isNotEmpty(list)) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd hh:mm:ss");
				for (VideoCourse videoCourse : list) {
					JSONObject data = new JSONObject();
					
					data.put("h5VideoLink", videoCourse.getH5VideoLink());
					data.put("videoName", videoCourse.getVideoCourseName());
					data.put("uploadTime", sdf.format(videoCourse.getUploadTime()));
					
					//年级
					Short gradeId = videoCourse.getGradeId();
					if (null != gradeId) {
						for (Grade grade : Grade.values()) {
							if (grade.getValue() == gradeId) {
								data.put("gradeId", gradeId);
								data.put("gradeName", grade.getFullGradeName());
								break;
							}
						}
					}
					
					//科目
					Short courseId = videoCourse.getCourseId();//jsonObject.getInteger("courseId");
					if (null != courseId) {
						for (Course course : Course.values()) {
							if (course.getValue() == courseId) {
								data.put("courseId", courseId);
								data.put("courseName", course.toString());
								break;
							}
						}
					}
					
					//学期
					Byte semasterId = videoCourse.getSemaster();//jsonObject.getInteger("semester");
					if(semasterId != null) {
						String semasterName = null;
						for(Semaster s : Semaster.values()){
							if(s.getValue() == semasterId){
								data.put("semester", semasterId);
								semasterName = s.toString();
								break;
							}
						}
						data.put("semasterName", semasterName);
					}
					
					//同步课程视频类型
					Byte videoCourseType = videoCourse.getVideoCourseType();//jsonObject.getInteger("videoCourseType");
					if(videoCourseType != null) {
						for (VideoCourseType videoCourseTypeValue : VideoCourseType.values()) {
							if (videoCourseTypeValue.getValue() == videoCourseType) {
								data.put("videoCourseType", videoCourseType);
								data.put("videoCourseTypeName", videoCourseTypeValue.toString());
								break;
							}
						}
					}
					datas.add(data);
				}
			}			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询双师课程列表失败！");
			throw new CommonRunException(-1, "查询双师课程列表失败！");
		}
		
		return datas;
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
		String videoCourseId = reqData.getString("videoCourseId");
		if(StringUtils.isEmpty(videoCourseId)) {
			return -1;
		}
				
		VideoCourse videoCourse = new VideoCourse();///videoCourseDao.selectByPrimaryKey(reqData.getString("videoCourseId"));
		videoCourse.setVideoCourseId(videoCourseId);
		videoCourse.setVideoCourseName(reqData.getString("videoName"));
		videoCourse.setGradeId(reqData.getShort("gradeId"));
		videoCourse.setCourseId(reqData.getShort("courseId"));
		videoCourse.setSemaster(reqData.getByte("semaster"));
		videoCourse.setH5VideoLink(reqData.getString("h5VideoLink"));
		videoCourse.setVideoCourseType(reqData.getByte("videoCourseType"));
		return videoCourseDao.updateByPrimaryKeySelective(videoCourse);
	}

}
