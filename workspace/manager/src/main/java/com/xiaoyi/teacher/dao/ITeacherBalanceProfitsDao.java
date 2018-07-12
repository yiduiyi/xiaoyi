package com.xiaoyi.teacher.dao;

import com.xiaoyi.teacher.domain.TeacherBalanceProfits;
import com.xiaoyi.teacher.domain.TeacherBalanceProfitsKey;

public interface TeacherBalanceProfitsDao{
    int deleteByPrimaryKey(TeacherBalanceProfitsKey key);

    int insert(TeacherBalanceProfits record);

    int insertSelective(TeacherBalanceProfits record);

    TeacherBalanceProfits selectByPrimaryKey(TeacherBalanceProfitsKey key);

    int updateByPrimaryKeySelective(TeacherBalanceProfits record);

    int updateByPrimaryKey(TeacherBalanceProfits record);
}