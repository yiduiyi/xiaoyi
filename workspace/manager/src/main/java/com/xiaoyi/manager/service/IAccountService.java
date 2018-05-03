package com.xiaoyi.manager.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Account;

public interface IAccountService {
	Account getAccountById(String accountId);
	
	public int insertAccount(Account account);
	
	List<JSONObject> getComplainList(JSONObject params);
	
	int sendPurchaseLink(JSONObject params);
	
	/**
	 * 发送课时不足提醒消息
	 * @return
	 */
	int sendNotEnoughLessonMsgToCustom();
	int sendSingleNotEnoughLessonMsg(String openId,JSONObject data);
}
