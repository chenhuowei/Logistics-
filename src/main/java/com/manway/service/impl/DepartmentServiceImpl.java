package com.manway.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manway.dao.DepartmentMapper;
import com.manway.entity.Department;
import com.manway.service.DepartmentService;
import com.manway.utils.PageUtil;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {

	@Resource
	private DepartmentMapper departmentMapper;
	
	public void save(Department record) {
		departmentMapper.insert(record);
	}

	public void saveSelect(Department record) {
		departmentMapper.insertSelective(record);
	}

	public void deleteById(String id) {
		departmentMapper.deleteByPrimaryKey(id);
	}

	public void updateById(Department record) {
		departmentMapper.updateByPrimaryKey(record);
	}

	public void updateSelectById(Department record) {
		departmentMapper.updateByPrimaryKeySelective(record);
	}

	public Department findById(String id) {

		return departmentMapper.selectByPrimaryKey(id);
	}

	public List<Department> findAll() {

		return null;
	}

	public PageUtil findByPage(int page, int rows) {
		
		PageHelper.startPage(page, rows);
		PageInfo<Department> pageInfo = new PageInfo<Department>(departmentMapper.findByPage());
		
		return new PageUtil(pageInfo.getTotal(), pageInfo.getList());
	}

}
