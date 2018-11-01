package com.xiaoyi.manager.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.manager.dao.IChannelManagerDao;
import com.xiaoyi.manager.domain.ChannelManager;
import com.xiaoyi.manager.service.IChannelManagerService;
@Service("channelManagerService")
public class ChannelManagerServiceImpl implements IChannelManagerService {
	@Resource
	private IChannelManagerDao channelManagerDao;
	@Override
	public Integer insertChannelManager(ChannelManager channelManager) {
		return channelManagerDao.insertSelective(channelManager);
	}

	@Override
	public List<JSONObject> getChannelManagerList() {
		List<JSONObject> result = channelManagerDao.getChannelManagerList();
		Map<String, Object> channelManagerMap = new HashMap<String, Object>();
		if(CollectionUtils.isNotEmpty(result)) {
			for (JSONObject jsonObject : result) {
				channelManagerMap.put(jsonObject.getString("userId"), jsonObject.getString("userName"));
			}
			for (JSONObject jsonObject : result) {
				if(jsonObject.getString("userId").equals(jsonObject.getString("groupChannelManagerId"))) {
					jsonObject.put("identity ", ConstantUtil.IS_LEAD);
				}
				jsonObject.put("groupLeadName", channelManagerMap.get(jsonObject.getString("groupChannelManagerId") == null ? "" : channelManagerMap.get(jsonObject.getString("groupChannelManagerId"))));
				jsonObject.put("departmentType", ConstantUtil.DEPART_MENT_TYPE_CHANNEL);
				jsonObject.put("departmentName", ConstantUtil.DEPART_MENT_NAME_MAP.get(ConstantUtil.DEPART_MENT_TYPE_CHANNEL.toString()));
			}
		}
		return result;
	}

	@Override
	public int updateChannelManager(JSONObject reqData) {
		ChannelManager channelManager = channelManagerDao.selectByPrimaryKey(reqData.getString("channelManagerId"));
		if(null == channelManager) {
			return -1;
		}
		channelManager.setChannelManagerGroupId(reqData.getString("channelManagerGroupId"));
		channelManager.setChannelManagerName(reqData.getString("channelManagerName"));
		channelManager.setOpenId(reqData.getString("openId"));
		channelManager.setRoleIds(reqData.getString("roleIds"));
		channelManager.setTelephone(reqData.getString("telePhone"));
		channelManager.setIntendedNumber(reqData.getInteger("intendedNumber"));
		return channelManagerDao.updateByPrimaryKeySelective(channelManager);
	}

}
