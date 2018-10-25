package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.ChannelManagerGroup;

public interface IChannelManagerGroupDao {
    int deleteByPrimaryKey(String channelManagerGroupId);

    int insert(ChannelManagerGroup record);

    int insertSelective(ChannelManagerGroup record);

    ChannelManagerGroup selectByPrimaryKey(String channelManagerGroupId);

    int updateByPrimaryKeySelective(ChannelManagerGroup record);

    int updateByPrimaryKey(ChannelManagerGroup record);
}