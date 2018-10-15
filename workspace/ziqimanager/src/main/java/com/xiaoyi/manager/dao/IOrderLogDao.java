package com.xiaoyi.manager.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.OrderLog;

public interface IOrderLogDao {
    int deleteByPrimaryKey(String orderLogId);

    int insert(OrderLog record);

    int insertSelective(OrderLog record);

    OrderLog selectByPrimaryKey(String orderLogId);

    int updateByPrimaryKeySelective(OrderLog record);

    int updateByPrimaryKey(OrderLog record);
    //获取订单记录列表
    public List<JSONObject> getOrderLogList(Map<String, Object> map);
  //查询单个用户购买订单列表
    public List<JSONObject> getOrderLogByOpenId(@Param("wxOpenId")String wxOpenId);
    //批量插入小鹅通订单记录
	public void batchInsertOrderLog(List<OrderLog> orderLogs);
}