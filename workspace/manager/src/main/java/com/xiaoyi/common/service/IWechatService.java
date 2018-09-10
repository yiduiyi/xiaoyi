package com.xiaoyi.common.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;

public interface IWechatService {
	String processRequest(HttpServletRequest request);

	String sendTempletMsg(String templetId, String redirect_url, String openId, JSONObject params);


	/**
	 * 参数化模板消息接口
	 * @param templeteId
	 * @param redirect_url
	 * @param openId
	 * @param values	第一个为 first, 中间为keywords, 最后一个为remark
	 * @param colors
	 * @param extraParams	该参数需与前端对接
	 * @return
	 */
	String sendTempletMsg2(String templeteId, String redirect_url, String openId, List<String>values,List<String>colors, JSONObject extraParams);
	/**
	 * 老师提现
	 * @return{返回结果}
	 */
	JSONObject payToTeacher(JSONObject params);
	
	/**
	 * 
	 * @param openId 用户微信openID
	 * @param amount 支付数额（已元为单位）
	 * @return
	 */
	Map<String,String> unifiedPay(String openId, float amount);
	
	/**
	 * 发送定时任务（更新老师提现日期间隔,重传失败消息提醒）
	 */
	int sendQuarzMsg();
}
