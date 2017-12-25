package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.Class;
import com.xiaoyi.manager.domain.ClassKey;

public interface IClassDao {
    int deleteByPrimaryKey(ClassKey key);

    int insert(Class record);

    int insertSelective(Class record);

    Class selectByPrimaryKey(ClassKey key);

    int updateByPrimaryKeySelective(Class record);

    int updateByPrimaryKey(Class record);
}