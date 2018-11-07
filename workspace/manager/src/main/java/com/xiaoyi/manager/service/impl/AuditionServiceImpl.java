package com.xiaoyi.manager.service.impl;

import java.util.ArrayList;
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
import com.xiaoyi.common.utils.ConstantUtil.LessonType;
import com.xiaoyi.common.utils.DateUtils;
import com.xiaoyi.common.utils.MathUtils;
import com.xiaoyi.manager.dao.IAuditionsChannelManagerRelationDao;
import com.xiaoyi.manager.dao.IAuditionsDao;
import com.xiaoyi.manager.dao.IChannelManagerGroupDao;
import com.xiaoyi.manager.dao.ICooperatorDao;
import com.xiaoyi.manager.dao.IOrderSumDao;
import com.xiaoyi.manager.domain.Auditions;
import com.xiaoyi.manager.domain.AuditionsChannelManagerRelation;
import com.xiaoyi.manager.domain.OrderSum;
import com.xiaoyi.manager.domain.OrderSumKey;
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
	private IOrderSumDao orderSumDao;
	@Resource
	private ICommonService commonService;
	@Resource
	private IChannelManagerGroupDao channelManagerGroupDao;
	@Resource
	private ICooperatorDao cooperatorDao;
	@Resource
	private IAuditionsChannelManagerRelationDao auditionsChannelManagerRelationDao;
	
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
							break;
						}
					}
				}
				Integer subjectId = jsonObject.getInteger("subjectid");
				if(null != subjectId) {
					for (Course course : Course.values()) {
						if(subjectId == course.getValue()) {
							jsonObject.put("courseName", course.toString());
							break;
						}
					}
				}
			}
			if(null != reqData.getInteger("queryType")) {
				if(reqData.getInteger("queryType").equals(1)) {
					Map<String, Object> consultantGroupMap = new HashMap<String, Object>();
					Map<String, Object> consultantMap = new HashMap<String, Object>();
					List<JSONObject> consultantGroupList = consultantGroupService.getAllConsultantGroupList();
					if(CollectionUtils.isNotEmpty(consultantGroupList)) {
						for (JSONObject jsonObject : consultantGroupList) {
							if(jsonObject.getString("groupConsultantId").equals(jsonObject.getString("consultantId"))) {
								consultantGroupMap.put(jsonObject.getString("consultantGroupId"), jsonObject.getString("consultantName"));
							}
							consultantMap.put(jsonObject.getString("consultantId"), jsonObject.getString("consultantName"));
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
		}
		return result;
	}
	@Override
	public int setAuditionStatus(JSONObject reqData) {
		Auditions auditions = auditionsDao.selectByPrimaryKey(reqData.getString("auditionId"));
		if(null == auditions) {
			return -1;
		}
		if(reqData.getShort("status").equals((short)-1)) {
			auditions.setStatus(ConstantUtil.AUDITION_STATUS_NOT_SINGLE);
		}else if(reqData.getShort("status").equals((short)1)) {
			auditions.setStatus(ConstantUtil.AUDITION_STATUS_IS_SINGLE);
			//确认成单时，判断是否有该家长的订单记录，有则在试听单中添加订单主键，否则成单失败
			LessonType lessonType = LessonType.convert(Integer.valueOf(auditions.getGradeId()+"1"));
			OrderSumKey key = new OrderSumKey();
			key.setParentid(auditions.getParentId());
			key.setMemberid(auditions.getStudentId());
			key.setLessontype(lessonType.getValue());
			key.setTeachingWay(auditions.getTeachingway());
			OrderSum orderSum= orderSumDao.selectByPrimaryKey(key); 
			if(null == orderSum) {
				return -1;
			}
			auditions.setUpdateTime(new Date());
			auditions.setOrderId(orderSum.getOrderid());
		}
		return auditionsDao.updateByPrimaryKeySelective(auditions);
	}
	@Override
	public int setAuditionConsultant(JSONObject reqData) {
		Auditions auditions = auditionsDao.selectByPrimaryKey(reqData.getString("auditionId"));
		if(null == auditions) {
			return -1;
		}
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
		Integer resultType = 0;
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
		auditions.setTeachingway(reqData.getShort(""));
		auditions.setComeFrom(reqData.getShort("comeFrom"));
		auditions.setCooperatorId(reqData.getString("cooperatorId"));
		auditions.setStatus(ConstantUtil.AUDITION_STATUS_NORMAL);
		auditions.setNotes(reqData.getString("notes"));
		auditions.setCreateTime(new Date());
		auditions.setUpdateTime(new Date());
		resultType =  auditionsDao.insertSelective(auditions);
		//订单新增成功，添加渠道经理发布记录
		if(resultType > 0) {
			AuditionsChannelManagerRelation auditionsChannelManagerRelation = new AuditionsChannelManagerRelation();
			auditionsChannelManagerRelation.setAuditionId(auditions.getAuditionId());
			auditionsChannelManagerRelation.setChannelManagerId(reqData.getString("channelManagerId"));
			auditionsChannelManagerRelation.setCreateTime(new Date());
			resultType = auditionsChannelManagerRelationDao.insertSelective(auditionsChannelManagerRelation);
		}
		return resultType;
	}
	@Override
	public JSONObject getchannelManagerAuditionData(String channelManagerGroupId, Date startTime, Date endTime) {
		List<JSONObject> consultantGroupList =channelManagerGroupDao.getAllChannelManagerGroupList();
		List<String> channelManagerIds = new ArrayList<String>();
		if(CollectionUtils.isNotEmpty(consultantGroupList)) {
			for (JSONObject jsonObject : consultantGroupList) {
				if(null != channelManagerGroupId) {
					if(channelManagerGroupId.equals(jsonObject.getString("consultantGroupId"))) {
						channelManagerIds.add(jsonObject.getString("consultantId"));
					}
				}else {
					channelManagerIds.add(jsonObject.getString("consultantId"));
				}
			}
		}
		List<JSONObject> auditionList = auditionsDao.getAuditionListByTime(startTime,endTime);
		if(CollectionUtils.isNotEmpty(auditionList)) {
			
		}
		return null;
	}
	@Override
	public List<JSONObject> getAuditionNumList(String channelManagerGroupId, Date startTime, Date endTime) {
		Map<String, Object> channelManagerNameMap = new HashMap<String, Object>();
		List<JSONObject> cooperatorList = cooperatorDao.getAllCooperatorList(channelManagerGroupId,null,null);
		List<JSONObject> channelManagerGroupList =channelManagerGroupDao.getAllChannelManagerGroupList();
		List<String> channelManagerIds = new ArrayList<String>();
		if(CollectionUtils.isNotEmpty(channelManagerGroupList)) {
			for (JSONObject jsonObject : channelManagerGroupList) {
				if(null != channelManagerGroupId) {
					if(channelManagerGroupId.equals(jsonObject.getString("consultantGroupId"))) {
						channelManagerIds.add(jsonObject.getString("consultantId"));
					}
				}else {
					channelManagerIds.add(jsonObject.getString("consultantId"));
				}
				channelManagerNameMap.put(jsonObject.getString("channelManagerId"), jsonObject.getString("channelManagerName"));
			}
		}
		List<JSONObject> auditionNum = auditionsDao.getAuditionNumDataByTime(ConstantUtil.AUDITION_NUM_QUERTY_STATUS ,startTime,endTime);
		List<JSONObject> completeNum = auditionsDao.getAuditionNumDataByTime(null ,startTime,endTime);
		//判断该渠道经理组下所有课程顾问的添加试听单记录
		if (CollectionUtils.isNotEmpty(auditionNum)) {
			if (null != channelManagerGroupId) {
				Iterator<JSONObject> auditionNumIterator = auditionNum.iterator();
				while (auditionNumIterator.hasNext()) {
					JSONObject jsonObject = auditionNumIterator.next();
					if (!channelManagerIds.contains(jsonObject.getString("channelManagerId"))) {
						auditionNumIterator.remove();
					}
				}
			}else {
				Iterator<JSONObject> auditionNumIterator = auditionNum.iterator();
				while (auditionNumIterator.hasNext()) {
					JSONObject jsonObject = auditionNumIterator.next();
					if (!channelManagerIds.contains(jsonObject.getString("channelManagerId"))) {
						auditionNumIterator.remove();
					}
				}
			}
		}
		//判断该渠道经理组下所有课程顾问的成单记录
		if (CollectionUtils.isNotEmpty(completeNum)) {
			if (null != channelManagerGroupId) {
				Iterator<JSONObject> completeNumIterator = completeNum.iterator();
				while (completeNumIterator.hasNext()) {
					JSONObject jsonObject = completeNumIterator.next();
					if (!channelManagerIds.contains(jsonObject.getString("channelManagerId"))) {
						completeNumIterator.remove();
					}
				}
			}else {
				Iterator<JSONObject> completeNumIterator = completeNum.iterator();
				while (completeNumIterator.hasNext()) {
					JSONObject jsonObject = completeNumIterator.next();
					if (!channelManagerIds.contains(jsonObject.getString("channelManagerId"))) {
						completeNumIterator.remove();
					}
				}
			}
		}
		//判断每个商家
		if(CollectionUtils.isNotEmpty(cooperatorList)) {
			Iterator<JSONObject> iterator = cooperatorList.iterator();
			while (iterator.hasNext()) {
				JSONObject jsonObject = (JSONObject) iterator.next();
				jsonObject.put("channelManagerName", channelManagerNameMap.get(jsonObject.getString("channelManagerId")) == null ? "" : channelManagerNameMap.get(jsonObject.getString("channelManagerId")));
				for (JSONObject jsonObject1 : auditionNum) {
					if(jsonObject.getString("cooperatorId").equals(jsonObject1.getString("cooperatorId"))) {
						jsonObject.put("auditionNum", jsonObject1.getInteger("auditionNum") == null ? 0 : jsonObject1.getInteger("auditionNum"));
					}
				}
				for (JSONObject jsonObject1 : completeNum) {
					if(jsonObject.getString("cooperatorId").equals(jsonObject1.getString("cooperatorId"))) {
						jsonObject.put("completeNum", jsonObject1.getInteger("auditionNum") == null ? 0 : jsonObject1.getInteger("auditionNum"));
					}
				}
				if(null != jsonObject.getInteger("completeNum") && null != jsonObject.getInteger("auditionNum") && 0 != jsonObject.getInteger("auditionNum")) {
					jsonObject.put("proportion", MathUtils.percentage(jsonObject.getInteger("completeNum"), jsonObject.getInteger("auditionNum")));
				}else {
					jsonObject.put("proportion", "0%");
				}
			}
		}
		return cooperatorList;
	}
	@Override
	public int updateAudition(JSONObject reqData) {
		Auditions auditions = auditionsDao.selectByPrimaryKey(reqData.getString("auditionId"));
		if(null == auditions) {
			return -1;
		}
		auditions.setGradeId(reqData.getShort("gradeId"));
		auditions.setSubjectId(reqData.getShort("subjectId"));
		auditions.setComeFrom(reqData.getShort("comeFrom"));
		auditions.setCooperatorId(reqData.getString("cooperatorId"));
		auditions.setStatus(ConstantUtil.AUDITION_STATUS_NORMAL);
		auditions.setNotes(reqData.getString("notes"));
		auditions.setUpdateTime(new Date());
		return auditionsDao.insertSelective(auditions);
	}
	@Override
	public int deleteAudition(JSONObject reqData) {
		Auditions auditions = auditionsDao.selectByPrimaryKey(reqData.getString("auditionId"));
		if(null == auditions) {
			return -1;
		}
		return auditionsDao.deleteByPrimaryKey(auditions.getAuditionId());
	}

}
