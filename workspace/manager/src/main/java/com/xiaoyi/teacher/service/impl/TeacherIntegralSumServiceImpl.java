package com.xiaoyi.teacher.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.dao.ITeacherIntegralSumDao;
import com.xiaoyi.teacher.domain.TeacherIntegralSum;
import com.xiaoyi.teacher.service.ITeacherIntegralSumService;
import com.xiaoyi.teacher.vo.UpdateTeacherIntegralSumVo;
@Service("teacherIntegralSumService")
public class TeacherIntegralSumServiceImpl implements ITeacherIntegralSumService {
	@Resource
	private ITeacherIntegralSumDao teacherIntegralSumDao;
	@Override
	public List<JSONObject> getTeacherIntegralSumList() {
		return teacherIntegralSumDao.getTeacherIntegralSumList();
	}
	@Override
	public TeacherIntegralSum getTeacherIntegralSum(String teacherId) {
		return teacherIntegralSumDao.selectByPrimaryKey(teacherId);
	}
	@Override
	public int updateTeacherIntegralSum(UpdateTeacherIntegralSumVo updateTeacherIntegralSumVo) {
		return teacherIntegralSumDao.updateTeacherIntegralSum(updateTeacherIntegralSumVo);
	}
	@Override
	public int insert(TeacherIntegralSum newTeacherIntegralSum) {
		return teacherIntegralSumDao.insert(newTeacherIntegralSum);
	}

}
