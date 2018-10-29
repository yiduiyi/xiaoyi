package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IConsultantOrderRelationService {
	//获取所有的认领记录
	public List<JSONObject> getConsultantOrderList();

	public int setClaimOrder(JSONObject reqData);

}
