package com.xiaoyi.teacher.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.IntegralConduct;

public interface IIntegralConductDao {
    int deleteByPrimaryKey(String integralConductId);

    int insert(IntegralConduct record);

    int insertSelective(IntegralConduct record);

    IntegralConduct selectByPrimaryKey(String integralConductId);

    int updateByPrimaryKeySelective(IntegralConduct record);

    int updateByPrimaryKeyWithBLOBs(IntegralConduct record);

    int updateByPrimaryKey(IntegralConduct record);

	List<JSONObject> getIntegralConduct(String integralConductType);
}