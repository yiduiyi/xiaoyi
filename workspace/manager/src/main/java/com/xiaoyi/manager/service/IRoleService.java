package com.xiaoyi.manager.service;

import com.alibaba.fastjson.JSONObject;

public interface IRoleService {
	//新增岗位信息
	public int insertRole(JSONObject reqData);
	//更新岗位信息
	public int updateRole(JSONObject reqData);

}
