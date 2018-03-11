package com.xiaoyi.custom.dao;

import java.util.List;

import com.xiaoyi.manager.domain.OrderSum;
import com.xiaoyi.manager.domain.Orders;
import com.xiaoyi.manager.domain.Schedule;
import com.xiaoyi.teacher.domain.TeachingRecord;

public interface ICustomDao {
    List<OrderSum> selectOrderSumsByParentId(String parentId);
    
    List<Orders> selectTransactionOrders(String parentId);
    
    List<Schedule> selectScheduleByParentsId(String parentId);
    
    List<TeachingRecord> selectTeachingRecordsByTeachingId(String teachingId);
}