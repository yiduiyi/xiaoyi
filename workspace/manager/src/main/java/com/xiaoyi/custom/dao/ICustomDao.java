package com.xiaoyi.custom.dao;

import java.util.List;

import com.xiaoyi.manager.domain.OrderSum;
import com.xiaoyi.manager.domain.Orders;

public interface ICustomDao {
    List<OrderSum> selectOrderSumsByParentId(String parentId);
    
    List<Orders> selectTransactionOrders(String parentId);
}