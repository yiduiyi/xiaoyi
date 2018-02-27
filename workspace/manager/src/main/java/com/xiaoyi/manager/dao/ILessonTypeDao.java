package com.xiaoyi.manager.dao;

import java.util.List;
import java.util.Map;

import com.xiaoyi.manager.domain.LessonType;

public interface ILessonTypeDao {
    int deleteByPrimaryKey(Integer lessontype);

    int insert(LessonType record);

    int insertSelective(LessonType record);

    LessonType selectByPrimaryKey(Integer lessontype);

    List<LessonType> selectByParams(Map<String,Object> params);
    int updateByPrimaryKeySelective(LessonType record);

    int updateByPrimaryKey(LessonType record);
}