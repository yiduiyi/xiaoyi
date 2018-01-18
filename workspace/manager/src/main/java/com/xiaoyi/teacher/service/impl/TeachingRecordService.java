package com.xiaoyi.teacher.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;
import com.xiaoyi.teacher.dao.ITeachingRecordDao;
import com.xiaoyi.teacher.service.ITeachingRecordService;

@Service("recordService")
public class TeachingRecordService implements ITeachingRecordService {

	@Resource
	ITeachingRecordDao teachingRecordDao;
	
	@Override
	public List<JSONObject> getRecordList(JSONObject params) throws Exception {
		try {
			return teachingRecordDao.selectRecordsByTid(params.getString("teacherId"));
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}		
	}

}
