package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IBillService {
	//新增派单订单信息
	public int insertBill(JSONObject reqData);
	//获取订单信息列表
	public List<JSONObject> getBillList(JSONObject reqData);
	//修改订单信息
	public int updateBill(JSONObject reqData);
	//推送订单信息至教师端
	public int sendBillToTeacher(JSONObject reqData);
	//修改教师投递状态
	public int updateBillRecord(JSONObject reqData);
	//删除订单信息
	public int deleteBill(JSONObject reqData);
	//根据课程顾问主键查询合适的订单列表
	public List<JSONObject> selectSuitBillListByConsultantId(String consultantId);
	//查询所有订单的投递数量
	public List<JSONObject> getBillSendNum();
	//查询该教师所有投递的订单投递状态
	public List<JSONObject> getRecordStatus(String teacherid);
	//查询所有的订单列表
	public List<JSONObject> getAllBillList();
	//查询我投递的订单
	public List<JSONObject> getMyBillRecord(String teacherid);
	//根据订单主键列表查询订单
	public List<JSONObject> getAllSendBillList(List<String> billIdList);

}
