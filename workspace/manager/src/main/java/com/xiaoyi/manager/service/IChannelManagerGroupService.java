package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IChannelManagerGroupService {
	//新增渠道经理组
	public int insertChannelManagerGroup(JSONObject reqData);
	//删除渠道经理组
	public int deleteChannelManagerGroup(JSONObject reqData);
	//获取渠道经理组
	public List<JSONObject> getChannelManagerGroupList(JSONObject reqData);

}
