package com.xiaoyi.teacher.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.dao.ITeacherResumeRelationDao;
import com.xiaoyi.teacher.domain.TeacherResumeRelation;
import com.xiaoyi.teacher.service.ITeacherResumeRelationService;

@Service("teacherResumeRelationService")
public class TeacherResumeRelationServiceImpl implements ITeacherResumeRelationService {
	@Resource
	private ITeacherResumeRelationDao teacherResumeRelationDao;
	
	@Override
	public List<JSONObject> getTeacherResumeList() {
		List<JSONObject> teacherResumeList = teacherResumeRelationDao.getTeacherResumeList();
		return teacherResumeList;
	}

	@Override
	public int insert(TeacherResumeRelation teacherResumeRelation) {
		return teacherResumeRelationDao.insert(teacherResumeRelation);
	}

	@Override
	public TeacherResumeRelation getDefaultResumeByTeacherId(String teacherid) {
		return teacherResumeRelationDao.getDefaultResumeByTeacherId(teacherid);
	}

	@Override
	public int updeteTeacherResumeRelation(TeacherResumeRelation oldTeacherResumeRelation) {
		// TODO Auto-generated method stub
		return teacherResumeRelationDao.updateByPrimaryKey(oldTeacherResumeRelation);
	}

}
