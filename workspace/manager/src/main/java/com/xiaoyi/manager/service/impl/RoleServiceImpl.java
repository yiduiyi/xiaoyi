package com.xiaoyi.manager.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IRoleDao;
import com.xiaoyi.manager.domain.Role;
import com.xiaoyi.manager.service.IMenuService;
import com.xiaoyi.manager.service.IRoleService;
import com.xiaoyi.wechat.utils.UUIDUtil;
@Service("roleService")
public class RoleServiceImpl implements IRoleService {
	@Resource
	private IRoleDao roleDao;
	@Resource
	private IMenuService menuService;
	@Override
	public int insertRole(JSONObject reqData) {
		Role role = new Role();
		role.setRoleId(UUIDUtil.getUUIDPrimary());
		role.setRoleName(reqData.getString("roleName"));
		role.setRoleCode(reqData.getShort("roleCode"));
		role.setDepartmentId(reqData.getString("departmentId"));
		role.setParentRoleCode(reqData.getShort("parentRoleCode"));
		role.setMenuCode(reqData.getShort("menuCode"));
		role.setGrantMenuType(reqData.getShort("grantMenuType"));
		return roleDao.insertSelective(role);
	}
	@Override
	public int updateRole(JSONObject reqData) {
		Role role = roleDao.selectByPrimaryKey(reqData.getString("roleId"));
		if(null == role) {
			return -1;
		}
		role.setRoleName(reqData.getString("roleName"));
		role.setRoleCode(reqData.getShort("roleCode"));
		role.setDepartmentId(reqData.getString("departmentId"));
		role.setParentRoleCode(reqData.getShort("parentRoleCode"));
		role.setMenuCode(reqData.getShort("menuCode"));
		role.setGrantMenuType(reqData.getShort("grantMenuType"));
		return roleDao.updateByPrimaryKeySelective(role);
	}
	@Override
	public int deleteRole(JSONObject reqData) {
		return roleDao.deleteByPrimaryKey(reqData.getString("roleId"));
	}
	@Override
	public List<JSONObject> getRoleList(JSONObject reqData) {
		List<JSONObject> result = roleDao.getRoleList(reqData);
		if(CollectionUtils.isNotEmpty(result)) {
			Map<String, Object> menuNameMap = new HashMap<String, Object>();
			Map<String, Object> roleNameMap = new HashMap<String, Object>();
			List<JSONObject> menuList = menuService.getMenuList(reqData);
			if(CollectionUtils.isNotEmpty(menuList)) {
				for (JSONObject jsonObject : menuList) {
					menuNameMap.put(jsonObject.getString("menuCode"), jsonObject.getString("menuName"));
				}
				for (JSONObject jsonObject : result) {
					roleNameMap.put(jsonObject.getString("roleCode"), jsonObject.getString("roleName"));
				}
				for (JSONObject jsonObject : result) {
					jsonObject.put("menuName", menuNameMap.get(jsonObject.getString("menuCode")) == null ? "" : menuNameMap.get(jsonObject.getString("menuCode")));
					jsonObject.put("parentRoleName", roleNameMap.get(jsonObject.getString("parentRoleCode")) == null ? "" : roleNameMap.get(jsonObject.getString("parentRoleCode")));
				}
			}
		}
		return result;
	}

}
