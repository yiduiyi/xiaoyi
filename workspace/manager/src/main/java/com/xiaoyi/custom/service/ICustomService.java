package com.xiaoyi.custom.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.LessonTrade;
import com.xiaoyi.teacher.domain.LessonTradeSum;

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
	
	int confirmTRecords(JSONObject params) throws RuntimeException;
	
	/**
	 * 获取学情分析报告
	 */
	List<JSONObject> queryStuTeachingReport(JSONObject params);
	
	/**
	 * 家长投诉
	 */
	int insertComplains(JSONObject params);
	
	/**
	 * 获取补缴金额
	 */
	JSONObject getDebt(JSONObject params);
}
