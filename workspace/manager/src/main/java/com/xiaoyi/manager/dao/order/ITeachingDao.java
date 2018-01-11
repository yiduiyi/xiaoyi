package com.xiaoyi.manager.dao.order;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;

public interface ITeachingDao {
	//查找任教老师
    List<JSONObject> selectTeachersByConditions(Map<String,Object> params);
}