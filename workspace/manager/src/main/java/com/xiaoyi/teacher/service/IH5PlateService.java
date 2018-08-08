package com.xiaoyi.teacher.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;

public interface IH5PlateService {
	
	int queryBindStatus(String openId) throws Exception;
	
	//需先校验绑定账号
	int bindWechat(Map<String,Object> params) throws Exception;
	
	@Deprecated
	int withdrawLessons(JSONObject params) throws Exception;
	
	@Transactional
	int withdrawBalance(JSONObject params) throws Exception;
	
	JSONObject queryTeacherBalanceing(JSONObject params) throws Exception;
	
	List<JSONObject> getAvailableLessons(String teacherId) throws Exception;
	
	/**
	 * 每月发送定时提现消息
	 * @return
	 */
	int send();
}
