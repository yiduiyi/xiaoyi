package com.xiaoyi.teacher.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.TeacherIntegralSum;
import com.xiaoyi.teacher.vo.UpdateTeacherIntegralSumVo;

public interface ITeacherIntegralSumService {
	//查询所有的教师总积分
	public List<JSONObject> getTeacherIntegralSumList();
	//查询教师总积分
	public TeacherIntegralSum getTeacherIntegralSum(String string);
	//同步修改教师总积分
	public int updateTeacherIntegralSum(UpdateTeacherIntegralSumVo updateTeacherIntegralSumVo);

}
