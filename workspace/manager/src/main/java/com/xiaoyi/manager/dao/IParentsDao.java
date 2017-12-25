package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.Parents;

public interface IParentsDao {
    int deleteByPrimaryKey(String parentid);

    int insert(Parents record);

    int insertSelective(Parents record);

    Parents selectByPrimaryKey(String parentid);

    int updateByPrimaryKeySelective(Parents record);

    int updateByPrimaryKey(Parents record);
}