package com.xiaoyi.common.service;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;


public interface ICommonDataService {
	 List<JSONObject> getCoursePrices(Map<String,Object> params);
}
