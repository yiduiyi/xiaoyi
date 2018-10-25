package com.xiaoyi.manager.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IRoleDao;
import com.xiaoyi.manager.domain.Role;
import com.xiaoyi.manager.service.IRoleService;
import com.xiaoyi.wechat.utils.UUIDUtil;
@Service("roleService")
public class RoleServiceImpl implements IRoleService {
	@Resource
	private IRoleDao roleDao;
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
		return 0;
	}

}
