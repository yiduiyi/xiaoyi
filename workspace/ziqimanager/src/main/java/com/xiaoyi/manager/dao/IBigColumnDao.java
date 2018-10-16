package com.xiaoyi.manager.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.BigColumn;

public interface IBigColumnDao {
    int deleteByPrimaryKey(String bigColumnId);

    int insert(BigColumn record);

    int insertSelective(BigColumn record);

    BigColumn selectByPrimaryKey(String bigColumnId);

    int updateByPrimaryKeySelective(BigColumn record);

    int updateByPrimaryKey(BigColumn record);
    //查询所有正常的大专栏列表
	public List<JSONObject> getBigColumnList();
}