package com.xiaoyi.wechat.utils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.SortedMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.xiaoyi.common.utils.HttpClient;

/**
 * @author Administrator
 * @version 创建时间：2017年7月3日 下午8:33:48 微信设置
 */
public class WeiXinConfig {

	public static String COMPANY;
	public static String APPID ;//= "wxd9579db73c42cf91";//服务号的应用号
	public static String mchId ;//= "1493091612";// 商户号
	public static String tradeType;// = "JSAPI";
	public static String signType ;//= "MD5";// 签名加密方式
	public static String KEY ;//= "LiuGuo888Dai66limingY756a8nhuida";// API密钥
																	// ed88788d15aa1982954d605f7569fe0f
																	// N4ufMPFoicK1ewPFZbdQjGNNtFUr6SERjUMjKdU67rh
	public static String SECRET ;//= "2e50c7d680e6fc3efe5fc0cdf81568fd"; // AppSecret
	public static String NOTIFY_URL;																	// 确定正确

	// public static String
	// LESSON_CONFIRM_MSG_TEMPLETE_ID="kXQ9h6ptFCKM6cmrizyIZXrJtU3uKPs0dbl_bQH_QaM";
	public static String LEFFON_CONFIRM_REDIRECT_URL ;//= "http%3A%2F%2Ftest.yduiy.com.cn%2Finterface%2FauthWithUrl.do";
	public static String REDIRECT_HEAD_URL ;//= "http://test.yduiy.com.cn/";

	// 月初老师课时提现提醒通知
	public static String LESSON_CONFIRM_MSG_TEMPLETE_ID2 ;//= "pI6-2--I0NO5neAgyTyZwBvMgjuTlwa0mkUecM1xKQc";
	public static String LEFFON_CONFIRM_REDIRECT_URL2 ;//= "http%3A%2F%2Ftest.yduiy.com.cn%2Finterface%2FauthWithUrl.do";

	// 家长课时确认提醒
	public static String CUSTOM_LESSON_CONFIRM_MSG_TEMPLETE_ID ;//= "j6cTEcD95kdxWhpA5Do1evgyk7gA23zTiG58GQABLCc";

	// 家长课时不足提醒
	public static String CUSTOM_LESSON_SHORTAGE_REMAINDER_TEMPLETE_ID ;//= "N6tayHg61jtqaB49apOzXi8DWaU5jPmb0uTs6OEnsWM";

	// 家长欠费提醒
	public static String CUSTOM_ARREARAGE_REMAINDER_TEMPLETE_ID ;//= "neucPdllvXDtnD0bRkkZgllrFJkq1l7Pp60Uf609zGg";

	// 授权并跳转到 redirect url
	public static String AUTH_WITH_REDIRECT_URL ;//= "http%3A%2F%2Ftest.yduiy.com.cn%2Finterface%2FauthWithRedirectUrl.do";
	public static String AUTH_AND_PAY_URL ;//= "http%3A%2F%2Ftest.yduiy.com.cn%2Finterface%2FauthAndPay.do";

	public static String PURCHASE_LINK ;//= "/wechat/index.html#/buyClass";

	// 老师绑定模板ID
	public static String BIND_TEACHER_MSG_TEMPLETE_ID ;//= "";

	// 讲师平台微信公众号参数配置
	public static String TEACHER_PLATE_APPID ;//= "wxdd97f462c846471b";
	public static String TEACHER_PLATE_SECRET_KEY ;//= "a22efaaa6dfb5498baa32ffa06ac510a";
	
	//订单推送模板ID
	public static String TEACHER_TAKE_BILL_TEMPLETE_ID;
	public static String BILL_LIST_REDIRECT_URL;
	
	public static String XIAO_E_TONG_APPID;
	public static String XIAO_E_TONG_APPSECRET;
	
	public static String TEACHER_DISTRIBUTE_TASK_TEMPLETE_ID;
	
	// 证书url
	public static final String CA_LICENSE = "F:" + File.separator + "xiaoyi" + File.separator + "cert" + File.separator
			+ "apiclient_cert.p12";
	
