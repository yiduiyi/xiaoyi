package com.xiaoyi.teacher.dao;

import com.xiaoyi.teacher.domain.TeacherIntegralSum;

public interface ITeacherIntegralSumDao {
    int deleteByPrimaryKey(String teacherid);

    int insert(TeacherIntegralSum record);

    int insertSelective(TeacherIntegralSum record);

    TeacherIntegralSum selectByPrimaryKey(String teacherid);

    int updateByPrimaryKeySelective(TeacherIntegralSum record);

    int updateByPrimaryKey(TeacherIntegralSum record);
}