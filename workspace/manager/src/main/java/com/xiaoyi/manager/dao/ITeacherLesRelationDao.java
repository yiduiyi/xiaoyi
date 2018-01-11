package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.TeacherLesRelationKey;

public interface ITeacherLesRelationDao {
    int deleteByPrimaryKey(TeacherLesRelationKey key);

    int insert(TeacherLesRelationKey record);

    int insertSelective(TeacherLesRelationKey record);
}