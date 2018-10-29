package com.xiaoyi.manager.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.ConstantUtil;
import com.xiaoyi.manager.dao.IConsultantDao;
import com.xiaoyi.manager.domain.Consultant;
import com.xiaoyi.manager.service.IConsultantService;
@Service("consultantService")
public class ConsultantServiceImpl implements IConsultantService {
	@Resource
	private IConsultantDao consultantDao;
	@Override
	public Integer insertConsultant(Consultant consultant) {
		return consultantDao.insertSelective(consultant);
	}
	
	@Override
	public List<JSONObject> getConsultantList() {
		List<JSONObject> result = consultantDao.getConsultantList();
		Map<String, Object> consultantMap = new HashMap<String, Object>();
		if(CollectionUtils.isNotEmpty(result)) {
			for (JSONObject jsonObject : result) {
				consultantMap.put(jsonObject.getString("userId"), jsonObject.getString("userName"));
			}
			for (JSONObject jsonObject : result) {
				if(jsonObject.getString("userId").equals(jsonObject.getString("groupConsultantId"))) {
					jsonObject.put("identity ", ConstantUtil.IS_LEAD);
				}
				jsonObject.put("groupLeadName", consultantMap.get(jsonObject.getString("groupConsultantId") == null ? "" : consultantMap.get(jsonObject.getString("groupConsultantId"))));
				jsonObject.put("departmentType", ConstantUtil.DEPART_MENT_TYPE_CONSULTANT);
				jsonObject.put("departmentName", ConstantUtil.DEPART_MENT_NAME_MAP.get(ConstantUtil.DEPART_MENT_TYPE_CONSULTANT.toString()));
			}
		}
		return result;
	}
}
