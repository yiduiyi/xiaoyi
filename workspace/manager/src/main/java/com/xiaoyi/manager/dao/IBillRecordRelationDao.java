package com.xiaoyi.manager.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.BillRecordRelation;

public interface IBillRecordRelationDao {
    int deleteByPrimaryKey(String billRecordId);

    int insert(BillRecordRelation record);

    int insertSelective(BillRecordRelation record);

    BillRecordRelation selectByPrimaryKey(String billRecordId);

    int updateByPrimaryKeySelective(BillRecordRelation record);

    int updateByPrimaryKey(BillRecordRelation record);
	
	public List<JSONObject> getBillRecordList(@Param("billId") String billId);
	//查询订单投递数量
	public Integer getBillRecordSendNumByBillId(String billId);
	//查询该订单billRecordId以外的所有投递记录
	public List<BillRecordRelation> getAllOtherBillRecord(@Param("billId")String billId,@Param("billRecordId") String billRecordId);
	//修改未被选中的订单为接单失败
	public void batchUpdateOtherBillRecord(List<BillRecordRelation> list);

	public List<BillRecordRelation> getAllBillRecordRelationListByBillId(@Param("billId")String billId);
}