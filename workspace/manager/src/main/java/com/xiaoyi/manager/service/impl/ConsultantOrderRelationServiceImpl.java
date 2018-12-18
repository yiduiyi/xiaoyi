package com.xiaoyi.manager.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.DateUtils;
import com.xiaoyi.manager.dao.IConsultantGroupDao;
import com.xiaoyi.manager.dao.IConsultantOrderRelationDao;
import com.xiaoyi.manager.domain.ConsultantOrderRelation;
import com.xiaoyi.manager.domain.ConsultantOrderRelationKey;
import com.xiaoyi.manager.service.IConsultantOrderRelationService;
import com.xiaoyi.manager.service.IOrderService;
@Service("consultantOrderRelationService")
public class ConsultantOrderRelationServiceImpl implements IConsultantOrderRelationService {
	@Resource
	private IConsultantOrderRelationDao consultantOrderRelationDao;
	@Resource
	private IConsultantGroupDao consultantGroupDao;
	@Resource
	private IOrderService orderService;
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
		 List<JSONObject> consultantGroup = consultantGroupDao.getAllConsultantGroupList();
		 List<String> consultantIdList = new ArrayList<String>();
		 Map<String, Object> consultantNameMap = new HashMap<String,Object>();
			if (CollectionUtils.isNotEmpty(consultantGroup)) {
				if (null != consultantGroupId) {
					for (JSONObject jsonObject : consultantGroup) {
						if(null != consultantGroupId) {
							if (consultantGroupId.equals(jsonObject.getString("consultantGroupId"))) {
								consultantIdList.add(jsonObject.getString("consultantId"));
							}
						}else {
							consultantIdList.add(jsonObject.getString("consultantId"));
						}
						consultantNameMap.put(jsonObject.getString("consultantId") , jsonObject.getString("consultantName"));
					}
				}
			}
		List<JSONObject> consultantOrderRankingList = consultantOrderRelationDao.getConsultantOrderRankingList(startTime,endTime);
		if(CollectionUtils.isNotEmpty(consultantOrderRankingList)) {
			Iterator<JSONObject> iterator = consultantOrderRankingList.iterator();
			while (iterator.hasNext()) {
				JSONObject jsonObject = (JSONObject) iterator.next();
				if(consultantIdList.contains(jsonObject.getString("consultantId"))) {
					jsonObject.put("consultantName", consultantNameMap.get(jsonObject.getString("consultantId")) == null ? "" : consultantNameMap.get(jsonObject.getString("consultantId")));
				}else {
					iterator.remove();
				}
			}
		}
		//按照orderNum最大排序
		Collections.sort(consultantOrderRankingList, new Comparator<JSONObject>() {

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
		return consultantOrderRankingList;
	}
	@Override
	public List<JSONObject> getConsultantRenewalOrderRankingList(String consultantGroupId, Date startTime,
			Date endTime) {
		 List<JSONObject> consultantGroup = consultantGroupDao.getAllConsultantGroupList();
		 List<String> consultantIdList = new ArrayList<String>();
		 Map<String, Object> consultantNameMap = new HashMap<String,Object>();
			if (CollectionUtils.isNotEmpty(consultantGroup)) {
				if (null != consultantGroupId) {
					for (JSONObject jsonObject : consultantGroup) {
						if(null != consultantGroupId) {
							if (consultantGroupId.equals(jsonObject.getString("consultantGroupId"))) {
								consultantIdList.add(jsonObject.getString("consultantId"));
							}
						}else {
							consultantIdList.add(jsonObject.getString("consultantId"));
						}
						consultantNameMap.put(jsonObject.getString("consultantId") , jsonObject.getString("consultantName"));
					}
				}
			}
		List<JSONObject> renewalOrderData = orderService.getRenewalOrderData(startTime,endTime);
		if(CollectionUtils.isNotEmpty(renewalOrderData)) {
			Iterator<JSONObject> iterator = renewalOrderData.iterator();
			while (iterator.hasNext()) {
				JSONObject jsonObject = (JSONObject) iterator.next();
				if(consultantIdList.contains(jsonObject.getString("consultantId"))) {
					jsonObject.put("consultantName", consultantNameMap.get(jsonObject.getString("consultantId")) == null ? "" : consultantNameMap.get(jsonObject.getString("consultantId")));
				}else {
					iterator.remove();
				}
			}
		}
		// 按照orderNum最大排序
		Collections.sort(renewalOrderData, new Comparator<JSONObject>() {

			@Override
			public int compare(JSONObject o1, JSONObject o2) {
				if (null != o1 && null != o2 && o1.getString("renewalNum") != null && o2.getString("renewalNum") != null) {

					return o2.getString("renewalNum").compareTo(o1.getString("renewalNum"));
				}
				return 0;
			}
		});
		return renewalOrderData;
	}

}
