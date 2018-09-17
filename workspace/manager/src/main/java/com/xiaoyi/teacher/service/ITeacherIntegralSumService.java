package com.xiaoyi.teacher.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.TeacherIntegralSum;
import com.xiaoyi.teacher.vo.UpdateTeacherIntegralSumVo;

public interface ITeacherIntegralSumService {
	//查询所有的教师总积分
	public List<JSONObject> getTeacherIntegralSumList();
	//查询教师总积分
	public TeacherIntegralSum getTeacherIntegralSum(String teacherId);
	//同步修改教师总积分
	public int updateTeacherIntegralSum(UpdateTeacherIntegralSumVo updateTeacherIntegralSumVo);
	//添加教师积分总表
	public int insert(TeacherIntegralSum newTeacherIntegralSum);

}
