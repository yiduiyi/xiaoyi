package com.xiaoyi.teacher.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface ITeacherIntegralSumService {
	//查询所有的教师总积分
	public List<JSONObject> getTeacherIntegralSumList();

}
