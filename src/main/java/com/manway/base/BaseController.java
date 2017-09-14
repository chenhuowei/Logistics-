package com.manway.base;


public interface BaseController<T> {

	
	public String toPage();
	public Object save(T record);
	
	public Object deleteById(String ids);
	public Object updateSelectById(T record);
	
	public Object findById(String id);
	
	
	
	
	
	
	
}
