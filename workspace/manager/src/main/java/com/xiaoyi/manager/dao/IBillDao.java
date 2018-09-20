package com.xiaoyi.manager.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Bill;

public interface IBillDao {
	public int deleteByPrimaryKey(String billId);

	// 新增派单订单
	public int insert(Bill record);

	public int insertSelective(Bill record);

	public Bill selectByPrimaryKey(String billId);
	//根据主键与字段进行修改
	public int updateByPrimaryKeySelective(Bill record);

	public int updateByPrimaryKeyWithBLOBs(Bill record);

	public int updateByPrimaryKey(Bill record);

	// 查询派单订单列表
	public List<JSONObject> getBillList(Map<String, Object> reqData);

	// 查询派单教师投递数量
	public List<JSONObject> getBillQuantityNums();
	//根据客服顾问主键查询合适的订单列表
	public List<JSONObject> selectSuitBillListByConsultantId(String consultantId);
	//查询所有的订单投递数量
	public List<JSONObject> getBillSendNum();
	//查询该教师所有投递的订单投递状态
	public List<JSONObject> getRecordStatus(String teacherid);
	//查询所有订单列表
	public List<JSONObject> getAllBillList();
	//查询我投递的订单列表
	public List<JSONObject> getMyBillRecord(String teacherid);

	public List<JSONObject> getAllSendBillList(@Param("billIdList")List<String> billIdList);
	//查询所有未被派出的订单
	public List<JSONObject> getAllInTheSingleBill();
	//查询老师当前接单列表
	public List<JSONObject> selectTeacherBills(@Param("teacherId")String teacherId);
}