package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.Schedule;

public interface IScheduleDao {
    int deleteByPrimaryKey(String scheduleid);

    int insert(Schedule record);

    int insertSelective(Schedule record);

    Schedule selectByPrimaryKey(String scheduleid);

    int updateByPrimaryKeySelective(Schedule record);

    int updateByPrimaryKey(Schedule record);
}