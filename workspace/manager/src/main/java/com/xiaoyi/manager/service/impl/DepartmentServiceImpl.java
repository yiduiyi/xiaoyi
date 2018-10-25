package com.xiaoyi.manager.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IDepartmentDao;
import com.xiaoyi.manager.domain.Department;
import com.xiaoyi.manager.service.IDepartmentService;
import com.xiaoyi.wechat.utils.UUIDUtil;
@Service("departmentService")
public class DepartmentServiceImpl implements IDepartmentService {
	@Resource
	private IDepartmentDao departmentDao;
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
		// TODO Auto-generated method stub
		return departmentDao.deleteByPrimaryKey(reqData.getString("departmentId"));
	}

}
