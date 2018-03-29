package com.xiaoyi.common.service;

import javax.servlet.http.HttpServletRequest;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.teacher.domain.LessonTrade;

public interface IWechatService {
	String processRequest(HttpServletRequest request);

	String sendTempletMsg(String templetId, String redirect_url, String openId, JSONObject params);

	/**
	 * 老师提现
	 * @return{返回结果}
	 */
	JSONObject payToTeacher(JSONObject params);
	
	/**
	 * 发送定时任务（老师提现提醒）
	 */
	int sendQuarzMsg();
}
