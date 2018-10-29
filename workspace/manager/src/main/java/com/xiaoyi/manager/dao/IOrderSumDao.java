package com.xiaoyi.manager.dao;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.OrderSum;
import com.xiaoyi.manager.domain.OrderSumKey;

public interface IOrderSumDao {
    int deleteByPrimaryKey(OrderSumKey key);

    int insert(OrderSum record);

    int insertSelective(OrderSum record);

    List<OrderSum> selectOrderSumBatchByKey(List<OrderSumKey> keys);
    
    OrderSum selectByPrimaryKey(OrderSumKey key);

    int updateByPrimaryKeySelective(OrderSum record);

    int updateByPrimaryKey(OrderSum record);

	List<JSONObject> getClaimOrderList(Map<String, Object> map);
}