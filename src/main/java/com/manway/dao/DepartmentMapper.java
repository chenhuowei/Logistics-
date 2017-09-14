package com.manway.dao;

import java.util.List;

import com.manway.entity.Department;

public interface DepartmentMapper {

    int deleteByPrimaryKey(String id);

    int insert(Department record);

    int insertSelective(Department record);


    Department selectByPrimaryKey(String id);
    
    List<Department> findByPage();

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
}