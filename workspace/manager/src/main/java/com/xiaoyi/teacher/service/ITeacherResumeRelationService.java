package com.xiaoyi.teacher.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.TeacherResumeRelation;

public interface ITeacherResumeRelationService {
	//获取教师简历
	public List<JSONObject> getTeacherResumeList();
	//添加教师与简历的绑定关系
	public int insert(TeacherResumeRelation teacherResumeRelation);
	//获取默认的教师简历
	public TeacherResumeRelation getDefaultResumeByTeacherId(String teacherid);

}
