package com.manway.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogUtil {

	private static Logger logger;
	
	public static void info(Class clazz,Object info){
		
		logger = LoggerFactory.getLogger(clazz);
		logger.info(info.toString());
	}
	
	public static void info(Class clazz,String pattern,Object arg1,Object arg2){
		
		logger = LoggerFactory.getLogger(clazz);
		logger.info(pattern, arg1, arg2);
	}
	
	
}
