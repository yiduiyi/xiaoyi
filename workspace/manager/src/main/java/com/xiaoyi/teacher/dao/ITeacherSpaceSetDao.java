package com.xiaoyi.teacher.dao;

import com.xiaoyi.teacher.domain.TeacherSpaceSet;

public interface ITeacherSpaceSetDao {
    int deleteByPrimaryKey(String teacherSpaceSetId);

    int insert(TeacherSpaceSet record);

    int insertSelective(TeacherSpaceSet record);

    TeacherSpaceSet selectByPrimaryKey(String teacherSpaceSetId);

    int updateByPrimaryKeySelective(TeacherSpaceSet record);

    int updateByPrimaryKey(TeacherSpaceSet record);
    //获取教师的空间设置
	public TeacherSpaceSet selectTeacherSpaceSetByTeacherId(String teacherid);
}