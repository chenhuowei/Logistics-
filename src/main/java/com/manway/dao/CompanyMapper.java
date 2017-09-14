package com.manway.dao;

import java.util.List;
import java.util.Map;

import com.manway.entity.Company;

public interface CompanyMapper {

    int deleteByPrimaryKey(String id);

    int insert(Company record);

    int insertSelective(Company record);

    
    Company selectByPrimaryKey(String id);

    List<Company> selectByPage();
    List<Company> selectAll();
    List<Map<String, String>> selectAsMenu();
    int updateByPrimaryKeySelective(Company record);

    int updateByPrimaryKey(Company record);
}