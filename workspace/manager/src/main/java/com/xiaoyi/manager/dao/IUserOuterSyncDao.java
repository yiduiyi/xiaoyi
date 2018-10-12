package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.UserOuterSync;
import com.xiaoyi.manager.domain.UserOuterSyncKey;

public interface IUserOuterSyncDao{
    int deleteByPrimaryKey(UserOuterSyncKey key);

    int insert(UserOuterSync record);

    int insertSelective(UserOuterSync record);

    UserOuterSync selectByPrimaryKey(UserOuterSyncKey key);

    int updateByPrimaryKeySelective(UserOuterSync record);

    int updateByPrimaryKey(UserOuterSync record);
}