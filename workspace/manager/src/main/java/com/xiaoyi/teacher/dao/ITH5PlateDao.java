package com.xiaoyi.teacher.dao;

import java.util.Map;

import com.xiaoyi.manager.domain.Teacher;

public interface ITH5PlateDao {

	//openId - 唯一性约束
	Teacher selectTeacherByOpenId(String openId);
	
	//telnumber - 唯一性约束(其它约束：老师姓名)
	Teacher selectTeacherByParams(Map<String,Object> params);

	//telnumber - 唯一性约束
	int updateTeacherByOpenId(Teacher teacher);
}
