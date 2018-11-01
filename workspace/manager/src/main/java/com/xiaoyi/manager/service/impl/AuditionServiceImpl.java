package com.xiaoyi.manager.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.common.utils.ConstantUtil.Course;
import com.xiaoyi.common.utils.ConstantUtil.Grade;
import com.xiaoyi.common.utils.DateUtils;
import com.xiaoyi.manager.dao.IAuditionsDao;
import com.xiaoyi.manager.domain.Auditions;
import com.xiaoyi.manager.domain.ParentStuRelation;
import com.xiaoyi.manager.service.IAuditionService;
import com.xiaoyi.manager.service.ICommonService;
import com.xiaoyi.manager.service.IConsultantGroupService;
import com.xiaoyi.wechat.utils.UUIDUtil;
@Service("auditionService")
public class AuditionServiceImpl implements IAuditionService {
	@Resource
	private IConsultantGroupService consultantGroupService;
	@Resource
	private IAuditionsDao auditionsDao;
	@Resource
	private ICommonService commonService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
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
			if(reqData.getInteger("queryType").equals(1)) {
				Map<String, Object> consultantGroupMap = new HashMap<String, Object>();
				Map<String, Object> consultantMap = new HashMap<String, Object>();
				List<JSONObject> consultantGroupList = consultantGroupService.getAllConsultantGroupList();
				if(CollectionUtils.isNotEmpty(consultantGroupList)) {
					for (JSONObject jsonObject : consultantGroupList) {
						if(jsonObject.getString("groupConsultantId").equals(jsonObject.getString("consultantId"))) {
							consultantGroupMap.put(jsonObject.getString("consultantGroupId"), jsonObject.getString("consultantName"));
						}
						consultantMap.put(jsonObject.getString("consultantId"), jsonObject.getString("consultantGroupId"));
					}
				}
				Iterator<JSONObject> iterator = result.iterator();
				while (iterator.hasNext()) {
					JSONObject jsonObject = iterator.next();
					if(null != jsonObject.getString("consultantGroupId")) {
						jsonObject.put("consultantGroupName", consultantGroupMap.get(jsonObject.getString("consultantGroupId")) == null ? "" : consultantGroupMap.get(jsonObject.getString("consultantGroupId")));
					}
					if(null != jsonObject.getString("consultantId")) {
						jsonObject.put("consultantName", consultantMap.get(jsonObject.getString("consultantId")) == null ? "" : consultantMap.get(jsonObject.getString("consultantId")));
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
		if(reqData.getShort("status").equals((short)-1)) {
			auditions.setStatus(ConstantUtil.AUDITION_STATUS_NOT_SINGLE);
		}else if(reqData.getShort("status").equals((short)1)) {
			auditions.setStatus(ConstantUtil.AUDITION_STATUS_IS_SINGLE);
		}
		auditions.setUpdateTime(new Date());
		return auditionsDao.updateByPrimaryKeySelective(auditions);
	}
	@Override
	public int setAuditionConsultant(JSONObject reqData) {
		Auditions auditions = auditionsDao.selectByPrimaryKey(reqData.getString("auditionId"));
		if(null != auditions) {
			return -1;
		}
		auditions = new Auditions();
		auditions.setAuditionId(reqData.getString("auditionId"));
		auditions.setConsultantGroupId(reqData.getString("consultantGroupId"));
		auditions.setConsultantId(reqData.getString("consultantId"));
		auditions.setUpdateTime(new Date());
		return auditionsDao.updateByPrimaryKeySelective(auditions);
	}
	@Override
	public List<JSONObject> getAuditionConsultantGroupNum(JSONObject reqData) {
		return auditionsDao.getAuditionConsultantGroupNum();
	}
	@Override
	public int insertAudition(JSONObject reqData) {
		//查询/生成家长ID、学生Id
		String parentId = null;
		String studentId = null;			
		JSONObject schedule = new JSONObject();
		schedule.put("studentName", reqData.getString("studentName"));
		schedule.put("telNum", reqData.getString("telePhone"));
		schedule.put("parentName", reqData.getString("parentName"));
		//新增/获取家长-学生关系信息
		try {
			JSONObject relations = commonService.addOrGetPSR(schedule);
			if(null==relations){
				return -1;
			}
			ParentStuRelation relation = (ParentStuRelation) relations.get("relation");
			studentId = relation.getMemberid();
			parentId = relation.getParentid();
		} catch (Exception e) {
			logger.error("添加/获取家长-学生关系失败！");
			throw e;
		}
		Auditions auditions = new Auditions();
		auditions.setAuditionId(UUIDUtil.getUUIDPrimary());
		auditions.setStudentId(studentId);
		auditions.setParentId(parentId);
		auditions.setGradeId(reqData.getShort("gradeId"));
		auditions.setSubjectId(reqData.getShort("subjectId"));
		auditions.setComeFrom(reqData.getShort("comeFrom"));
		auditions.setCooperatorId(reqData.getString("cooperatorId"));
		auditions.setStatus(ConstantUtil.AUDITION_STATUS_NORMAL);
		auditions.setNotes(reqData.getString("notes"));
		auditions.setCreateTime(new Date());
		auditions.setUpdateTime(new Date());
		return auditionsDao.insertSelective(auditions);
	}

}
