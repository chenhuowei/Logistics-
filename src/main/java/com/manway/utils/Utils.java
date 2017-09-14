/**
@date 2016年11月18日下午4:55:01
@user chenhuowei
@copyright manway


*/
package com.manway.utils;

import java.util.Date;
import java.util.Random;

public class Utils {
	
	private static Random random = new Random();
	
	public static String createOrderId(){
		int number = random.nextInt(90)+10;
		StringBuilder buffer = new StringBuilder("MW");
		buffer.append(DateUtil.formatDate("yyyyMMddHHmmss", new Date()))
			.append(number);
		return buffer.toString();
	}

	
	public static String createTruckId(){
		int number = random.nextInt(10);
		StringBuilder buffer = new StringBuilder("T");
		buffer.append(DateUtil.formatDate("yyMMddHHmmss", new Date()))
		.append(number);
		return buffer.toString();
	}
	
	
	

}
