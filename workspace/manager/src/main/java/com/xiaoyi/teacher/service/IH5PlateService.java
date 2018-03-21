package com.xiaoyi.teacher.service;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;

public interface IH5PlateService {
	
	int queryBindStatus(String openId) throws Exception;
	
	//需先校验绑定账号
	int bindWechat(Map<String,Object> params) throws Exception;
	
	int withdrawLessons(JSONObject params) throws Exception;
	
	List<JSONObject> getAvailableLessons(String teacherId) throws Exception;
}
