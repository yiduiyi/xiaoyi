package com.xiaoyi.teacher.service.impl;

import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.utils.constant.ResponseConstants.RtConstants;
import com.xiaoyi.teacher.dao.ITeachingRecordDao;
import com.xiaoyi.teacher.domain.TeachingRecord;
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
	
	@Transactional
	@Override
	public int insertTeachingRecords(JSONObject params) {
		try {
			String orderId  = params.getString("orderId");
			String teacherId = params.getString("teacherId");
			String teachingId = params.getString("teachingId");
			
			List<TeachingRecord> teachingRecords = new ArrayList<TeachingRecord>();
			JSONArray teachingDetails = params.getJSONArray("teachingDetails");
			
			//增加老师带课记录
			if(!CollectionUtils.isEmpty(teachingDetails)){
				for(Object obj : teachingDetails){
					JSONObject teachingDetail = (JSONObject)obj;
					TeachingRecord record = new TeachingRecord();
					record.setOrderid(orderId);
					record.setRecordid(UUID.randomUUID().toString());
					record.setTeacherid(teacherId);
					record.setTeachingid(teachingId);
					record.setStarttime(teachingDetail.getString("startTime"));
					record.setEndtime(teachingDetail.getString("endTime"));
					record.setTeachingdate(teachingDetail.getDate("teachingDate"));
					record.setTeachingnum(teachingDetail.getShort("checkNum"));
					
					teachingRecords.add(record);
				}
				try {
					teachingRecordDao.insertTeachingRecords(teachingRecords);				
				} catch (Exception e) {
					throw e;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return 0;
	}

}
