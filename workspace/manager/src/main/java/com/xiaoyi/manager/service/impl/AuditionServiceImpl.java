package com.xiaoyi.manager.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.DateUtils;
import com.xiaoyi.manager.dao.IAuditionsDao;
import com.xiaoyi.manager.domain.Auditions;
import com.xiaoyi.manager.service.IAuditionService;
@Service("auditionService")
public class AuditionServiceImpl implements IAuditionService {
	@Resource
	private IAuditionsDao auditionsDao;
	@Override
	public List<JSONObject> getAuditionList(JSONObject reqData) {
		List<JSONObject> result  = null;
		try {
			result = auditionsDao.getAuditionList(reqData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(CollectionUtils.isNotEmpty(result)) {
			for (JSONObject jsonObject : result) {
				jsonObject.put("createTime", DateUtils.toYYYYPointMMPointDDString(jsonObject.getDate("createTime")));
				Integer gradeId = jsonObject.getInteger("gradeId");
				if(null != gradeId) {
					for (Grade grade : Grade.values()) {
						if(gradeId == grade.getValue()) {
							jsonObject.put("gradeName", grade.getFullGradeName());
						}
					}
				}
				Integer subjectId = jsonObject.getInteger("subjectid");
				if(null != subjectId) {
					for (Course course : Course.values()) {
						if(subjectId == course.getValue()) {
							jsonObject.put("courseName", course.toString());
						}
					}
				}
			}
		}
		return result;
	}
	@Override
	public int setAuditionStatus(JSONObject reqData) {
		Auditions auditions = auditionsDao.selectByPrimaryKey(reqData.getString("auditionId"));
		if(null != auditions) {
			return -1;
		}
		auditions = new Auditions();
		auditions.setAuditionId(reqData.getString("auditionId"));
		auditions.setStatus(reqData.getShort("status"));
		auditions.setUpdateTime(new Date());
		return auditionsDao.updateByPrimaryKeySelective(auditions);
	}

}
