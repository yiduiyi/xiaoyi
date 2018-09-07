package com.xiaoyi.manager.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaoyi.manager.dao.ITeacherConsultantRelationDao;
import com.xiaoyi.manager.domain.TeacherConsultantRelation;
import com.xiaoyi.manager.service.ITeacherConsultantRelationService;
@Service("teacherConsultantRelationService")
public class TeacherConsultantRelationServiceImpl implements ITeacherConsultantRelationService {
	@Resource
	private ITeacherConsultantRelationDao teacherConsultantRelationDao;
	@Override
	public TeacherConsultantRelation selectTeacherConsultantRelationByTeacherId(String teacherid) {
		return teacherConsultantRelationDao.selectTeacherConsultantRelationByTeacherId(teacherid);
	}

}
