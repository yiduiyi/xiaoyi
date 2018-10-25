package com.xiaoyi.manager.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IDepartmentDao;
import com.xiaoyi.manager.domain.Department;
import com.xiaoyi.manager.service.IDepartmentService;
import com.xiaoyi.manager.service.IMenuService;
import com.xiaoyi.wechat.utils.UUIDUtil;
@Service("departmentService")
public class DepartmentServiceImpl implements IDepartmentService {
	@Resource
	private IDepartmentDao departmentDao;
	@Resource
	private IMenuService menuService;
	@Override
	public int insertDepartment(JSONObject reqData) {
		Department department = new Department();
		department.setDepartmentId(UUIDUtil.getUUIDPrimary());
		department.setDepartmentType(reqData.getShort("departmentType"));
		department.setDepartmentDesc(reqData.getString("departmentDesc"));
		department.setMenuCode(reqData.getShort("menuCode"));
		department.setParentMenuCode(reqData.getShort("parentMenuCode"));
		department.setCreateTime(new Date());
		department.setUpdateTime(new Date());
		return departmentDao.insertSelective(department);
	}
	@Override
	public int updateDepartment(JSONObject reqData) {
		Department department = departmentDao.selectByPrimaryKey(reqData.getString("departmentId"));
		if(null == department) {
			return -1;
		}
		department.setDepartmentType(reqData.getShort("departmentType"));
		department.setDepartmentDesc(reqData.getString("departmentDesc"));
		department.setMenuCode(reqData.getShort("menuCode"));
		department.setParentMenuCode(reqData.getShort("parentMenuCode"));
		department.setUpdateTime(new Date());
		return departmentDao.updateByPrimaryKeySelective(department);
	}
	@Override
	public int deleteDepartment(JSONObject reqData) {
		return departmentDao.deleteByPrimaryKey(reqData.getString("departmentId"));
	}
	@Override
	public List<JSONObject> getDepartmentList(JSONObject reqData) {
		List<JSONObject> result = departmentDao.getDepartmentList(reqData);
		if (CollectionUtils.isNotEmpty(result)) {
			Map<String, Object> menuNameMap = new HashMap<String, Object>();
			List<JSONObject> menuList = menuService.getMenuList(reqData);
			if(CollectionUtils.isNotEmpty(menuList)) {
				for (JSONObject jsonObject : menuList) {
					menuNameMap.put(jsonObject.getString("menuCode"), jsonObject.getString("menuName"));
				}
				for (JSONObject jsonObject : result) {
					jsonObject.put("menuName", menuNameMap.get(jsonObject.getString("menuCode")) == null ? "" : menuNameMap.get(jsonObject.getString("menuCode")));
					jsonObject.put("parentMenuName", menuNameMap.get(jsonObject.getString("parentMenuCode")) == null ? "" : menuNameMap.get(jsonObject.getString("parentMenuCode")));
				}
			}
		}
		return result;
	}

}
