package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.School;

public interface ISchoolDao {
    int deleteByPrimaryKey(String schoolid);

    int insert(School record);

    int insertSelective(School record);

    School selectByPrimaryKey(String schoolid);

    int updateByPrimaryKeySelective(School record);

    int updateByPrimaryKey(School record);
}