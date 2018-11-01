package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.ConsultantGroup;

public interface IConsultantGroupService {
	//新增课程顾问组
	public int insertConsultantGroup(JSONObject reqData);
	//删除课程顾问组
	public int deleteConsultantGroup(JSONObject reqData);
	//查询课程顾问组
	public List<JSONObject> getConsultantGroupList(JSONObject reqData);
	//新增课程顾问组
	public Integer addConsultantGroup(ConsultantGroup consultantGroup);
	//查询课程顾问组信息
	public List<JSONObject> getAllConsultantGroupList();
	
	public List<JSONObject> getConsultantList(JSONObject reqData);


}
