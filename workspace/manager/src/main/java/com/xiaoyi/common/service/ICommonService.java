package com.xiaoyi.common.service;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;


public interface ICommonService {
	 List<JSONObject> processRequest(Map<String,Object> params);
}
