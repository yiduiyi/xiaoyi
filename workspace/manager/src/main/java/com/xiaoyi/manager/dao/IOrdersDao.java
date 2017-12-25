package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.Orders;
import com.xiaoyi.manager.domain.OrdersKey;

public interface IOrdersDao {
    int deleteByPrimaryKey(OrdersKey key);

    int insert(Orders record);

    int insertSelective(Orders record);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);
}