package com.xiaoyi.manager.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.ConsultantOrderRelation;
import com.xiaoyi.manager.domain.ConsultantOrderRelationKey;

public interface IConsultantOrderRelationDao {
    int deleteByPrimaryKey(ConsultantOrderRelationKey key);

    int insert(ConsultantOrderRelation record);

    int insertSelective(ConsultantOrderRelation record);

    ConsultantOrderRelation selectByPrimaryKey(ConsultantOrderRelationKey key);

    int updateByPrimaryKeySelective(ConsultantOrderRelation record);

    int updateByPrimaryKey(ConsultantOrderRelation record);

	List<JSONObject> getConsultantOrderList();

	Integer getConsultantQuantityByTime(@Param("startTime")Date startTime, @Param("endTime")Date endTime);

	List<JSONObject> getConsultantOrderRankingList(@Param("startTime")Date startTime, @Param("endTime")Date endTime);
}