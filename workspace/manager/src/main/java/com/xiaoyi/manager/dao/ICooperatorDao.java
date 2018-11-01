package com.xiaoyi.manager.dao;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Cooperator;

public interface ICooperatorDao {
    int deleteByPrimaryKey(String cooperatorId);

    int insert(Cooperator record);

    int insertSelective(Cooperator record);

    Cooperator selectByPrimaryKey(String cooperatorId);

    int updateByPrimaryKeySelective(Cooperator record);

    int updateByPrimaryKey(Cooperator record);

	List<JSONObject> getCooperatorList(Map<String, Object> map);
}