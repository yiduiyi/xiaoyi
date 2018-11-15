package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IVideoCourseService {
	 //获取双师课程列表
    public List<JSONObject> getDaulLessonList(JSONObject reqData);
    //添加双师课程
    public int insertDaulLesson(JSONObject reqData);
    //修改双师课程
    public int updateDaulLesson(JSONObject reqData);
    
    //授权第三方双师课程权限
    public int setDaulPrivilege(JSONObject reqData);
}
