package com.xiaoyi.manager.service;

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

}
