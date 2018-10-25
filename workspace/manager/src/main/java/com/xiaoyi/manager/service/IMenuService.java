package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IMenuService {
	//插入菜单
	public int insertMenu(JSONObject reqData);
	//更新菜单
	public int updateMenu(JSONObject reqData);
	//删除菜单
	public int deleteMenu(JSONObject reqData);
	//获取菜单列表
	public List<JSONObject> getMenuList(JSONObject reqData);

}
