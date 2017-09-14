package com.manway.service;

import java.util.List;
import java.util.Map;

import com.manway.base.BaseService;
import com.manway.entity.Job;
import com.manway.utils.PageUtil;

public interface JobService extends BaseService<Job> {

	public PageUtil findByPage(int page,int rows);
	public List<Map<String, String>> findAsCombobox();
}
