package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

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
	
	/**
	 * 编辑老师
	 * @param params
	 * @return
	 */
	int updateTeachingTeacher(JSONObject params);
	//查询教师简历
	public JSONObject getTeacherIntroduce(JSONObject reqData);
	//查询教师违约记录
	public List<JSONObject> getTeacherTreaty(JSONObject reqData);
	//添加教师违约记录
	public int insertTeacherTreaty(JSONObject reqData);
	//查询积分项
	public List<JSONObject> getIntegralConduct(JSONObject reqData);
}
