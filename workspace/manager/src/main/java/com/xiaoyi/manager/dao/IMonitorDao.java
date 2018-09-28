package com.xiaoyi.manager.dao;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;

public interface IMonitorDao {

	//查询绑定的教师列表
	public List<JSONObject> getTeachersList(Map<String, Object> reqData);
	//查询每位绑定的老师上周课时
	public Integer getLatestWeekTeachingNum(Map<String, Object> params);
	//查询每位绑定的老师本周课时
	public Integer getCurrentWeekTeachingNum(Map<String, Object> params);
	//查询每位绑定的老师总课时
	public Integer getTotalTeachingNum(Map<String, Object> params);
	//查询评价列表
	public List<JSONObject> getEvaluatioList(String teachingId);
	//按月份查询每月的教师评价
	public JSONObject getMonthEvaluatio(Map<String, Object> reqData);
	//教学监控-获取上周/这周上课课时数
	public List<JSONObject> selectTeacherWeekTeachingList(List<String> teachingIdList);

}
