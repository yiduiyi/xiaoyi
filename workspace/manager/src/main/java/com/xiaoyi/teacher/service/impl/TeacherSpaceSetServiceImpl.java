package com.xiaoyi.teacher.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaoyi.teacher.dao.ITeacherSpaceSetDao;
import com.xiaoyi.teacher.domain.TeacherSpaceSet;
import com.xiaoyi.teacher.service.ITeacherSpaceSetService;
@Service("teacherSpaceSetService")
public class TeacherSpaceSetServiceImpl implements ITeacherSpaceSetService {
	@Resource
	private ITeacherSpaceSetDao teacherSpaceSetDao;
	@Override
	public int insert(TeacherSpaceSet teacherSpaceSet) {
		return teacherSpaceSetDao.insert(teacherSpaceSet);
	}
	@Override
	public TeacherSpaceSet selectTeacherSpaceSetByTeacherId(String teacherid) {
		return teacherSpaceSetDao.selectTeacherSpaceSetByTeacherId(teacherid);
	}
	@Override
	public int update(TeacherSpaceSet teacherSpaceSet) {
		return teacherSpaceSetDao.updateByPrimaryKeySelective(teacherSpaceSet);
	}

}
