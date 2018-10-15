package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IBigColumnService {
	//获取大专栏列表
	public List<JSONObject> getBigColumnList(JSONObject reqData);

}
