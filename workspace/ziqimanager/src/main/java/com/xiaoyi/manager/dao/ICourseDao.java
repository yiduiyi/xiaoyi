package com.xiaoyi.manager.dao;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Course;

public interface ICourseDao {
    int deleteByPrimaryKey(String courseId);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(String courseId);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
    
    List<JSONObject> getCourseList(Map<String, Object> map);
}