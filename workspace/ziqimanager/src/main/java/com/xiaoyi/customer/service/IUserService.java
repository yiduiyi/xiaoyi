package com.xiaoyi.customer.service;

import com.alibaba.fastjson.JSONObject;

public interface IUserService {
	//插入新的用户信息
	public void insertUser(JSONObject userMap);

}
