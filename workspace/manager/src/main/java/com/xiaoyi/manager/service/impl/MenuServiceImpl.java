package com.xiaoyi.manager.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IMenuDao;
import com.xiaoyi.manager.domain.Menu;
import com.xiaoyi.manager.service.IMenuService;
import com.xiaoyi.wechat.utils.UUIDUtil;
@Service("menuService")
public class MenuServiceImpl implements IMenuService {
	@Resource
	IMenuDao menuDao;
	@Override
	public int insertMenu(JSONObject reqData) {
		Menu menu = new Menu();
		menu.setMenuId(UUIDUtil.getUUIDPrimary());
		menu.setMenuName(reqData.getString("menuName "));
		menu.setMenuCode(reqData.getShort("menuCode "));
		menu.setParentMenuCode(reqData.getShort("parentMenuCode "));
		menu.setCreateTime(new Date());
		return menuDao.insertSelective(menu);
	}
	@Override
	public int updateMenu(JSONObject reqData) {
		Menu menu = menuDao.selectByPrimaryKey(reqData.getString("menuId"));
		if(null == menu) {
			return -1;
		}
		menu.setMenuName(reqData.getString("menuName "));
		menu.setMenuCode(reqData.getShort("menuCode "));
		menu.setParentMenuCode(reqData.getShort("parentMenuCode "));
		return menuDao.updateByPrimaryKeySelective(menu);
	}
	@Override
	public int deleteMenu(JSONObject reqData) {
		return menuDao.deleteByPrimaryKey(reqData.getString("menuId"));
	}
	@Override
	public List<JSONObject> getMenuList(JSONObject reqData) {
		return menuDao.getMenuList(reqData);
	}
	
}
