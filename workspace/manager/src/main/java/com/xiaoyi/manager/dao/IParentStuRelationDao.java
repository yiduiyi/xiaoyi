package com.xiaoyi.manager.dao;

import java.util.List;

import com.xiaoyi.manager.domain.ParentStuRelation;

public interface IParentStuRelationDao {
    int deleteByPrimaryKey(ParentStuRelation key);

    int insert(ParentStuRelation record);

    int insertSelective(ParentStuRelation record);
    
    List<ParentStuRelation> selectRelationsByParentId(String parentid);
}