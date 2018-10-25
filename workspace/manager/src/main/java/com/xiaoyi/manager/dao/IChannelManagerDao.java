package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.ChannelManager;

public interface IChannelManagerDao {
    int deleteByPrimaryKey(String channelManagerId);

    int insert(ChannelManager record);

    int insertSelective(ChannelManager record);

    ChannelManager selectByPrimaryKey(String channelManagerId);

    int updateByPrimaryKeySelective(ChannelManager record);

    int updateByPrimaryKey(ChannelManager record);
}