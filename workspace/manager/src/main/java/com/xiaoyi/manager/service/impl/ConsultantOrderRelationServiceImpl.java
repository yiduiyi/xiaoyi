package com.xiaoyi.manager.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.dao.IConsultantGroupDao;
import com.xiaoyi.manager.dao.IConsultantOrderRelationDao;
import com.xiaoyi.manager.domain.ConsultantOrderRelation;
import com.xiaoyi.manager.domain.ConsultantOrderRelationKey;
import com.xiaoyi.manager.service.IConsultantOrderRelationService;
@Service("consultantOrderRelationService")
public class ConsultantOrderRelationServiceImpl implements IConsultantOrderRelationService {
	@Resource
	private IConsultantOrderRelationDao consultantOrderRelationDao;
	@Resource
	private IConsultantGroupDao consultantGroupDao;
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
	@Override
	public List<JSONObject> getConsultantOrderRankingList(String consultantGroupId, Date startTime, Date endTime) {
		 List<JSONObject> result = new ArrayList<JSONObject>();
		 List<JSONObject> consultantGroup = consultantGroupDao.getAllConsultantGroupList();
		 List<String> consultantIdList = new ArrayList<String>();
		 Map<String, Object> consultantNameMap = new HashMap<String,Object>();
			if (CollectionUtils.isNotEmpty(consultantGroup)) {
				if (null != consultantGroupId) {
					for (JSONObject jsonObject : consultantGroup) {
						if (consultantGroupId.equals(jsonObject.getString("consultantGroupId"))) {
							consultantIdList.add(jsonObject.getString("consultantId"));
						}
						consultantNameMap.put(jsonObject.getString("consultantId") , jsonObject.getString("consultantName"));
					}
				}
			}
		List<JSONObject> consultantOrderRankingList = consultantOrderRelationDao.getConsultantOrderRankingList(startTime,endTime);
		if(CollectionUtils.isNotEmpty(consultantOrderRankingList)) {
			for (JSONObject jsonObject : consultantOrderRankingList) {
				if(consultantIdList.contains(jsonObject.getString("consultantId"))) {
					jsonObject.put("consultantName", consultantNameMap.get(jsonObject.getString("consultantId")) == null ? "" : consultantNameMap.get(jsonObject.getString("consultantId")));
					result.add(jsonObject);
				}
			}
		}
		//按照orderNum最大排序
		Collections.sort(result, new Comparator<JSONObject>() {

			@Override
			public int compare(JSONObject o1, JSONObject o2) {
				if(null!=o1 && null!=o2 
						&& o1.getString("orderNum")!=null
						&& o2.getString("orderNum")!=null){
					
					return o2.getString("orderNum").compareTo(o1.getString("orderNum"));
				}
				return 0;
			}
		});
		return result;
	}

}
