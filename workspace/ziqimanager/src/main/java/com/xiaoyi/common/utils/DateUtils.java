package com.xiaoyi.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 
 * @author 颜振衡
 * @QQ 1376005213
 * @Date 2018年8月21日
 */
public class DateUtils {
	public static final String YYYYMMDDHHMMSS = "yyyy-MM-dd HH:mm:ss";
	public static final String YYYYMMDD = "yyyy-MM-dd";
	public static final String MMDD = "MM月dd日";
	public static final String MMPointDD = "MM.dd";
	public static final String HHMM = "HH:mm";

	public static String toYYYYMMDDHHMMSSString(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(YYYYMMDDHHMMSS);
		return dateFormat.format(date);
	}

	public static String toYYYYMMDDString(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(YYYYMMDD);
		return dateFormat.format(date);
	}

	public static String toMMDDString(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(MMDD);
		return dateFormat.format(date);
	}
	
	public static String toMMPointDDString(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(MMPointDD);
		return dateFormat.format(date);
	}
	public static Date toYYYYMMDDHHMMSSDate(String dateString) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat(YYYYMMDDHHMMSS);
		return dateFormat.parse(dateString);
	}

	public static Date toYYYYMMDDDate(String dateString) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat(YYYYMMDD);
		return dateFormat.parse(dateString);
	}

	public static StringBuilder starTimeJoinEndTime(Date startTime, Date endTime) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(HHMM);
		StringBuilder result = new StringBuilder();
		String startTimeStr = dateFormat.format(startTime);
		String endTimeStr = dateFormat.format(endTime);
		result = result.append(startTimeStr).append("——").append(endTimeStr);
		return result;
	}

	public static Date getLastMonth() {
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		c.add(Calendar.MONTH, -1);
		Date lastMonth = c.getTime();
		return lastMonth;
	}
	public static Date getLastDay() {
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		c.add(Calendar.DAY_OF_MONTH, -1);
		Date lastMonth = c.getTime();
		return lastMonth;
	}
	
	public static Date getDayMin(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 00);
        calendar.set(Calendar.MINUTE, 00);
        calendar.set(Calendar.SECOND, 00);
        calendar.set(Calendar.MILLISECOND, 0);

        return new Date(calendar.getTime().getTime());
    }
    
	public static Date getDayMax(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		calendar.set(Calendar.MILLISECOND, 0);

		return new Date(calendar.getTime().getTime());
	}
	
	public static String getUnixTimestamp(Date date) {
		return (date.getTime() / 1000) + "";
	}
	
	public static void main(String[] args) {
		String aa = getUnixTimestamp(getLastDay());
		System.out.println(aa);
	}
}
