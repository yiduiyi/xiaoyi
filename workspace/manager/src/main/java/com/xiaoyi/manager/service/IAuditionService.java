package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IAuditionService {
	//获取试听单列表
	public List<JSONObject> getAuditionList(JSONObject reqData);
	//确认成单接口
	public int setAuditionStatus(JSONObject reqData);
	//分配课程顾问
	public int setAuditionConsultant(JSONObject reqData);
	
	public List<JSONObject> getAuditionConsultantGroupNum(JSONObject reqData);
	//添加新的试听单
	public int insertAudition(JSONObject reqData);

}
