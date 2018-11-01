package com.xiaoyi.manager.service;

import java.text.ParseException;

import com.alibaba.fastjson.JSONObject;

public interface IPerformanceService {
	// 运营数据接口
	public JSONObject getOperationalData(JSONObject reqData) throws ParseException;

	public JSONObject getConsultantGroupData(JSONObject reqData);
}
