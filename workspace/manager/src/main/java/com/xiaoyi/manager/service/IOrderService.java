package com.xiaoyi.manager.service;

import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Orders;

public interface IOrderService {
	
	Orders queryOrderById(String orderId);
	
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
	
	int updateOrderSum(JSONObject params);
	
	List<JSONObject> getOrderList(JSONObject params) ;
	
	List<JSONObject> queryTeachingList(JSONObject params);

	List<JSONObject> queryCourseList(JSONObject params);
	
	List<JSONObject> queryMTeachings(JSONObject params);
	
	List<JSONObject> queryMOrders(JSONObject params);
	
	int deleteTeachingTeacher(JSONObject params);
	//获取认领列表
	List<JSONObject> getClaimOrderList(JSONObject reqData);

	Float getTotalTurnoverData(Date startTime, Date endTime);

	Integer getRenewalNum(Date startTime, Date endTime);

	List<JSONObject> getChannelData(Date startTime, Date endTime);
}
