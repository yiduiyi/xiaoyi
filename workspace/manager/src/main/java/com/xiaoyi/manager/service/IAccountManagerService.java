package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IAccountManagerService {
	//新增账号
	public int insertAccount(JSONObject reqData);
	//设置组长
	public int setLead(JSONObject reqData);
	//更新账号
	public int updateAccount(JSONObject reqData);
	//查询账号信息
	public List<JSONObject> getAccountList(JSONObject reqData);
	//删除账号
	public int deleteAccount(JSONObject reqData);

}
