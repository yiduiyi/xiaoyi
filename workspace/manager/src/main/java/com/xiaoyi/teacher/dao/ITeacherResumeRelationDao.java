package com.xiaoyi.teacher.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.TeacherResumeRelation;

public interface ITeacherResumeRelationDao {
    int deleteByPrimaryKey(String teacherResumeRId);

    int insert(TeacherResumeRelation record);

    int insertSelective(TeacherResumeRelation record);

    TeacherResumeRelation selectByPrimaryKey(String teacherResumeRId);

    int updateByPrimaryKeySelective(TeacherResumeRelation record);

    int updateByPrimaryKey(TeacherResumeRelation record);
    //查询教师默认的简历
	public List<JSONObject> getTeacherResumeList();
	//获取默认的教师简历
	public TeacherResumeRelation getDefaultResumeByTeacherId(String teacherid);

	public void updateAllTeacherResumeRelationToNotDefault(String teacherid);
}