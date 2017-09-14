package com.manway.service;

import java.util.List;
import java.util.Map;

import com.manway.base.BaseService;
import com.manway.entity.Company;
import com.manway.utils.PageUtil;

public interface CompanyService extends BaseService<Company> {

	public PageUtil findByPage(int page,int rows);
	
	public List<Map<String, String>> findAsMenu();
	
}
