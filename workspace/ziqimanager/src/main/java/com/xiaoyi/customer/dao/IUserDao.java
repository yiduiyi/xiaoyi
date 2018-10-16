package com.xiaoyi.customer.dao;

import org.apache.ibatis.annotations.Param;

import com.xiaoyi.customer.domain.User;

public interface IUserDao {
    int deleteByPrimaryKey(String userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
	public User getUserByOpenId(@Param("openid")String openid);
}