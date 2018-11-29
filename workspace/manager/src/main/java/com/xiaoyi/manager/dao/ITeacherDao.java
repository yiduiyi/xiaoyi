package com.xiaoyi.manager.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Teacher;

public interface ITeacherDao {
    int deleteByPrimaryKey(String teacherid);

    int insert(Teacher record);

    int insertSelective(Teacher record);

    Teacher selectByPrimaryKey(String teacherid);
    Teacher selectByTelNum(String telNumber);

    int updateByPrimaryKeySelective(Teacher record);

    int updateByPrimaryKey(Teacher record);

	List<JSONObject> getTeacherOrderNum();
}