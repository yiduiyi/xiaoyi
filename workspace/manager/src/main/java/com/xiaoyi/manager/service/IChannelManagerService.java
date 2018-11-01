package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.ChannelManager;

public interface IChannelManagerService {
	//新增渠道经理
	public Integer insertChannelManager(ChannelManager channelManager);
	//获取渠道经理
	public List<JSONObject> getChannelManagerList();
	public int updateChannelManager(JSONObject reqData);

}
