package com.xiaoyi.common.utils;

import java.util.Random;

/**
 * 获取随机字符串
 * @author 王士忠
 * @date 2017年11月27日
 * */
public class StringUtils {
	/**
	 * 获取随机字符串
	 * @param length 生成的随机字符串长度
	 * */
	public static String getStrRandom(int length){
		if(length<1){
			return "";
		}else{
			String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz";
			StringBuilder sb = new StringBuilder();
			Random ra = new Random();
			int index = 0;
			for (int i = 0; i < length ;i++ ) {
				index = ra.nextInt(str.length());
				sb.append(str.charAt(index));
			}
			return sb.toString();
		}
	}
}
