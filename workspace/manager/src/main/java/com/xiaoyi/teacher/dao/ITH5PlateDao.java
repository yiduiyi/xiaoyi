package com.xiaoyi.teacher.dao;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Teacher;

public interface ITH5PlateDao {

	//openId - 唯一性约束
	Teacher selectTeacherByOpenId(String openId);
	
	//telnumber - 唯一性约束(其它约束：老师姓名)
	Teacher selectTeacherByParams(Map<String,Object> params);

	//telnumber - 唯一性约束
	int updateTeacherByOpenId(Teacher teacher);
	
	int updateByPrimaryKeySelective(Teacher record);
	
	//获取老师关联的任教关系
	List<JSONObject> selectTeachingRelationships(String teacherId);
	
	//查询历史课时提交记录
	List<JSONObject> selectHistoryTeachingRecords(JSONObject params);
}
