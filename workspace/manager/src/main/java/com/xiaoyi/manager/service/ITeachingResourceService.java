package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Teacher;

public interface ITeachingResourceService {
	
	/**
	 * iv.	数据导入(包括单条录入)
	 * @return
	 * @throws Exception
	 */
	int addTeachingTeacher(List<JSONObject> teachers) ;
	
	/**
	 * i.	课时列表查询
	 */
	List<JSONObject> queryTeachingList(JSONObject params);
	
	/**
	 * i.	查询教员信息列表 
	 */
	List<JSONObject> queryTeacherList(JSONObject params);
	
	/**
	 * ii.	冻结课时
		iii.	解冻课时
		0:冻结、1：解冻
	 * @param params
	 * @return
	 */
	int operateTeacherLessons(JSONObject params);
	
	int deleteTeachingTeacher(String teacherId);
}
