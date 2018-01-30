package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.User;
import com.xiaoyi.manager.domain.UserKey;

public interface IUserDao {
    int deleteByPrimaryKey(UserKey key);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(UserKey key);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKeyWithBLOBs(User record);

    int updateByPrimaryKey(User record);
}