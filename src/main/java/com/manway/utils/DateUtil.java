package com.manway.utils;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;


public class DateUtil {

	private static SimpleDateFormat simpleDateFormat;
	
	public static String formatDate(String pattern,Date date){
		if (StringUtil.isBlank(pattern)){
			simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		}else {
			simpleDateFormat = new SimpleDateFormat(pattern);
		}
		
		return simpleDateFormat.format(date);
	}
	
	public static String formatDateTime(String pattern,Date date){
		if (StringUtil.isBlank(pattern)){
			simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		}else {
			simpleDateFormat = new SimpleDateFormat(pattern);
		}
		
		return simpleDateFormat.format(date);
	}
	
	public static Date parseDate(String pattern,String date) {
		
		try {
			if (StringUtil.isBlank(pattern)){
				simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			}else {
				simpleDateFormat = new SimpleDateFormat(pattern);
			}
			return simpleDateFormat.parse(date);
		} catch (Exception e) {
			e.printStackTrace();  
		}
		return null;
	}
	
	public static Date parseDateTime(String pattern,String date) {
		
		try {
			if (StringUtil.isBlank(pattern)){
				simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			}else {
				simpleDateFormat = new SimpleDateFormat(pattern);
			}
			return simpleDateFormat.parse(date);
		} catch (Exception e) {
			e.printStackTrace();  
		}
		return null;
	}
	
	public static int birthToAge(String birth){
		
		try {
			if (StringUtil.isNotBlank(birth)){
				int bYear = Integer.parseInt(birth.substring(0, 4));
				int nYear = LocalDate.now().getYear();
				
				return nYear-bYear;
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();  
		}
		
		
		return 0;
	}
	
	
	
	
}
