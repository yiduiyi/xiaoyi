package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IOrderService {
	
	/**
	 * 增加订单记录
	 * Params：{
			openId: 预约微信号（家长）ID 
			telNum: 联系方式（家长）
			parentName: 家长姓名
			studentName: 学生姓名
			lessonType: 预约课时类型（小学、初中、高中）
			purchaseNum: 购买课时数
		}
	 * @param params
	 * @return
	 */
	int addOrder(JSONObject params) throws Exception;
	
	int updateOrder(JSONObject params);
	
	List<JSONObject> getOrderList(JSONObject params) throws Exception;
	
	List<JSONObject> queryTeachingList(JSONObject params);
	
	List<JSONObject> queryCoursesInGrade(String gradeId);
	
}
