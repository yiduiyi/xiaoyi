package com.xiaoyi.teacher.dao;

import java.util.List;

import com.xiaoyi.teacher.domain.TeacherBalanceDailyProfits;
import com.xiaoyi.teacher.domain.TeacherBalanceDailyProfitsKey;

public interface ITeacherBalanceDailyProfitsDao{
    int deleteByPrimaryKey(TeacherBalanceDailyProfitsKey key);

    int insert(TeacherBalanceDailyProfits record);

    int insertSelective(TeacherBalanceDailyProfits record);
    
    int insertTeacherDailyFrofitBatch(List<TeacherBalanceDailyProfits> list);
    
    TeacherBalanceDailyProfits selectByPrimaryKey(TeacherBalanceDailyProfitsKey key);

    int updateByPrimaryKeySelective(TeacherBalanceDailyProfits record);

    int updateByPrimaryKey(TeacherBalanceDailyProfits record);
}