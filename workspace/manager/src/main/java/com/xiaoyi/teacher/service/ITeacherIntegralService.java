package com.xiaoyi.teacher.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface ITeacherIntegralService {
	//查询教师违约记录
	public List<JSONObject> getTeacherTreaty(String teacherId);
	//添加教师违约记录
	public int insertTeacherTreaty(JSONObject reqData);
	//根据情景更新教师积分修改
	public int updateTeacherIntegral(JSONObject jsonObject);

}
