package com.xiaoyi.teacher.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.TeacherIntegralSum;

public interface IH5PlateService {
	
	int queryBindStatus(String openId) throws Exception;
	
	//需先校验绑定账号
	int bindWechat(Map<String,Object> params) throws Exception;
	
	@Deprecated
	int withdrawLessons(JSONObject params) throws Exception;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public int withdrawBalance(JSONObject params) throws Exception;
	
	JSONObject queryTeacherBalanceing(JSONObject params) throws Exception;
	
	List<JSONObject> getAvailableLessons(String teacherId) throws Exception;
	
	//获取老师所绑定的任教关系
	List<JSONObject> getTeachingRelationships(String openId);
	
	//iii.	获取历史课时提交记录（未实现）
	List<JSONObject> getHistoryTeachingRecords(JSONObject params);
	
	//iv.	提交课时记录（未实现）
	@Transactional
	int submitTeachingRecord(JSONObject params);
	
	/**
	 * 每月发送定时提现消息
	 * @return
	 */
	int send();
	//获取教师可任教科目
	public JSONObject getTeacherGootAt(String openId);
	//修改教师的可任教科目
	public int updateTeacherGootAt(JSONObject reqData);
	
	//获取教师接单设置
	public JSONObject getTeacherBillSet(JSONObject reqData);
	//添加教师接单设置
	public int insertTeacherBillSet(JSONObject reqData);
	//添加教师接单记录
	public int insertBillRecord(JSONObject reqData);
	//查询适合我的订单
	public List<JSONObject> getSuitBillList(JSONObject reqData);
	//查询所有订单
	public List<JSONObject> getAllBillList(JSONObject reqData);
	//查询所有投递的订单记录
	public List<JSONObject> getMyBillRecord(JSONObject reqData);
	//查询所有推送的订单
	public List<JSONObject> getAllSendBillList(JSONObject reqData);
	//根据年级ID查询课时费
	public List<JSONObject> getClassFeesList(JSONObject reqData);
	//查询所有教师的openId
	public List<JSONObject> getAllRemindTeacherList();
	//查询教师月度课时费排行榜
	public List<JSONObject> getMonthTeacherClassFeeRank();
	//查询教师积分总量
	public TeacherIntegralSum getTeacherIntegralSum(JSONObject reqData);
}
