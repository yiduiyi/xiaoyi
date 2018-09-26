package com.xiaoyi.teacher.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.ClassFees;

public interface IClassFeesService {
	//根据年级主键查询课时费信息
	public List<JSONObject> getClassFeesList(String gradeId);
	//根据属性字段查询教师课时费
	public ClassFees getClassFeesByParam(JSONObject jsonObject);

}
