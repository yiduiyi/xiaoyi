package com.xiaoyi.manager.dao;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Schedule;

public interface IScheduleDao {
    int deleteByPrimaryKey(String scheduleid);

    int insert(Schedule record);

    int insertSelective(Schedule record);

    Schedule selectByPrimaryKey(String scheduleid);
    List<JSONObject> selectListByConditions(Map<String,Object> params);
    
    int updateByPrimaryKeySelective(Schedule record);

    int updateByPrimaryKey(Schedule record);
}