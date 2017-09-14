package com.manway.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manway.dao.BaseDictMapper;
import com.manway.entity.BaseDict;
import com.manway.service.BaseDictService;
import com.manway.utils.PageUtil;

@Service("baseDictService")
public class BaseDictServiceImpl implements BaseDictService {

	@Resource
	private BaseDictMapper baseDictMapper;
	
	
	public void save(BaseDict record) {
		baseDictMapper.insert(record);
	}

	public void saveSelect(BaseDict record) {
		baseDictMapper.insertSelective(record);
	}

	public void deleteById(String id) {
		baseDictMapper.deleteByPrimaryKey(id);
	}

	public void updateById(BaseDict record) {
		baseDictMapper.updateByPrimaryKey(record);
	}

	public void updateSelectById(BaseDict record) {
		baseDictMapper.updateByPrimaryKeySelective(record);
	}

	public BaseDict findById(String id) {

		return baseDictMapper.selectByPrimaryKey(id);
	}

	public List<BaseDict> findAll() {

		return null;
	}


	public List<Map<String, String>> findType() {
		
		return baseDictMapper.selectType();
	}

	public List<Map<String, String>> findByType(String type) {
		
		return baseDictMapper.selectAsCombobox(type);
	}

	public PageUtil findByPage(int page, int rows) {
		
		PageHelper.startPage(page, rows);
		List<BaseDict> list = baseDictMapper.selectByPage();
		PageInfo<BaseDict> pageInfo = new PageInfo<BaseDict>(list);
		return new PageUtil(pageInfo.getTotal(),pageInfo.getList());
	}

}
