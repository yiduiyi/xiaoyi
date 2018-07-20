package com.xiaoyi.teacher.dao;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.TeacherBalance;

public interface ITeacherBalanceDao{
    int deleteByPrimaryKey(String teacherid);

    int insert(TeacherBalance record);

    int insertSelective(TeacherBalance record);

    TeacherBalance selectByPrimaryKey(String teacherid);

    int updateByPrimaryKeySelective(TeacherBalance record);

    int updateByPrimaryKey(TeacherBalance record);
    
    JSONObject selectTeacherBalanceByParams(JSONObject params);
}