package com.xiaoyi.teacher.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.common.utils.DateUtils;
import com.xiaoyi.teacher.dao.ITeacherIntegralDao;
import com.xiaoyi.teacher.domain.TeacherIntegralSum;
import com.xiaoyi.teacher.service.ITeacherIntegralService;
import com.xiaoyi.teacher.service.ITeacherIntegralSumService;
@Service("teacherIntegralService")
public class TeacherIntegralServiceImpl implements ITeacherIntegralService {
	@Resource
	private ITeacherIntegralDao teacherIntegralDao;
	@Resource
	private ITeacherIntegralSumService teacherIntegralSumService;
	@Override
	public List<JSONObject> getTeacherTreaty(String teacherId) {
		List<JSONObject> data = teacherIntegralDao.getTeacherTreaty(teacherId);
		if(CollectionUtils.isNotEmpty(data)) {
			for (JSONObject jsonObject : data) {
				jsonObject.put("treatyTime", DateUtils.toMMDDString(jsonObject.getDate("createTime")));
			}
		}
		return data;
	}
	@Override
	public int insertTeacherTreaty(JSONObject reqData) {
		
		return 0;
	}

}
