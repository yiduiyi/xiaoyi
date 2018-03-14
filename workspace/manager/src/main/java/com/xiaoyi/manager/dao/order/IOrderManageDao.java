package com.xiaoyi.manager.dao.order;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Orders;

public interface IOrderManageDao {
	//查找订单列表
	List<JSONObject> selectOrderList(Map<String,Object> params);
	
	//查询是否买书
	List<Orders> selectIfHasBookByParams(Map<String,Object> params);
	
	//查找任教老师
    List<JSONObject> selectTeachersByConditions(Map<String,Object> params);
    
    //查找年级下的科目列表
    List<JSONObject> selectCoursesByGradeId(String gradeId);
    
    //根据教学任务查找老师
    List<JSONObject> selectTeachersByTeachingIds(List<String> teachingIds);
    
    List<JSONObject> selectMTeachingsByParams(Map<String,Object> params);
    
    //查询管理员手动充值、结算订单
    List<Orders> selectMOrdersByParams(Map<String,Object> params);
}