package com.xiaoyi.teacher.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaoyi.teacher.dao.ITeacherResumeDao;
import com.xiaoyi.teacher.domain.TeacherResume;
import com.xiaoyi.teacher.service.ITeacherResumeService;
@Service("teacherResumeService")
public class TeacherResumeServiceImpl implements ITeacherResumeService {
	@Resource
	private ITeacherResumeDao teacherResumeDao;
	@Override
	public int insert(TeacherResume teacherResume) {
		return teacherResumeDao.insert(teacherResume);
	}
	@Override
	public TeacherResume getTeacherResume(String teacherResumeId) {
		return teacherResumeDao.selectByPrimaryKey(teacherResumeId);
	}

}
