package com.xiaoyi.common.utils;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.SortedMap;

import com.xiaoyi.wechat.utils.WeiXinConfig;

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
		Set<Entry<Object,Object>> es = parameters.entrySet();
		Iterator<Entry<Object,Object>> it = es.iterator();
		while(it.hasNext()) {
			Map.Entry<Object,Object> entry = (Map.Entry<Object,Object>)it.next();
			String k = (String)entry.getKey();
			Object v = entry.getValue();
			if(null != v && !"".equals(v) 
					&& !"sign".equals(k) && !"key".equals(k)) {
				sb.append(k + "=" + v + "&");
			}
		}
		sb.append("key=" + WeiXinConfig.KEY);
		String sign = MD5Util.MD5Encode(sb.toString(), characterEncoding).toUpperCase();
		System.out.println(sign);
		return sign;
	}
}
