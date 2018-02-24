package com.xiaoyi.manager.dao.web;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IWebManageDao {
	/**
	 * 获取明星学员
	 * @return
	 */
	List<JSONObject> selectStarMembers();
}
