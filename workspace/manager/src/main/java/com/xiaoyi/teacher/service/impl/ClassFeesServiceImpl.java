package com.xiaoyi.teacher.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.TeachingLevel;
import com.xiaoyi.teacher.dao.IClassFeesDao;
import com.xiaoyi.teacher.service.IClassFeesService;
@Service("classFeesService")
public class ClassFeesServiceImpl implements IClassFeesService {
	@Resource
	private IClassFeesDao classFeesDao;
	@Override
	public List<JSONObject> getClassFeesList(String gradeId) {
		List<JSONObject> data = classFeesDao.getClassFeesList(gradeId);
		if(CollectionUtils.isNotEmpty(data)) {
			for (JSONObject jsonObject : data) {
				//TODO 待修改
				Integer gradeIds = jsonObject.getIntValue("gradeId");
				if (null != gradeIds) {
					for (Grade grade : Grade.values()) {
						if (grade.getValue() == gradeIds) {
							jsonObject.put("gradeName", grade.getFullGradeName());
							break;
						}
					}
				}
				Integer teachingLevels = jsonObject.getIntValue("teachingLevel");
				if(null != teachingLevels) {
					for(TeachingLevel teachingLevel : TeachingLevel.values()) {
						if(teachingLevel.getValue() == teachingLevels) {
							jsonObject.put("teachingLevel", teachingLevel.toString());
							break;
						}
					}
				}
			}
		}
		return data;
	}

}
