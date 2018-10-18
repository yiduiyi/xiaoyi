package com.xiaoyi.teacher.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.ClassFees;

public interface IDaulTaskService {
	//查询老师绑定的任教关系
	public List<JSONObject> getPSTRelations(String openId);

}
