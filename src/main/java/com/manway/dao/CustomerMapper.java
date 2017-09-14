package com.manway.dao;

import com.manway.entity.Customer;
import com.manway.queryParam.CustomerQueryParam;

import java.util.List;

public interface CustomerMapper {

    int deleteByPrimaryKey(String id);

    int insert(Customer record);

    int insertSelective(Customer record);
    
    List<Customer> findByPage(CustomerQueryParam param);

    Customer selectByPrimaryKey(String id);


    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
}