package com.xiaoyi.teacher.dao;

import com.xiaoyi.teacher.domain.TeacherBalanceDailyProfits;
import com.xiaoyi.teacher.domain.TeacherBalanceDailyProfitsKey;

public interface ITeacherBalanceDailyProfitsDao{
    int deleteByPrimaryKey(TeacherBalanceDailyProfitsKey key);

    int insert(TeacherBalanceDailyProfits record);

    int insertSelective(TeacherBalanceDailyProfits record);

    TeacherBalanceDailyProfits selectByPrimaryKey(TeacherBalanceDailyProfitsKey key);

    int updateByPrimaryKeySelective(TeacherBalanceDailyProfits record);

    int updateByPrimaryKey(TeacherBalanceDailyProfits record);
}