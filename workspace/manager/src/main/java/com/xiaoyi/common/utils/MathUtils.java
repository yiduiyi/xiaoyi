package com.xiaoyi.common.utils;

import java.text.NumberFormat;

/**
 * 
 * @author 颜振衡
 * @QQ 1376005213
 * @Date 2018年8月23日
 */
public class MathUtils {
	/*
	 * 求百分比
	 */
	public static String percentage(int num1, int num2) {
		StringBuilder result = new StringBuilder();
		// 创建一个数值格式化对象
		NumberFormat numberFormat = NumberFormat.getInstance();
		// 设置精确到小数点后2位
		numberFormat.setMaximumFractionDigits(2);
		String percent = numberFormat.format((float) num1 / (float) num2 * 100);
		result = result.append(percent).append("%");
		return result.toString();
	}
}
