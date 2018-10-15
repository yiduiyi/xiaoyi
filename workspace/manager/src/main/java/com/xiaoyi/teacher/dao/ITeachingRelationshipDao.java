package com.xiaoyi.teacher.dao;

import com.xiaoyi.teacher.domain.TeachingRelationship;

public interface ITeachingRelationshipDao {
    int deleteByPrimaryKey(String teachingId);

    int insert(TeachingRelationship record);

    int insertSelective(TeachingRelationship record);

    TeachingRelationship selectByPrimaryKey(String teachingId);

    int updateByPrimaryKeySelective(TeachingRelationship record);

    int updateByPrimaryKey(TeachingRelationship record);
}