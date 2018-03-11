package com.xiaoyi.common.service;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;

public interface IWechatService {
	 String processRequest(HttpServletRequest request);
	 
	 String sendTempletMsg(String templetId,String redirect_url,String openId,JSONObject params);
}
