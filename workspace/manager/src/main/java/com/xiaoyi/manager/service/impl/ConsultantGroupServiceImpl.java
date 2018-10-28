package com.xiaoyi.manager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IConsultantGroupDao;
import com.xiaoyi.manager.domain.ConsultantGroup;
import com.xiaoyi.manager.service.IConsultantGroupService;
import com.xiaoyi.wechat.utils.UUIDUtil;
@Service("consultantGroupService")
public class ConsultantGroupServiceImpl implements IConsultantGroupService {

	@Resource
	private IConsultantGroupDao consultantGroupDao;
	@Override
	public int insertConsultantGroup(JSONObject reqData) {
		ConsultantGroup consultantGroup = new ConsultantGroup();
		consultantGroup.setConsultantGroupId(UUIDUtil.getUUIDPrimary());
		consultantGroup.setConsultantGroupName(reqData.getString("consultantGroupName"));
		consultantGroup.setConsultantId(reqData.getString("consultantId"));
		consultantGroup.setRoleId(reqData.getString("roleId"));
		return consultantGroupDao.insertSelective(consultantGroup);
	}
	@Override
	public int deleteConsultantGroup(JSONObject reqData) {
		return consultantGroupDao.deleteByPrimaryKey(reqData.getString("consultantGroupId"));
	}
	@Override
	public List<JSONObject> getConsultantGroupList(JSONObject reqData) {
		return consultantGroupDao.getConsultantGroupList(reqData);
	}

}
