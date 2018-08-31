package com.xiaoyi.teacher.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface ITeachingRecordService {
	
	JSONObject getTRecordSum(JSONObject params) throws Exception;
	
	List<JSONObject> getRecordList(JSONObject params) throws Exception;
	
	/**
	 * 3 部分（1、增加老师带课记录,2、增加提现记录, 3、更新建议表及提现汇总表）
	 * @param params
	 * @return
	 */
	int insertTeachingRecords(JSONObject params);
	
	/**
	 * 查看老师提现记录列表
	 * @param params
	 * @return
	 */
	List<JSONObject> queryWithdrawRecords(JSONObject params);		

	int updateLessonTrade(String lessonTradeId);
	
	/**
	 * 获取微信端课时记录
	 * @param params
	 * @return
	 */
	List<JSONObject> getWechatTeachingRecords(JSONObject params);
}
