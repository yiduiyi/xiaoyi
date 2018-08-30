package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IMonitorService {
	
	//教学监控列表查询
	public List<JSONObject> getTeachingProcess(JSONObject reqData);
	//查询绑定教师的家长评价
	public JSONObject getCustomFeedback(JSONObject reqData);

}
