/**
@date 2016年12月8日下午11:13:33
@author chenhuowei
@copyright manway


*/
package com.manway.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manway.dao.CustomerMapper;
import com.manway.entity.Customer;
import com.manway.queryParam.CustomerQueryParam;
import com.manway.service.CustomerServcie;
import com.manway.utils.PageUtil;

@Service("customerService")
public class CustomerServiceImpl implements CustomerServcie {

	@Resource
	private CustomerMapper customerMapper;
	
	public void save(Customer record) {
		customerMapper.insert(record);
	}

	public void saveSelect(Customer record) {
		customerMapper.insertSelective(record);
	}

	public void deleteById(String id) {
		customerMapper.deleteByPrimaryKey(id);
	}

	public void updateById(Customer record) {
		customerMapper.updateByPrimaryKey(record);
	}

	public void updateSelectById(Customer record) {
		customerMapper.updateByPrimaryKeySelective(record);
	}

	public Customer findById(String id) {

		return customerMapper.selectByPrimaryKey(id);
	}

	public List<Customer> findAll() {

		return null;
	}

	public PageUtil findByPage(int page,int rows,CustomerQueryParam param) {

		PageHelper.startPage(page, rows);
		PageInfo<Customer> list = new PageInfo<Customer>(customerMapper.findByPage(param));
		return new PageUtil(list.getTotal(),list.getList());
	}

}
