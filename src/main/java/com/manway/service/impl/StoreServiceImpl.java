/**
@date 2016年11月21日下午9:31:45
@author chenhuowei
@copyright manway


*/
package com.manway.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manway.dao.StoreMapper;
import com.manway.entity.Store;
import com.manway.service.StoreService;
import com.manway.utils.PageUtil;

@Service("storeService")
public class StoreServiceImpl implements StoreService {

	@Resource
	private StoreMapper storeMapper;
	
	public void save(Store record) {
		storeMapper.insert(record);
	}

	public void saveSelect(Store record) {
		storeMapper.insertSelective(record);
	}

	public void deleteById(String id) {
		storeMapper.deleteByPrimaryKey(id);
	}

	public void updateById(Store record) {
		storeMapper.updateByPrimaryKey(record);
	}

	public void updateSelectById(Store record) {
		storeMapper.updateByPrimaryKeySelective(record);
	}

	public Store findById(String id) {

		return storeMapper.selectByPrimaryKey(id);
	}

	public List<Store> findAll() {

		return null;
	}

	public PageUtil findByPage(int page, int rows) {

		PageHelper.startPage(page, rows);
		PageInfo<Store> pageInfo = new PageInfo<Store>(storeMapper.findByPage());
		
		return new PageUtil(pageInfo.getTotal(), pageInfo.getList());
	}

}
