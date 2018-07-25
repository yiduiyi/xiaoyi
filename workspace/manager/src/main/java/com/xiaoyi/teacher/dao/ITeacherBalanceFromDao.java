package com.xiaoyi.teacher.dao;

import com.xiaoyi.teacher.domain.TeacherBalanceFromKey;

public interface ITeacherBalanceFromDao {
    int deleteByPrimaryKey(TeacherBalanceFromKey key);

    int insert(TeacherBalanceFromKey record);

    int insertSelective(TeacherBalanceFromKey record);
}