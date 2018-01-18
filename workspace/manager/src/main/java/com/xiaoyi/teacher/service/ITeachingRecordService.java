package com.xiaoyi.teacher.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface ITeachingRecordService {
	
	List<JSONObject> getRecordList(JSONObject params) throws Exception;
}
