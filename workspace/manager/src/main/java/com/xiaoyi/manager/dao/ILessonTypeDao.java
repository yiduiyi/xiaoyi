package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.LessonType;

public interface ILessonTypeDao {
    int deleteByPrimaryKey(Integer lessontype);

    int insert(LessonType record);

    int insertSelective(LessonType record);

    LessonType selectByPrimaryKey(Integer lessontype);

    int updateByPrimaryKeySelective(LessonType record);

    int updateByPrimaryKey(LessonType record);
}