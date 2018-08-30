package com.xiaoyi.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 
 * @author 颜振衡
 * @QQ 1376005213
 * @Date 2018年8月21日
 */
public class DateUtils {
	public static final String YYYYMMDDHHMMSS ="yyyy-MM-dd HH:mm:ss";
	public static final String YYYYMMDD ="yyyy-MM-dd";
	
	public static final String HHMM ="HH:mm";
	
	public static String toYYYYMMDDHHMMSSString(Date date) {
		SimpleDateFormat dateFormat=new SimpleDateFormat(YYYYMMDDHHMMSS);
		return dateFormat.format(date);
	}
	
	public static String toYYYYMMDDString(Date date) {
		SimpleDateFormat dateFormat=new SimpleDateFormat(YYYYMMDD);
		return dateFormat.format(date);
	}
	
	public static Date toYYYYMMDDHHMMSSDate(String dateString) throws ParseException {
		SimpleDateFormat dateFormat=new SimpleDateFormat(YYYYMMDDHHMMSS);
		return dateFormat.parse(dateString);
	}
	
	public static Date toYYYYMMDDDate(String dateString) throws ParseException {
		SimpleDateFormat dateFormat=new SimpleDateFormat(YYYYMMDD);
		return dateFormat.parse(dateString);
	}
	
	public static StringBuilder starTimeJoinEndTime(Date startTime,Date endTime) {
		SimpleDateFormat dateFormat=new SimpleDateFormat(HHMM);
		StringBuilder result = new StringBuilder();
		String startTimeStr = dateFormat.format(startTime);
		String endTimeStr = dateFormat.format(endTime);
		result=result.append(startTimeStr).append("——").append(endTimeStr);
		return result;
	}
}
