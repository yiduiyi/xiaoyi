package com.xiaoyi.ma.dao;

import com.xiaoyi.ma.domain.Account;

public interface IAccountDao {
    int deleteByPrimaryKey(String accountid);

    int insert(Account record);

    int insertSelective(Account record);

    Account selectByPrimaryKey(String accountid);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);
}