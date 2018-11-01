package com.xiaoyi.manager.service;

import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.BillRecordRelation;

public interface IBillRecordRelationService {
	//查询订单投递记录
	public List<JSONObject> getBillRecordList(JSONObject reqData);
	//修改教师投递状态
	public int updateBillRecord(BillRecordRelation record);
	//添加教师投递记录
	public int insert(BillRecordRelation billRecordRelation);
	//查询订单投递数量
	public Integer getBillRecordSendNumByBillId(String billId);
	//修改未被选中的订单为接单失败
	public void updateOtherBillRecord(String billId, String billRecordId);
	//查询被删除订单下的所有订单投递记录
	public void getAllBillRecordRelationListByBillId(String billId);
	
	public List<JSONObject> getBillRecordDataByTime(Date startTime, Date endTime);

}
