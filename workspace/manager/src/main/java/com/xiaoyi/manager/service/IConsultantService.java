package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Consultant;

public interface IConsultantService {
	//新增课程顾问
	public Integer insertConsultant(Consultant consultant);
	//获取课程顾问列表
	public List<JSONObject> getConsultantList();


}
