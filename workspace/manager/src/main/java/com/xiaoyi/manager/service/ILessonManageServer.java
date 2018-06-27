package com.xiaoyi.manager.service;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Account;

public interface ILessonManageServer {

	List<JSONObject> getLessonTypeGroups();
	
	int updateLessonType(JSONObject params);
	
	/**
	 * 查询家长订单课时
	 * @return
	 */
	List<JSONObject> queryParentOrders();
	
	int updateParentOrder(JSONObject params);
}
