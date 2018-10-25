package com.xiaoyi.manager.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.ConstantUtil.Sex;
import com.xiaoyi.common.utils.ConstantUtil.TeachingLevel;
import com.xiaoyi.manager.dao.IBillRecordRelationDao;
import com.xiaoyi.manager.domain.BillRecordRelation;
import com.xiaoyi.manager.service.IBillRecordRelationService;
import com.xiaoyi.teacher.service.ITeacherResumeRelationService;
@Service("billRecordRelationService")
public class BillRecordRelationServiceImpl implements IBillRecordRelationService {
	@Resource
	private IBillRecordRelationDao billRecordRelationDao;
	@Resource
	private ITeacherResumeRelationService teacherResumeRelationDao;
	@Override
	public List<JSONObject> getBillRecordList(JSONObject reqData) {
		String billId = reqData.getString("billId");
		Map<String, Object> teacherResumeMap = new HashMap<String, Object>();
		//根据订单主键查询订单投递列表
		List<JSONObject> list = billRecordRelationDao.getBillRecordList(billId);
		if(CollectionUtils.isNotEmpty(list)) {
			//查询所有的教师简历
			List<JSONObject> teacherResumeList = teacherResumeRelationDao.getTeacherResumeList();
			if(CollectionUtils.isNotEmpty(teacherResumeList)) {
				for (JSONObject jsonObject : teacherResumeList) {
					teacherResumeMap.put(jsonObject.getString("teacherResumeRId"), jsonObject.getString("introduce"));
				}
			}
			for (JSONObject jsonObject : list) {
				//匹配教师简历
				jsonObject.put("introduce", teacherResumeMap.get(jsonObject.getString("teacherResumeRId")));
				//匹配订单年级名称和课程名称
				Integer gradeId = jsonObject.getInteger("gradeId");
				if(null!=gradeId) {
					for(Grade grade : Grade.values()) {
						if(grade.getValue() == gradeId) {
							jsonObject.put("gradeName", grade.getFullGradeName());
							break;
						}
					}
				}
				Integer courseId = jsonObject.getInteger("courseId");
				if(null!=courseId) {
					for(Course course : Course.values()) {
						if(course.getValue() == courseId) {
							jsonObject.put("courseName", course.toString());
							break;
						}
					}
				}
				//转换教师等级
				Integer teachingLevel = jsonObject.getInteger("teachingLevel");
				if(null!=teachingLevel) {
					for(TeachingLevel level : TeachingLevel.values()) {
						if(teachingLevel==level.getValue()) {
							jsonObject.put("teachingLevelName", level.toString());
							break;
						}
					}
				}
				//转换教师性别
				if(null != jsonObject.getBoolean("sex")) {
					Integer teacherSex = jsonObject.getBoolean("sex") ? 0 : 1;
					if(null!=teacherSex) {
						for(Sex sex : Sex.values()) {
							if(teacherSex==sex.getValue()) {
								jsonObject.put("sex", sex.toString());
								break;
							}
						}
					}
				}else {
					jsonObject.put("sex", "未知");
				}
			}
		}
		
		return list;
	}
	@Override
	public int updateBillRecord(BillRecordRelation record) {
		return billRecordRelationDao.updateByPrimaryKeySelective(record);
	}
	@Override
	public int insert(BillRecordRelation billRecordRelation) {
		return billRecordRelationDao.insert(billRecordRelation);
	}
	@Override
	public Integer getBillRecordSendNumByBillId(String billId) {
		return billRecordRelationDao.getBillRecordSendNumByBillId(billId);
	}
	@Override
	public void updateOtherBillRecord(String billId, String billRecordId) {
		List<BillRecordRelation> list = billRecordRelationDao.getAllOtherBillRecord(billId,billRecordId);
		if(CollectionUtils.isNotEmpty(list)) {
			for (BillRecordRelation billRecordRelation : list) {
				billRecordRelation.setStatus(ConstantUtil.BILL_RECORD_STATUS_IS_PASS);
			}
			billRecordRelationDao.batchUpdateOtherBillRecord(list);
		}
	}
}
