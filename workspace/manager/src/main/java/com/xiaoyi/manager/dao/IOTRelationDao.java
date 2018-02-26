package com.xiaoyi.manager.dao;

import java.util.List;
import java.util.Map;

import com.xiaoyi.manager.domain.OrderTeachingRelation;

public interface IOTRelationDao {
	int insertOTRelations(List<OrderTeachingRelation> relations);
	int deleteOTRelations(Map<String,Object> parmas);
}
