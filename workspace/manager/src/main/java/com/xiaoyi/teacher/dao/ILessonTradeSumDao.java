package com.xiaoyi.teacher.dao;

import com.xiaoyi.teacher.domain.LessonTradeSum;

public interface ILessonTradeSumDao {
    int deleteByPrimaryKey(String teacherid);

    int insert(LessonTradeSum record);

    int insertSelective(LessonTradeSum record);

    LessonTradeSum selectByPrimaryKey(String teacherid);

    int updateByPrimaryKeySelective(LessonTradeSum record);

    int updateByPrimaryKey(LessonTradeSum record);
}