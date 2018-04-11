package com.xiaoyi.teacher.dao;

import java.util.List;

import com.xiaoyi.teacher.domain.LessonTrade;

public interface ILessonTradeDao {
    int deleteByPrimaryKey(String lessontradeid);

    int insert(LessonTrade record);

    int insertSelective(LessonTrade record);

    LessonTrade selectByPrimaryKey(String lessontradeid);

    int updateByPrimaryKeySelective(LessonTrade record);

    int updateByPrimaryKey(LessonTrade record);
    
    int updateStatusByLessonTradeIds(List<String> lessonTradeIds);
}