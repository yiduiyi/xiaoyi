package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IWebManageService {
	List<JSONObject> queryStarMembers();
	
	int addStarMember(JSONObject params);
	
	int deleteStarMember(String memberId);
}
