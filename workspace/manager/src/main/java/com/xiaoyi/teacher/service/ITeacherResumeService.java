package com.xiaoyi.teacher.service;

import com.xiaoyi.teacher.domain.TeacherResume;

public interface ITeacherResumeService {
	//添加教师简历
	public int insert(TeacherResume teacherResume);
	//查询教师简历
	public TeacherResume getTeacherResume(String teacherResumeId);

}
