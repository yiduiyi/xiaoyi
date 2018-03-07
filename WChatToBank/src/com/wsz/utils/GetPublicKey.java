package com.wsz.utils;

import java.util.SortedMap;
import java.util.TreeMap;

import com.wsz.config.WChatInfo;

/**
 * 获取微信企业付款到银行卡的第一步 获取商户号的公钥
 * 
 * @author 王士忠
 * @date 2017年11月27日
 * */
public class GetPublicKey {
	public String getPublicKey() throws Exception {
		SortedMap<Object, Object> parameters = new TreeMap<Object, Object>();
		String nonce_str = StringUtils.getStrRandom(28);
		parameters.put("mch_id", WChatInfo.MCH_ID);
		parameters.put("nonce_str", nonce_str);
		parameters.put("sign_type", "MD5");
		// 签名
		String sign = SignUtils.creatSign(WChatInfo.CHARSET, parameters);
		System.out.println(sign);

		TreeMap<String, String> tmap = new TreeMap<String, String>();
		tmap.put("mch_id", WChatInfo.MCH_ID);
		tmap.put("nonce_str", nonce_str);
		tmap.put("sign_type", "MD5");
		tmap.put("sign", sign);
		String xml = XMLUtils.getRequestXml(tmap);
		//带证书请求
		String xml1 = HttpClientCustomSSL.httpClientResultGetPublicKey(xml);
		String publicKey = XMLUtils.Progress_resultParseXml(xml1);
		return publicKey;

	}
}