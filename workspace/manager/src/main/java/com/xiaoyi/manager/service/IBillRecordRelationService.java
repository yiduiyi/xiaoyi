package com.xiaoyi.manager.service;

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

}
