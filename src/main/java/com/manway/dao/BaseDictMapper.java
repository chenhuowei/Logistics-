package com.manway.dao;

import com.manway.entity.BaseDict;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface BaseDictMapper {


    int deleteByPrimaryKey(String id);

    int insert(BaseDict record);

    int insertSelective(BaseDict record);

    List<BaseDict> selectByPage();

    BaseDict selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(BaseDict record);

    int updateByPrimaryKey(BaseDict record);
    
    List<Map<String, String>> selectAsCombobox(@Param("type")String type);
    List<Map<String, String>> selectType();
    
    
}