	static {
		Properties properties = new Properties();
		// 使用ClassLoader加载properties配置文件生成对应的输入流
		InputStream in = WeiXinConfig.class.getClassLoader().getResourceAsStream("config/wechat.properties");
		// 使用properties对象加载输入流
		try {
			properties.load(in);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 获取key对应的value值
		COMPANY = properties.getProperty("company");
		APPID = properties.getProperty("APPID");
		mchId = properties.getProperty("mchId");
		tradeType = properties.getProperty("tradeType");
		signType = properties.getProperty("signType");
		KEY = properties.getProperty("KEY");
		SECRET = properties.getProperty("SECRET");
		LEFFON_CONFIRM_REDIRECT_URL = properties.getProperty("LEFFON_CONFIRM_REDIRECT_URL");
		LEFFON_CONFIRM_REDIRECT_URL2 = properties.getProperty("LEFFON_CONFIRM_REDIRECT_URL2");
		REDIRECT_HEAD_URL = properties.getProperty("REDIRECT_HEAD_URL");
		LESSON_CONFIRM_MSG_TEMPLETE_ID2 = properties.getProperty("LESSON_CONFIRM_MSG_TEMPLETE_ID2");
		CUSTOM_LESSON_CONFIRM_MSG_TEMPLETE_ID = properties.getProperty("CUSTOM_LESSON_CONFIRM_MSG_TEMPLETE_ID");
		CUSTOM_LESSON_SHORTAGE_REMAINDER_TEMPLETE_ID = properties.getProperty("CUSTOM_LESSON_SHORTAGE_REMAINDER_TEMPLETE_ID");
		CUSTOM_ARREARAGE_REMAINDER_TEMPLETE_ID = properties.getProperty("CUSTOM_ARREARAGE_REMAINDER_TEMPLETE_ID");
		AUTH_WITH_REDIRECT_URL = properties.getProperty("AUTH_WITH_REDIRECT_URL");
		AUTH_AND_PAY_URL = properties.getProperty("AUTH_AND_PAY_URL");
		PURCHASE_LINK = properties.getProperty("PURCHASE_LINK");
		BIND_TEACHER_MSG_TEMPLETE_ID = properties.getProperty("BIND_TEACHER_MSG_TEMPLETE_ID");
		TEACHER_PLATE_APPID = properties.getProperty("TEACHER_PLATE_APPID");
		TEACHER_PLATE_SECRET_KEY = properties.getProperty("TEACHER_PLATE_SECRET_KEY");
		NOTIFY_URL = properties.getProperty("NOTIFY_URL"); 
		TEACHER_TAKE_BILL_TEMPLETE_ID = properties.getProperty("TEACHER_TAKE_BILL_TEMPLETE_ID"); 
		BILL_LIST_REDIRECT_URL = properties.getProperty("BILL_LIST_REDIRECT_URL");
	
		XIAO_E_TONG_APPID=properties.getProperty("xiaoe.appId");
		XIAO_E_TONG_APPSECRET=properties.getProperty("xiaoe.appSecret");
		
		//作业通知模板
		TEACHER_DISTRIBUTE_TASK_TEMPLETE_ID = properties.getProperty("TEACHER_DISTRIBUTE_TASK_TEMPLETE_ID");
	}

	public static String getRequestXml(SortedMap<String, String> parameters) {
		StringBuffer sb = new StringBuffer();
		sb.append("<xml>");
		Set es = parameters.entrySet();
		Iterator it = es.iterator();
		while (it.hasNext()) {
			Map.Entry entry = (Map.Entry) it.next();
			String k = (String) entry.getKey();
			String v = (String) entry.getValue();
			sb.append("<" + k + ">" + v + "</" + k + ">");
		}
		sb.append("</xml>");
		return sb.toString();
	}

	public static String createSign(String characterEncoding, SortedMap<String, String> parameters) {

		StringBuffer sb = new StringBuffer();
		Set es = parameters.entrySet();
		Iterator it = es.iterator();
		while (it.hasNext()) {
			Map.Entry entry = (Map.Entry) it.next();
			String k = (String) entry.getKey();
			Object v = entry.getValue();
			if (null != v && !"".equals(v)) {
				sb.append(k + "=" + v + "&");
			}
		}
		sb.append("key=" + WeiXinConfig.KEY);
		String sign = MD5Util.getMD5String(sb.toString()).toUpperCase();

		return sign;
	}


	public static String getIp(HttpServletRequest request) {
		if (request == null)
			return "";
		String ip = request.getHeader("X-Requested-For");
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Forwarded-For");
		}
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (StringUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	/**
	 * 获取微信access_token
	 * @param appId
	 * @param appSecret
	 * @return
	 */
	public static String getWechatAccessToken(String appId, String appSecret){
		//获取access_token
		//logger.info("调用微信接口获取access_token...");
		StringBuffer getTockenBuffer = new StringBuffer();
		getTockenBuffer
			.append("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential")
			.append("&appid=").append(appId)
			.append("&secret=").append(appSecret);
		String getTockenUrl = getTockenBuffer.toString();
		String tokenResult = HttpClient.httpGetRequest(getTockenUrl);
		//logger.info("获取access_token结果：" + tokenResult);
		
		JSONObject jsonResult = JSONObject.parseObject(tokenResult);
		String token = jsonResult.getString("access_token");
		
		return token;
	}
	
	/**
	 * 获取关注公众号的所有openid
	 * @param appId
	 * @param appSecret
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public List<String> getWechatOpenIds(String appId, String appSecret) throws UnsupportedEncodingException{
		StringBuffer getUnionIdBuffer = new StringBuffer();
		
		String accessToken = getWechatAccessToken(appId, appSecret);
		getUnionIdBuffer.append("https://api.weixin.qq.com/cgi-bin/user/get?access_token=")
			.append(accessToken);
		
		String getUnionIdUrl = getUnionIdBuffer.toString();
		String rs = HttpClient.httpGetRequest(getUnionIdUrl);
		rs = new String(rs.getBytes("ISO-8859-1"),"UTF-8");
		JSONObject unionIdResult = JSONObject.parseObject(rs);
		
		JSONObject data = unionIdResult.getJSONObject("data");
		JSONArray openIds =	data.getJSONArray("openid");
		
		List<String> openIdList = new ArrayList<String>();
		for(Object openId : openIds){
			openIdList.add(String.valueOf(openId));
		}
		
		return openIdList;
	}
}
