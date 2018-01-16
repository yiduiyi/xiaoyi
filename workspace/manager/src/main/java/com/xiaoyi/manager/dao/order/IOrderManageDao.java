package com.xiaoyi.manager.dao.order;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;

public interface IOrderManageDao {
	//查找订单列表
	List<JSONObject> selectOrderList(Map<String,Object> params);
	
	//查找任教老师
    List<JSONObject> selectTeachersByConditions(Map<String,Object> params);
    
    //查找年级下的科目列表
    List<JSONObject> selectCoursesByGradeId(String gradeId);
    
    //根据教学任务查找老师
    List<JSONObject> selectTeachersByTeachingIds(List<String> teachingIds);
}