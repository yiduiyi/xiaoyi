package com.xiaoyi.custom.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface ICustomService {
	
	List<JSONObject> queryTransactionCourses(String openId);
}
