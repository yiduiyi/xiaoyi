package com.xiaoyi.teacher.dao;

import com.xiaoyi.teacher.domain.TeacherBalanceWithdraw;

public interface ITeacherBalanceWithdrawDao {
    int deleteByPrimaryKey(String teacherid);

    int insert(TeacherBalanceWithdraw record);

    int insertSelective(TeacherBalanceWithdraw record);

    TeacherBalanceWithdraw selectByPrimaryKey(String teacherid);

    int updateByPrimaryKeySelective(TeacherBalanceWithdraw record);

    int updateByPrimaryKey(TeacherBalanceWithdraw record);
}