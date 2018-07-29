package com.xiaoyi.teacher.dao;

import java.util.List;

import com.xiaoyi.teacher.domain.TeacherBalanceFromKey;

public interface ITeacherBalanceFromDao {
    int deleteByPrimaryKey(TeacherBalanceFromKey key);

    int insert(TeacherBalanceFromKey record);

    int insertSelective(TeacherBalanceFromKey record);
    
    int insertBatch(List<TeacherBalanceFromKey> records);
}