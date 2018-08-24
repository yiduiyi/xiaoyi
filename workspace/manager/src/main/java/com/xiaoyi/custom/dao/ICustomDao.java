package com.xiaoyi.custom.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.OrderSum;
import com.xiaoyi.manager.domain.Orders;
import com.xiaoyi.manager.domain.Schedule;
import com.xiaoyi.teacher.domain.TeachingRecord;

public interface ICustomDao {
    List<OrderSum> selectOrderSumsByParentId(String parentId);
    
    List<Orders> selectTransactionOrders(String parentId);
    
    List<Schedule> selectScheduleByParentsId(String parentId);
    
    List<TeachingRecord> selectTeachingRecordsByTeachingId(Map<String,Object> params);
    //获取家长对应的学生列表
	public List<JSONObject> getPSRList(@Param("openid")String openid);
	//获取某月学生上课记录详情
	public List<JSONObject> getStuTeachingDetailByMonth(Map<String,Object> reqData);
}