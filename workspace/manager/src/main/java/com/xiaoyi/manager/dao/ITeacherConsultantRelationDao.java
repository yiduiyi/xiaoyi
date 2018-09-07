package com.xiaoyi.manager.dao;

import com.xiaoyi.manager.domain.TeacherConsultantRelation;

public interface ITeacherConsultantRelationDao {
    int deleteByPrimaryKey(String teacherConsultantId);

    int insert(TeacherConsultantRelation record);

    int insertSelective(TeacherConsultantRelation record);

    TeacherConsultantRelation selectByPrimaryKey(String teacherConsultantId);

    int updateByPrimaryKeySelective(TeacherConsultantRelation record);

    int updateByPrimaryKey(TeacherConsultantRelation record);

	TeacherConsultantRelation selectTeacherConsultantRelationByTeacherId(String teacherid);
}