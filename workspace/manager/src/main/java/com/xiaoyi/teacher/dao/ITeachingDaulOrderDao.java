package com.xiaoyi.teacher.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.TeachingDaulOrder;
import com.xiaoyi.teacher.domain.TeachingDaulOrderKey;

public interface ITeachingDaulOrderDao {
    int deleteByPrimaryKey(TeachingDaulOrderKey key);

    int insert(TeachingDaulOrder record);

    int insertSelective(TeachingDaulOrder record);

    TeachingDaulOrder selectByPrimaryKey(TeachingDaulOrderKey key);

    List<TeachingDaulOrder> selectByParams(JSONObject params);
    //
    int updateByPrimaryKeySelective(TeachingDaulOrder record);

    int updateByPrimaryKey(TeachingDaulOrder record);
}