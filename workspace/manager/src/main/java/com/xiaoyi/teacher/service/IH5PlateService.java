package com.xiaoyi.teacher.service;

import java.util.Map;

public interface IH5PlateService {
	
	int queryBindStatus(String openId) throws Exception;
	
	//需先校验绑定账号
	int bindWechat(Map<String,Object> params) throws Exception;
}
