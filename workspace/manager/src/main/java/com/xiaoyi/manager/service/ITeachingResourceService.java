package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Teacher;

public interface ITeachingResourceService {
	
	/**
	 * iv.	数据导入(包括单条录入)
	 * @return
	 * @throws Exception
	 */
	int addTeachingTeacher(List<JSONObject> teachers) throws Exception;
}
