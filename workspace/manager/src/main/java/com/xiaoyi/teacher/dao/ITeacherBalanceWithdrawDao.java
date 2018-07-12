package com.xiaoyi.teacher.dao;

import com.xiaoyi.teacher.domain.TeacherBalanceWithdraw;
import com.xiaoyi.teacher.domain.TeacherBalanceWithdrawKey;

public interface TeacherBalanceWithdrawDao {
    int deleteByPrimaryKey(TeacherBalanceWithdrawKey key);

    int insert(TeacherBalanceWithdraw record);

    int insertSelective(TeacherBalanceWithdraw record);

    TeacherBalanceWithdraw selectByPrimaryKey(TeacherBalanceWithdrawKey key);

    int updateByPrimaryKeySelective(TeacherBalanceWithdraw record);

    int updateByPrimaryKey(TeacherBalanceWithdraw record);
}