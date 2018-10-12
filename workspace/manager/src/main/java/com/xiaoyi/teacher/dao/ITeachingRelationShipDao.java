package com.xiaoyi.teacher.dao;

import com.xiaoyi.teacher.domain.TeachingRelationShip;

public interface ITeachingRelationShipDao {
    int deleteByPrimaryKey(String teachingId);

    int insert(TeachingRelationShip record);

    int insertSelective(TeachingRelationShip record);

    TeachingRelationShip selectByPrimaryKey(String teachingId);

    int updateByPrimaryKeySelective(TeachingRelationShip record);

    int updateByPrimaryKey(TeachingRelationShip record);
}