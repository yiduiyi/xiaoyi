package com.xiaoyi.custom.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.custom.domain.DaulVideoOrder;

public interface IDaulVideoOrderDao{
    int deleteByPrimaryKey(String daulOrderId);

    int insert(DaulVideoOrder record);

    int insertSelective(DaulVideoOrder record);

    int insertDaulOrderList(List<DaulVideoOrder> recordList);
    
    DaulVideoOrder selectByPrimaryKey(String daulOrderId);

    List<DaulVideoOrder> selectByParams(JSONObject params);
    
    int updateByPrimaryKeySelective(DaulVideoOrder record);

    int updateByPrimaryKey(DaulVideoOrder record);
    
    //获取名师回放视频列表
    List<JSONObject> selectAvailableVideoCourses(JSONObject params);
}