package com.xiaoyi.teacher.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.dao.IIntegralConductDao;
import com.xiaoyi.teacher.service.IIntegralConductService;
@Service("integralConductService")
public class IntegralConductServiceImpl implements IIntegralConductService {
	@Resource
	private IIntegralConductDao integralConductDao;
	@Override
	public List<JSONObject> getIntegralConduct(String integralConductType) {
		
		return integralConductDao.getIntegralConduct(integralConductType);
	}

}
