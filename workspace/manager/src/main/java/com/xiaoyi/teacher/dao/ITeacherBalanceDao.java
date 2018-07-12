package com.xiaoyi.teacher.dao;

import com.xiaoyi.teacher.domain.TeacherBalance;

public interface TeacherBalanceDao {
    int deleteByPrimaryKey(String teacherid);

    int insert(TeacherBalance record);

    int insertSelective(TeacherBalance record);

    TeacherBalance selectByPrimaryKey(String teacherid);

    int updateByPrimaryKeySelective(TeacherBalance record);

    int updateByPrimaryKey(TeacherBalance record);
}