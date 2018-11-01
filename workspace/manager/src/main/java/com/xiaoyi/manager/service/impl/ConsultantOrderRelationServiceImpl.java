package com.xiaoyi.manager.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IConsultantOrderRelationDao;
import com.xiaoyi.manager.domain.ConsultantOrderRelation;
import com.xiaoyi.manager.domain.ConsultantOrderRelationKey;
import com.xiaoyi.manager.service.IConsultantOrderRelationService;
@Service("consultantOrderRelationService")
public class ConsultantOrderRelationServiceImpl implements IConsultantOrderRelationService {
	@Resource
	private IConsultantOrderRelationDao consultantOrderRelationDao;
	@Override
	public List<JSONObject> getConsultantOrderList() {
		return consultantOrderRelationDao.getConsultantOrderList();
	}
	@Override
	public int setClaimOrder(JSONObject reqData) {
		ConsultantOrderRelationKey consultantOrderRelationKey = new ConsultantOrderRelationKey();
		consultantOrderRelationKey.setOrderId(reqData.getString("orderId"));
		consultantOrderRelationKey.setConsultantId(reqData.getString("consultantId"));
		ConsultantOrderRelation consultantOrderRelation = consultantOrderRelationDao.selectByPrimaryKey(consultantOrderRelationKey);
		if(consultantOrderRelation == null) {
			consultantOrderRelation = new ConsultantOrderRelation();
			consultantOrderRelation.setOrderId(reqData.getString("orderId"));
			consultantOrderRelation.setConsultantId(reqData.getString("consultantId"));
			consultantOrderRelation.setCreateTime(new Date());
			return consultantOrderRelationDao.insertSelective(consultantOrderRelation);
		}
		return 0;
	}
	@Override
	public Integer getConsultantQuantityByTime(Date startTime, Date endTime) {
		return consultantOrderRelationDao.getConsultantQuantityByTime(startTime,endTime);
	}

}
