package com.xiaoyi.manager.dao;

import java.util.List;
import java.util.Map;

import org.apache.xmlbeans.impl.jam.mutable.MSourcePosition;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Menu;

public interface IMenuDao {
    int deleteByPrimaryKey(String menuId);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(String menuId);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);
    //获取所有的菜单列表
	public List<JSONObject> getMenuList(Map<String, Object> map);
}