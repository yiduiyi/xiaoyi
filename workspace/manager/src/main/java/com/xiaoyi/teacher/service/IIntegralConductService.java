package com.xiaoyi.teacher.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface IIntegralConductService {
	//根据类型查询积分项
	public List<JSONObject> getIntegralConduct(String integralConductType);

}
