package com.manway.dao;

import java.util.List;
import java.util.Map;

import com.manway.entity.Job;

public interface JobMapper {


    int deleteByPrimaryKey(String id);

    int insert(Job record);

    int insertSelective(Job record);


    Job selectByPrimaryKey(String id);

    List<Job> findByPage();

    int updateByPrimaryKeySelective(Job record);

    int updateByPrimaryKey(Job record);
    
    List<Map<String, String>> findAsCombobox();
    
}