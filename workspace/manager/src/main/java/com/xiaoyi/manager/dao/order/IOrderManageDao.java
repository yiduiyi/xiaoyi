package com.xiaoyi.manager.dao.order;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;

public interface IOrderManageDao {
	//查找任教老师
    List<JSONObject> selectTeachersByConditions(Map<String,Object> params);
    
    List<JSONObject> selectCoursesByGradeId(String gradeId);
    
    //根据教学任务查找老师
    List<JSONObject> selectTeachersByTeachingIds(List<String> teachingIds);
}