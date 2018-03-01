package com.xiaoyi.manager.dao;

import java.util.List;
import java.util.Map;

import com.xiaoyi.manager.domain.LessonType;
import com.xiaoyi.manager.domain.LessonTypeKey;

public interface ILessonTypeDao {
    int deleteByPrimaryKey(LessonTypeKey key);

    int insert(LessonType record);

    int insertSelective(LessonType record);

    LessonType selectByPrimaryKey(LessonTypeKey key);

    int updateByPrimaryKeySelective(LessonType record);

    int updateByPrimaryKey(LessonType record);

    List<LessonType> selectByParams(Map<String,Object> params);

}