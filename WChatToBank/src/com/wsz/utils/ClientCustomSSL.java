package com.wsz.utils;
import java.io.File; 
import java.io.FileInputStream; 
import java.security.KeyStore; 

import javax.net.ssl.SSLContext; 

import org.apache.http.HttpEntity; 
import org.apache.http.client.methods.CloseableHttpResponse; 
import org.apache.http.client.methods.HttpPost; 
import org.apache.http.conn.ssl.SSLConnectionSocketFactory; 
import org.apache.http.conn.ssl.SSLContexts; 
import org.apache.http.entity.StringEntity; 
import org.apache.http.impl.client.CloseableHttpClient; 
import org.apache.http.impl.client.HttpClients; 
import org.apache.http.util.EntityUtils; 

import com.wsz.config.WChatInfo;



/** 
* This example demonstrates how to create secure connections with a custom SSL 
* context. 
*/ 
public class ClientCustomSSL { 

@SuppressWarnings("deprecation")
public static String doRefund(String url,String data) throws Exception { 
		/** 
		* 注意PKCS12证书 是从微信商户平台-》账户设置-》 API安全 中下载的 
		*/ 
		
		KeyStore keyStore = KeyStore.getInstance("PKCS12"); 
		FileInputStream instream = new FileInputStream(new File(WChatInfo.CA_LICENSE));//P12文件目录 
		try { 
		/** 
		* 此处要改 
		* */ 
		keyStore.load(instream, WChatInfo.MCH_ID.toCharArray());//这里写密码..默认是你的MCHID 
		} finally { 
			instream.close(); 
		} 
		
		// Trust own CA and all self-signed certs 
		/** 
		* 此处要改 
		* */ 
		SSLContext sslcontext = SSLContexts.custom() 
		.loadKeyMaterial(keyStore, WChatInfo.MCH_ID.toCharArray())//这里也是写密码的 
		.build(); 
		// Allow TLSv1 protocol only 
		SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory( 
		sslcontext, 
		new String[] { "TLSv1" }, 
		null, 
		SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER); 
		CloseableHttpClient httpclient = HttpClients.custom() 
		.setSSLSocketFactory(sslsf) 
		.build(); 
		try { 
		HttpPost httpost = new HttpPost(url); // 设置响应头信息 
		httpost.addHeader("Connection", "keep-alive"); 
		httpost.addHeader("Accept", "*/*"); 
		httpost.addHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8"); 
		httpost.addHeader("Host", "api.mch.weixin.qq.com"); 
		httpost.addHeader("X-Requested-With", "XMLHttpRequest"); 
		httpost.addHeader("Cache-Control", "max-age=0"); 
		httpost.addHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0) "); 
		httpost.setEntity(new StringEntity(data, "UTF-8")); 
		CloseableHttpResponse response = httpclient.execute(httpost); 
		try { 
		HttpEntity entity = response.getEntity(); 
		
		String jsonStr = EntityUtils.toString(response.getEntity(), "UTF-8"); 
		EntityUtils.consume(entity); 
		return jsonStr; 
		} finally { 
		response.close(); 
		} 
		} finally { 
		httpclient.close(); 
		} 
	} 


} 