package com.xiaoyi.teacher.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;

public interface IH5PlateService {
	
	int queryBindStatus(String openId) throws Exception;
	
	//需先校验绑定账号
	int bindWechat(Map<String,Object> params) throws Exception;
	
	@Deprecated
	int withdrawLessons(JSONObject params) throws Exception;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public int withdrawBalance(JSONObject params) throws Exception;
	
	JSONObject queryTeacherBalanceing(JSONObject params) throws Exception;
	
	List<JSONObject> getAvailableLessons(String teacherId) throws Exception;
	
	//获取老师所绑定的任教关系
	List<JSONObject> getTeachingRelationships(String openId);
	
	//iii.	获取历史课时提交记录（未实现）
	List<JSONObject> getHistoryTeachingRecords(JSONObject params);
	
	//iv.	提交课时记录（未实现）
	@Transactional
	int submitTeachingRecord(JSONObject params);
	
	/**
	 * 每月发送定时提现消息
	 * @return
	 */
	int send();
}
