package com.xiaoyi.wechat.utils;

import java.io.File;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

/** 
* @author  Administrator
* @version 创建时间：2017年7月3日 下午8:33:48 
* 微信设置
*/
public class WeiXinConfig {

	public static String APPID = "wxd9579db73c42cf91";//服务号的应用号
	public static String mchId = "1493091612";//商户号
	public static String tradeType = "JSAPI";
	public static String signType = "MD5";//签名加密方式
	public static String KEY = "LiuGuo888Dai66limingY756a8nhuida";//API密钥 ed88788d15aa1982954d605f7569fe0f  N4ufMPFoicK1ewPFZbdQjGNNtFUr6SERjUMjKdU67rh
	public static String SECRET = "2e50c7d680e6fc3efe5fc0cdf81568fd"; //AppSecret 确定正确
	
	public static String LESSON_CONFIRM_MSG_TEMPLETE_ID="j6cTEcD95kdxWhpA5Do1evgyk7gA23zTiG58GQABLCc";
	public static String LEFFON_CONFIRM_REDIRECT_URL="http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do";
	public static final String REDIRECT_HEAD_URL="http://test.yduiy.com.cn/xiaoyi";
	
	
	//月初老师课时提现提醒通知
	public static String LESSON_CONFIRM_MSG_TEMPLETE_ID2="pI6-2--I0NO5neAgyTyZwBvMgjuTlwa0mkUecM1xKQc";
	public static String LEFFON_CONFIRM_REDIRECT_URL2="http%3A%2F%2Ftest.yduiy.com.cn%2Fxiaoyi%2Finterface%2FauthWithUrl.do";
	
	public static String BIND_TEACHER_MSG_TEMPLETE_ID="";
	
	//讲师平台微信公众号参数配置
	public static String APPID2="wxdd97f462c846471b";
	public static String SECRET_KEY2="a22efaaa6dfb5498baa32ffa06ac510a";
	//证书url
	public static final String CA_LICENSE = "F:" + File.separator + "xiaoyi"
		+ File.separator + "cert" + File.separator + "apiclient_cert.p12";
	
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
	 
	 
	 public static String createSign(String characterEncoding,SortedMap<String, String> parameters) {
		 
		   StringBuffer sb = new StringBuffer();
		   Set es = parameters.entrySet();
		   Iterator it = es.iterator();
		   while (it.hasNext()) {
			   Map.Entry entry = (Map.Entry) it.next();
			   String k = (String) entry.getKey();
			   Object v = entry.getValue();
			   if (null != v && !"".equals(v) ) {
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
		
	
}
