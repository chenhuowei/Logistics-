package com.manway.utils;

import java.util.UUID;

public class StringUtil {

	public  static String uuid(){
		
		return UUID.randomUUID().toString();
	}
	
	
	public static  boolean isBlank(String str){
		if ("".equals(str) || null == str){
			return true;
		}
		return false;
	}
	
	public static  boolean isNotBlank(String str){
		if (!"".equals(str) && null != str){
			return true;
		}
		return false;
	}
	
	
	public static  boolean isNotEmpty(String str){
		if (null != str && !"".equals(str.trim())){
			return true;
		}
		return false;
	}
	
	
	
}
