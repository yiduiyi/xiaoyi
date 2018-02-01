package com.xiaoyi.teacher.dao;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;

public interface IPrivateDomainDao {
	JSONObject selectDomainByTeacherId(Map<String,Object> params);
	
	List<Map<String,Object>> selectSchoolDetailById(Map<String,Object> params);

}