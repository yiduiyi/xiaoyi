package com.xiaoyi.manager.service;

import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IConsultantOrderRelationService {
	//获取所有的认领记录
	public List<JSONObject> getConsultantOrderList();

	public int setClaimOrder(JSONObject reqData);

	public Integer getConsultantQuantityByTime(Date startTime, Date endTime);

	public List<JSONObject> getConsultantOrderRankingList(String consultantGroupId, Date startTime, Date endTime);

}
