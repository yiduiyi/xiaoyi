package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.AuditionsChannelManagerRelation;
import com.xiaoyi.manager.domain.AuditionsChannelManagerRelationKey;

public interface IAuditionsChannelManagerRelationDao {
    int deleteByPrimaryKey(AuditionsChannelManagerRelationKey key);

    int insert(AuditionsChannelManagerRelation record);

    int insertSelective(AuditionsChannelManagerRelation record);

    AuditionsChannelManagerRelation selectByPrimaryKey(AuditionsChannelManagerRelationKey key);

    int updateByPrimaryKeySelective(AuditionsChannelManagerRelation record);

    int updateByPrimaryKey(AuditionsChannelManagerRelation record);
}