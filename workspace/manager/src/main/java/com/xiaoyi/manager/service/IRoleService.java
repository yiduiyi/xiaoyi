package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IRoleService {
	//新增岗位信息
	public int insertRole(JSONObject reqData);
	//更新岗位信息
	public int updateRole(JSONObject reqData);
	//删除岗位信息
	public int deleteRole(JSONObject reqData);
	//获取所有岗位信息
	public List<JSONObject> getRoleList(JSONObject reqData);

}
