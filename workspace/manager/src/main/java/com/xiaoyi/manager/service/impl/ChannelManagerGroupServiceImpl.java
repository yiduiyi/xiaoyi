package com.xiaoyi.manager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IChannelManagerGroupDao;
import com.xiaoyi.manager.domain.ChannelManagerGroup;
import com.xiaoyi.manager.service.IChannelManagerGroupService;
import com.xiaoyi.wechat.utils.UUIDUtil;
@Service("channelGroupService")
public class ChannelManagerGroupServiceImpl implements IChannelManagerGroupService {
	@Resource
	private IChannelManagerGroupDao channelManagerGroupDao;
	@Override
	public int insertChannelManagerGroup(JSONObject reqData) {
		ChannelManagerGroup channelManagerGroup = new ChannelManagerGroup();
		channelManagerGroup.setChannelManagerGroupId(UUIDUtil.getUUIDPrimary());
		channelManagerGroup.setChannelManagerGroupName(reqData.getString("channelManagerGroupName"));
		channelManagerGroup.setChannelManagerId(reqData.getString("channelManagerId"));
		channelManagerGroup.setRoleId(reqData.getString("roleId"));
		return channelManagerGroupDao.insertSelective(channelManagerGroup);
	}
	@Override
	public int deleteChannelManagerGroup(JSONObject reqData) {
		return channelManagerGroupDao.deleteByPrimaryKey(reqData.getString("channelManagerGroupId"));
	}
	@Override
	public List<JSONObject> getChannelManagerGroupList(JSONObject reqData) {
		return channelManagerGroupDao.getChannelManagerGroupList(reqData);
	}

}
