package com.manway.service;


import com.manway.base.BaseService;
import com.manway.entity.Department;
import com.manway.utils.PageUtil;

public interface DepartmentService extends BaseService<Department> {

	public PageUtil findByPage(int page,int rows);
}
