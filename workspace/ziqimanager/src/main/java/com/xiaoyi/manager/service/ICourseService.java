package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface ICourseService {
	
	//插入新的课程
	public int insertCourse(JSONObject reqData);
	//更新课程
	public int updateCourse(JSONObject reqData);
	//删除课程
	public int daleteCourse(JSONObject reqData);
	//获取课程列表
	public List<JSONObject> getCourseList(JSONObject reqData);

}
