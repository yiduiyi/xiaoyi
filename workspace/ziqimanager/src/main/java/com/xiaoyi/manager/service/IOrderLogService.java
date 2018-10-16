package com.xiaoyi.manager.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

public interface IOrderLogService {
	//获取订单记录
	public List<JSONObject> getOrderLogList(JSONObject reqData);
	//导出订单记录
	public int exportOrderLogList(JSONObject reqData, HttpServletResponse response);
	//查询单个用户购买订单列表
	public JSONObject getOrderLogByOpenId(JSONObject reqData);
	//同步小鹅通订单记录
	public void getXiaoETongOrderLog();
}
