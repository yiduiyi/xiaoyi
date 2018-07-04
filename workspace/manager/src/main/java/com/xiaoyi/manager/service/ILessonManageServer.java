package com.xiaoyi.manager.service;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Account;

public interface ILessonManageServer {

	List<JSONObject> getLessonTypeGroups();
	
	int updateLessonType(JSONObject params);
	
	int deleteLessonPackage(String lessonId);
	
	/**
	 * 查询家长订单课时
	 * @return
	 */
	List<JSONObject> queryParentOrders();
	
	/**
	 * 	orderId: 课时包ID,
	 * 	oldLessonTypeId: 原订单类型Id (必填)
		parentId: 家长Id
		studentId: 学生Id
		updatedGradeId：年级ID（修改后年级Id）
		updatedPurchaseNum: 修改后课时
	 */
	int updateParentOrder(JSONObject params);
}
