package com.xiaoyi.manager.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Auditions;

public interface IAuditionsDao {
    int deleteByPrimaryKey(String auditionId);

    int insert(Auditions record);

    int insertSelective(Auditions record);

    Auditions selectByPrimaryKey(String auditionId);

    int updateByPrimaryKeySelective(Auditions record);

    int updateByPrimaryKey(Auditions record);

	List<JSONObject> getAuditionList(JSONObject reqData);
}