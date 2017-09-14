package com.manway.service;

import java.util.List;
import java.util.Map;

import com.manway.base.BaseService;
import com.manway.entity.BaseDict;
import com.manway.utils.PageUtil;

public interface BaseDictService extends BaseService<BaseDict> {

	
	public PageUtil findByPage(int page,int rows);
	
	public List<Map<String, String>> findType();
	
	public List<Map<String, String>> findByType(String type);
	
	
}
