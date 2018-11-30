package com.xiaoyi.manager.service;

import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface ICooperatorService {
	//新增合作商家
	public int insertCooperator(JSONObject reqData);
	//修改合作商家
	public int updateCooperator(JSONObject reqData);
	//删除合作商家
	public int deleteCooperator(JSONObject reqData);
	//获取合作商家列表
	public List<JSONObject> getCooperatorList(JSONObject reqData);
	
	public Integer getTotalCooperatorNum(String channelManagerGroupId, Date startTime, Date endTime);
	//获取商家试听排行
	public List<JSONObject> getCooperatorRankList(String channelManagerGroupId, Date startTime, Date endTime);

}
