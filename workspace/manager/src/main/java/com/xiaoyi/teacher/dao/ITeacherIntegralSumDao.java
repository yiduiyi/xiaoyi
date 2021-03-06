package com.xiaoyi.teacher.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.TeacherIntegralSum;
import com.xiaoyi.teacher.vo.UpdateTeacherIntegralSumVo;

public interface ITeacherIntegralSumDao {
    int deleteByPrimaryKey(String teacherid);

    int insert(TeacherIntegralSum record);

    int insertSelective(TeacherIntegralSum record);

    TeacherIntegralSum selectByPrimaryKey(String teacherid);

    int updateByPrimaryKeySelective(TeacherIntegralSum record);

    int updateByPrimaryKey(TeacherIntegralSum record);
    //查询所有教师总积分
	public List<JSONObject> getTeacherIntegralSumList();
	//同步修改教师总积分
	public int updateTeacherIntegralSum(UpdateTeacherIntegralSumVo updateTeacherIntegralSumVo);
}