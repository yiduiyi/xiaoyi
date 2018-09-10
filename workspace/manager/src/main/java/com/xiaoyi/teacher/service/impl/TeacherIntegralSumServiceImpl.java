package com.xiaoyi.teacher.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.dao.ITeacherIntegralSumDao;
import com.xiaoyi.teacher.service.ITeacherIntegralSumService;
@Service("teacherIntegralSumService")
public class TeacherIntegralSumServiceImpl implements ITeacherIntegralSumService {
	@Resource
	private ITeacherIntegralSumDao teacherIntegralSumDao;
	@Override
	public List<JSONObject> getTeacherIntegralSumList() {
		return teacherIntegralSumDao.getTeacherIntegralSumList();
	}

}
