package com.manway.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manway.dao.CompanyMapper;
import com.manway.entity.Company;
import com.manway.service.CompanyService;
import com.manway.utils.PageUtil;

@Service("companyService")
public class CompanyServiceImpl implements CompanyService {

	@Resource
	private CompanyMapper companyMapper;
	
	public void save(Company record) {
		companyMapper.insert(record);
	}

	public void saveSelect(Company record) {
		companyMapper.insertSelective(record);
	}

	public void deleteById(String id) {
		companyMapper.deleteByPrimaryKey(id);
	}

	public void updateById(Company record) {
		companyMapper.updateByPrimaryKey(record);
	}

	public void updateSelectById(Company record) {
		companyMapper.updateByPrimaryKeySelective(record);
	}

	public Company findById(String id) {

		return companyMapper.selectByPrimaryKey(id);
	}

	public List<Company> findAll() {

		return companyMapper.selectAll();
	}

	public PageUtil findByPage(int page, int rows) {

		PageHelper.startPage(page, rows);
		PageInfo<Company> pageInfo = new PageInfo<Company>(companyMapper.selectByPage());
		
		return new PageUtil(pageInfo.getTotal(), pageInfo.getList());
	}

	public List<Map<String, String>> findAsMenu() {
		
		return companyMapper.selectAsMenu();
	}

}
