package com.xiaoyi.manager.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.VideoCourse;

public interface IVideoCourseDao {
    int deleteByPrimaryKey(String videoCourseId);

    int insert(VideoCourse record);

    int insertSelective(VideoCourse record);

    VideoCourse selectByPrimaryKey(String videoCourseId);

    int updateByPrimaryKeySelective(VideoCourse record);

    int updateByPrimaryKey(VideoCourse record);

    
    List<VideoCourse> selectVideoCourseListByConditions(JSONObject params);

   /* //获取双师课程列表
    public List<JSONObject> getDaulLessonList(Map<String, Object> reqData);
    //根据courseId获取双师课程列表
    public List<JSONObject> getDaulLessonListByCourseId(Byte courseId);*/

}