package com.xiaoyi.teacher.service;

import com.alibaba.fastjson.JSONObject;

public interface IPrivateDomainService {
	
	Short getSignStatus(JSONObject params) throws Exception;

	int setAgreement(JSONObject params) throws Exception;
	
	JSONObject queryPrivateMsg(JSONObject params) throws Exception;
}
