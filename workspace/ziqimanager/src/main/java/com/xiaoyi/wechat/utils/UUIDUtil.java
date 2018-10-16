package com.xiaoyi.wechat.utils;

import java.util.UUID;

public class UUIDUtil {

	/**
	 * 生成UUID编码
	 * @return
	 */
	public static String getUUID(){
		UUID uuid = UUID.randomUUID();
		String str = uuid.toString();
		return str.replaceAll("-", "");
	}
	
	public static String getUUIDPrimary() {
		String str = UUID.randomUUID().toString();
		return str;
	}
}
