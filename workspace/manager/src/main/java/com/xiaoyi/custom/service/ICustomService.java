package com.xiaoyi.custom.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface ICustomService {
	
	List<JSONObject> queryTransactionCourses(String openId);
	
	/**
	 * ii.	新增预约
	 * {
	 * 		orderType(on/of),
	 * 		grade(),
	 * 		subject(),
	 * 		studentName,
	 * 		telphone,
	 * 		weixin
	 * }
	 * @return 
	 */
	int commitSchedule(JSONObject params);
	
	/**
	 * 
	 * @param openId
	 * @return
	 */
	List<JSONObject> getMySchedules(String openId);
}
