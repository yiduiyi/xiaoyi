package com.xiaoyi.manager.service;

import com.alibaba.fastjson.JSONObject;

public interface IDepartmentService {
	//新增部门信息
	public int insertDepartment(JSONObject reqData);
	//更新部门信息
	public int updateDepartment(JSONObject reqData);
	//删除部门信息
	public int deleteDepartment(JSONObject reqData);

}
