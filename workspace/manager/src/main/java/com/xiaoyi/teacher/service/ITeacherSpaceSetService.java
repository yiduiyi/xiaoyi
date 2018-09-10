package com.xiaoyi.teacher.service;

import com.xiaoyi.teacher.domain.TeacherSpaceSet;

public interface ITeacherSpaceSetService {
	//添加教师个人空间设置
	public int insert(TeacherSpaceSet teacherSpaceSet);
	//根据教师主键获取教师空间设置
	public TeacherSpaceSet selectTeacherSpaceSetByTeacherId(String teacherid);
	//更新教师空间设置
	public int update(TeacherSpaceSet teacherSpaceSet);

}
