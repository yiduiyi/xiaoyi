package com.xiaoyi.teacher.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.TeacherIntegralSum;

public interface ITeacherIntegralSumService {
	//查询所有的教师总积分
	public List<JSONObject> getTeacherIntegralSumList();
	//查询教师总积分
	public TeacherIntegralSum getTeacherIntegralSum(String string);

}
