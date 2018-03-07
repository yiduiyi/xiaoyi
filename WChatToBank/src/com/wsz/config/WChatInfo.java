package com.wsz.config;

import java.io.File;

/**
 * 微信企业付款到银行卡的基础信息
 * */
public class WChatInfo {
	
	/*public static String APPID = "wxd9579db73c42cf91";//服务号的应用号
	public static String mchId = "1493091612";//商户号
	public static String tradeType = "JSAPI";
	public static String signType = "MD5";//签名加密方式
	public static String KEY = "LiuGuo888Dai66limingY756a8nhuida";//API密钥 ed88788d15aa1982954d605f7569fe0f  N4ufMPFoicK1ewPFZbdQjGNNtFUr6SERjUMjKdU67rh
	public static String SECRET = "2e50c7d680e6fc3efe5fc0cdf81568fd"; //AppSecret 确定正确
*/	
	//微信商户的id  需要填写自己的
	public static final String MCH_ID = "1493091612";
	//微信商户的key  签名使用
	public static final String KEY="LiuGuo888Dai66limingY756a8nhuida";
	public static final String  CHARSET = "UTF-8";//编码格式
	//证书url
	public static final String CA_LICENSE = "F:" + File.separator + "xiaoyi"
	+ File.separator + "cert" + File.separator + "apiclient_cert.p12";

}
