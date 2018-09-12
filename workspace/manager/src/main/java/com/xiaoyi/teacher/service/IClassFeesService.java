package com.xiaoyi.teacher.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IClassFeesService {
	//根据年级主键查询课时费信息
	public List<JSONObject> getClassFeesList(String gradeId);

}
