package com.xiaoyi.teacher.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

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
	//获取超过两个月没有提现的任教关系
	List<String> getUselessTeachings(JSONObject params);
	
	//查询历史课时提交记录
	List<JSONObject> selectHistoryTeachingRecords(JSONObject params);
	//查询所有接收生源提醒的教师openId
	public List<JSONObject> getAllRemindTeacherList();
	//查询上月教师课时费排行榜
	public List<JSONObject> getMonthTeacherClassFeeRank(@Param("date")Date date);
	//根据教师主键查询教师信息
	public Teacher selectTeacherByTeacherId(@Param("teacherId")String teacherId);
	//获取所有签约的教师列表
	public List<JSONObject> getAllTeacherList();
}
