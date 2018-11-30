package com.xiaoyi.manager.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IAuditionsDao;
import com.xiaoyi.manager.dao.IConsultantGroupDao;
import com.xiaoyi.manager.domain.ConsultantGroup;
import com.xiaoyi.manager.service.IConsultantGroupService;
import com.xiaoyi.wechat.utils.UUIDUtil;
@Service("consultantGroupService")
public class ConsultantGroupServiceImpl implements IConsultantGroupService {

	@Resource
	private IConsultantGroupDao consultantGroupDao;
	@Resource
	private IAuditionsDao auditionsDao;
	@Override
	public int insertConsultantGroup(JSONObject reqData) {
		ConsultantGroup consultantGroup = new ConsultantGroup();
		consultantGroup.setConsultantGroupId(UUIDUtil.getUUIDPrimary());
		consultantGroup.setConsultantGroupName(reqData.getString("consultantGroupName"));
		consultantGroup.setConsultantId(reqData.getString("consultantId"));
		consultantGroup.setRoleIds(reqData.getString("roleIds"));
		return consultantGroupDao.insertSelective(consultantGroup);
	}
	@Override
	public int deleteConsultantGroup(JSONObject reqData) {
		return consultantGroupDao.deleteByPrimaryKey(reqData.getString("consultantGroupId"));
	}
	@Override
	public List<JSONObject> getConsultantGroupList(JSONObject reqData) {
		return consultantGroupDao.getAllConsultantGroupList();
	}
	@Override
	public Integer addConsultantGroup(ConsultantGroup consultantGroup) {
		return consultantGroupDao.insertSelective(consultantGroup);
	}
	@Override
	public List<JSONObject> getAllConsultantGroupList() {
		return consultantGroupDao.getAllConsultantGroupList();
	}
	@Override
	public List<JSONObject> getConsultantList(JSONObject reqData) {
		List<JSONObject> result = consultantGroupDao.getAllConsultantGroupList();
		Map<String, Object> distributionNumMap = new HashMap<String, Object>();
		Map<String, Object> completeNumMap = new HashMap<String, Object>();
		if(CollectionUtils.isNotEmpty(result)) {
			List<JSONObject> auditionNumData = auditionsDao.getAuditionNumDataList();
			if(CollectionUtils.isNotEmpty(auditionNumData)) {
				for (JSONObject jsonObject : auditionNumData) {
					distributionNumMap.put(jsonObject.getString("consultantId"), jsonObject.getString("distributionNum"));
					completeNumMap.put(jsonObject.getString("consultantId"), jsonObject.getString("completeNum"));
				}
			}
			for (JSONObject jsonObject : result) {
				jsonObject.put("distributionNum", distributionNumMap.get(jsonObject.getString("consultantId")));
				jsonObject.put("completeNum", completeNumMap.get(jsonObject.getString("consultantId")));
			}
		}
		return result;
	}

}
