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
	public static final String YYYYMM = "yyyy-MM";
	public static final String MMDD = "MM月dd日";
	public static final String MMPointDD = "MM.dd";
	public static final String YYYYPointMMPointDD = "yyyy.MM.dd";
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

	public static String toYYYYPointMMPointDDString(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(YYYYPointMMPointDD);
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

	public static Date toYYYYMMDate(String dateString) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat(YYYYMM);
		return dateFormat.parse(dateString);
	}

	public static StringBuilder startTimeJoinEndTime(Date startTime, Date endTime) {
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

	public static Date getWeekMin(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int day_of_week = calendar.get(Calendar.DAY_OF_WEEK) - 1;
		if (day_of_week == 0) {
			day_of_week = 7;
		}
		calendar.add(Calendar.DATE, -day_of_week + 1);
		calendar.set(Calendar.HOUR_OF_DAY, 00);
		calendar.set(Calendar.MINUTE, 00);
		calendar.set(Calendar.SECOND, 00);
		calendar.set(Calendar.MILLISECOND, 0);

		return new Date(calendar.getTime().getTime());
	}

	public static Date getWeekMax(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int day_of_week = calendar.get(Calendar.DAY_OF_WEEK) - 1;
		if (day_of_week == 0) {
			day_of_week = 7;
		}
		calendar.add(Calendar.DATE, -day_of_week + 7);
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		calendar.set(Calendar.MILLISECOND, 0);

		return new Date(calendar.getTime().getTime());
	}

	public static Date getMonthMin(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.set(Calendar.HOUR_OF_DAY, 00);
		calendar.set(Calendar.MINUTE, 00);
		calendar.set(Calendar.SECOND, 00);
		calendar.set(Calendar.MILLISECOND, 0);

		return new Date(calendar.getTime().getTime());
	}

	public static Date getMonthMax(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		Integer day = DayOfMonth(calendar.get(Calendar.YEAR),calendar.get(Calendar.MONTH)+1);
		calendar.set(Calendar.DAY_OF_MONTH,day);
		calendar.set(Calendar.HOUR_OF_DAY, 23);
		calendar.set(Calendar.MINUTE, 59);
		calendar.set(Calendar.SECOND, 59);
		calendar.set(Calendar.MILLISECOND, 0);
		return new Date(calendar.getTime().getTime());
	}
	
	public static Integer DayOfMonth(int year, int month) {
		int day = 0;
	    switch (month)
	    {
	    case 1:
	    case 3:
	    case 5:
	    case 7:
	    case 8:
	    case 10:
	    case 12:
	        day = 31;
	        break;
	    case 4:
	    case 6:
	    case 9:
	    case 11:
	        day = 30;
	        break;
	    case 2:
	    	if(IsLeapYear(year)) {
	    		day = 29;
	    	}else {
	    		day = 28;
	    	}
	        break;
	    }
	    return day;
	}
	public static Boolean IsLeapYear(int year) {
		Boolean isLeap = false;
		if (year % 4 == 0) {
			isLeap = true;
			if (year % 100 == 0) {
				if (year % 400 == 0) {
					isLeap = true;
				} else {
					isLeap = false;
				}
			}
		}
		return isLeap;
	}
}
