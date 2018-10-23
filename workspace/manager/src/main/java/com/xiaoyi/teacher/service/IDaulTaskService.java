package com.xiaoyi.teacher.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.ClassFees;

public interface IDaulTaskService {
	//查询老师绑定的任教关系
	public List<JSONObject> getPSTRelations(String openId);

	//设定绑定学生的年级和科目
	public int setBondGrade(JSONObject params);
	
	//• 查询可布置的视频课程列表（√）
	public List<JSONObject> getAvailableTasks(JSONObject params);
	
	//• 布置作业 
	public int distributeTask(JSONObject params);
	
	//• 查询老师给当前学生布置的双师课程作业列表
	public List<JSONObject> getStuTaskList(JSONObject params);
}
