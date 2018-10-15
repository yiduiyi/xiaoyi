package com.xiaoyi.common.service;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;


public interface ICommonDataService {
	 List<JSONObject> getCoursePrices(Map<String,Object> params);
	 
	 /**
	  * 获取双师同步视频课程包（续费）
	  * @param params
	  * @return
	  */
	 List<JSONObject> getDaulCoursePrice(Map<String,Object>params);
}
