package com.manway.utils;

import java.util.HashMap;
import java.util.Map;

public class JsonUtil {

	private static  Map<String, Object> json;
	private final static String SUCCESS = "success";
	private final static String MESSAGE = "message";
	
	
	public static Map<String, Object> save(boolean success){
		json = new HashMap<String, Object>();
		if (success){
			json.put(SUCCESS, true);
			json.put(MESSAGE, "保存成功");
		}else {
			json.put(SUCCESS, false);
			json.put(MESSAGE, "保存失败");
		}
		
		return json;
	}
	
	public static Map<String, Object> delete(boolean success){
		json = new HashMap<String, Object>();
		if (success){
			json.put(SUCCESS, true);
			json.put(MESSAGE, "删除成功");
		}else {
			json.put(SUCCESS, false);
			json.put(MESSAGE, "删除失败");
		}
		
		return json;
	}
	
	public static Map<String, Object> update(boolean success){
		json = new HashMap<String, Object>();
		if (success){
			json.put(SUCCESS, true);
			json.put(MESSAGE, "更新成功");
		}else {
			json.put(SUCCESS, false);
			json.put(MESSAGE, "更新失败");
		}
		
		return json;
	}
	
	
	
	public static Map<String, Object> messageJson(boolean success,String message){
		json = new HashMap<String, Object>();
			json.put(SUCCESS, success);
			json.put(MESSAGE, message);
		return json;
	}
	
	
	
}
