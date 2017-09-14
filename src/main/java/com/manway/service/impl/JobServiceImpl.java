package com.manway.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manway.dao.JobMapper;
import com.manway.entity.Job;
import com.manway.service.JobService;
import com.manway.utils.PageUtil;


@Service("jobService")
public class JobServiceImpl implements JobService {

	@Resource
	private JobMapper jobMapper;
	
	public void save(Job record) {
		jobMapper.insert(record);
	}

	public void saveSelect(Job record) {
		jobMapper.insertSelective(record);
	}

	public void deleteById(String id) {
		jobMapper.deleteByPrimaryKey(id);
	}

	public void updateById(Job record) {
		jobMapper.updateByPrimaryKey(record);
	}

	public void updateSelectById(Job record) {
		jobMapper.updateByPrimaryKeySelective(record);
	}

	public Job findById(String id) {

		return jobMapper.selectByPrimaryKey(id);
	}

	public List<Job> findAll() {

		return null;
	}

	public PageUtil findByPage(int page, int rows) {
		PageHelper.startPage(page, rows);
		PageInfo<Job> pageInfo = new PageInfo<Job>(jobMapper.findByPage());
		
		return new PageUtil(pageInfo.getTotal(), pageInfo.getList());
	}

	public List<Map<String, String>> findAsCombobox() {
		
		return jobMapper.findAsCombobox();
	}

}
