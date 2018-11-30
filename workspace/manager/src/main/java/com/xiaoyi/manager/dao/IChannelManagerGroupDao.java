package com.xiaoyi.manager.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.ChannelManagerGroup;

public interface IChannelManagerGroupDao {
    int deleteByPrimaryKey(String channelManagerGroupId);

    int insert(ChannelManagerGroup record);

    int insertSelective(ChannelManagerGroup record);

    ChannelManagerGroup selectByPrimaryKey(String channelManagerGroupId);

    int updateByPrimaryKeySelective(ChannelManagerGroup record);

    int updateByPrimaryKey(ChannelManagerGroup record);
    
	List<JSONObject> getChannelManagerGroupList(Map<String,Object> map);

	List<JSONObject> getAllChannelManagerGroupList();

	ChannelManagerGroup getChannelManagerGroupByGroupChannelManagerId(@Param("groupChannelManagerId")String groupChannelManagerId);
}