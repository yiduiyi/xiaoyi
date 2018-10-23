package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.Menu;

public interface IMenuDao {
    int deleteByPrimaryKey(String menuId);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(String menuId);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);
}