package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IScheduleService {
	
	/**
	 * 增加预约记录
	 * Params：{
			openId: 预约微信号（家长）ID 
			telNum: 联系方式（家长）
			weChatNum: 微信号（家长）
			studentName: 学生姓名
			lessonType: 预约课时类型（小学、初中、高中）
		}
	 * @param schedule
	 * @return
	 */
	int addSchedule(JSONObject schedule);
	
	int deleteSchedule(String scheduleId);
	
	int updateSchedule(JSONObject schedule);
	
	List<JSONObject> getScheduleList(JSONObject params);
}
