package com.manway.base;

import java.util.List;

public interface BaseService<T> {

	public void save(T record);
	
	public void saveSelect(T record);
	
	public void deleteById(String id);
	
	public void updateById(T record);
	
	public void updateSelectById(T record);
	
	public T findById(String id);
	
	public List<T> findAll();
	
	
	
	
	
}
