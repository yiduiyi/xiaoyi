package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.ConsultantOrderRelation;
import com.xiaoyi.manager.domain.ConsultantOrderRelationKey;

public interface IConsultantOrderRelationDao {
    int deleteByPrimaryKey(ConsultantOrderRelationKey key);

    int insert(ConsultantOrderRelation record);

    int insertSelective(ConsultantOrderRelation record);

    ConsultantOrderRelation selectByPrimaryKey(ConsultantOrderRelationKey key);

    int updateByPrimaryKeySelective(ConsultantOrderRelation record);

    int updateByPrimaryKey(ConsultantOrderRelation record);
}