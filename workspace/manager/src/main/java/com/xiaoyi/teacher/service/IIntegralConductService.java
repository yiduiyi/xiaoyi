package com.xiaoyi.teacher.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.IntegralConduct;

public interface IIntegralConductService {
	//根据类型查询积分项
	public List<JSONObject> getIntegralConduct(String integralConductType);
	//根据积分行为主键查询积分信息
	public IntegralConduct getIntegralConductByIntegralConductId(String integralConductId);

}
