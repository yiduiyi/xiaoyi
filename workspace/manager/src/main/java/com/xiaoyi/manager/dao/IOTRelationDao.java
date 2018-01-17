package com.xiaoyi.manager.dao;

import java.util.List;

import com.xiaoyi.manager.domain.OrderTeachingRelation;

public interface IOTRelationDao {
	int insertOTRelations(List<OrderTeachingRelation> relations);
	int deleteOTRelations(String orderId);
}
