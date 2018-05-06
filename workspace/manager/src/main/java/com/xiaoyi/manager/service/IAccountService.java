package com.xiaoyi.manager.service;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.manager.domain.Account;

public interface IAccountService {
	Account getAccountById(String accountId);
	
	public int insertAccount(Account account);
	
	List<JSONObject> getComplainList(JSONObject params);
	
	/**
	 * 发送欠费补缴链接
	 * @param params
	 * @return 0: 发送成功, -2: 参数错误！
	 * {{first.DATA}}
		学员姓名：{{keyword1.DATA}}
		欠费金额：{{keyword2.DATA}}
		{{remark.DATA}}
	 */
	int sendPurchaseLink(JSONObject params);
	
	/**
	 * 发送课时不足提醒消息(每月15号自动触发)
	 * @return
	 */
	int sendNotEnoughLessonQuarzMsgToCustom();
	//int sendNotEnoughLessonQuarzMsgToCustom(Map<String,Object> params);
	/**
	 * {{first.DATA}}
		学生姓名：{{keyword1.DATA}}
		上课时间：{{keyword2.DATA}}
		消耗课时：{{keyword3.DATA}}
		剩余课时：{{keyword4.DATA}}
		{{remark.DATA}}
	 */
	//int sendMultiNotEnoughLessonMsg(List<JSONObject> datas);
	
	int sendMsgsToSelectedCustom(Map<String,Object> params);
}
