package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IDepartmentService {
	//新增部门信息
	public int insertDepartment(JSONObject reqData);
	//更新部门信息
	public int updateDepartment(JSONObject reqData);
	//删除部门信息
	public int deleteDepartment(JSONObject reqData);
	//查询部门列表
	public List<JSONObject> getDepartmentList(JSONObject reqData);

}
