package com.xiaoyi.teacher.dao;

import com.xiaoyi.teacher.domain.TeacherIntegral;

public interface ITeacherIntegralDao {
    int deleteByPrimaryKey(String teacherIntegralId);

    int insert(TeacherIntegral record);

    int insertSelective(TeacherIntegral record);

    TeacherIntegral selectByPrimaryKey(String teacherIntegralId);

    int updateByPrimaryKeySelective(TeacherIntegral record);

    int updateByPrimaryKey(TeacherIntegral record);
}