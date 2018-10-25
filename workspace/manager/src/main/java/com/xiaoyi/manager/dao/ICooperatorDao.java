package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.Cooperator;

public interface ICooperatorDao {
    int deleteByPrimaryKey(String cooperatorId);

    int insert(Cooperator record);

    int insertSelective(Cooperator record);

    Cooperator selectByPrimaryKey(String cooperatorId);

    int updateByPrimaryKeySelective(Cooperator record);

    int updateByPrimaryKey(Cooperator record);
}