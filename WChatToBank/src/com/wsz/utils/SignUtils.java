package com.wsz.utils;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;

import com.wsz.config.WChatInfo;


/**
 * 签名工具类
 * @author 王士忠
 * @date 2017年11月27日
 * */
public class SignUtils {

	/**
	 * @param characterEncoding 编码格式 utf-8
	 * */
	public static String creatSign(String characterEncoding,
			SortedMap<Object, Object> parameters) {
		StringBuffer sb = new StringBuffer();
		Set es = parameters.entrySet();
		Iterator it = es.iterator();
		while(it.hasNext()) {
			Map.Entry entry = (Map.Entry)it.next();
			String k = (String)entry.getKey();
			Object v = entry.getValue();
			if(null != v && !"".equals(v) 
					&& !"sign".equals(k) && !"key".equals(k)) {
				sb.append(k + "=" + v + "&");
			}
		}
		sb.append("key=" + WChatInfo.KEY);
		String sign = MD5Utils.MD5Encode(sb.toString(), characterEncoding).toUpperCase();
		System.out.println(sign);
		return sign;
	}
}
