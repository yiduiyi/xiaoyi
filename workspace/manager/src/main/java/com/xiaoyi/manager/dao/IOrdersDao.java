package com.xiaoyi.manager.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Orders;
import com.xiaoyi.manager.domain.OrdersKey;

public interface IOrdersDao {
    Orders selectOrderById(@Param("orderId") String orderId);
	
	int deleteByPrimaryKey(OrdersKey key);

    int insert(Orders record);

    int insertSelective(Orders record);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);

    Float getTotalTurnoverData(@Param("startTime")Date startTime, @Param("endTime")Date endTime);

	List<String> selectAllOrderIds(@Param("startTime")Date startTime, @Param("endTime")Date endTime);

	List<JSONObject> getOrdersAndConsultantId();

	List<JSONObject> selectAllOrders(@Param("startTime")Date startTime, @Param("endTime")Date endTime);
}