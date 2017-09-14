package com.manway.dao;

import java.util.List;

import com.manway.entity.Menu;

public interface MenuMapper {


    int deleteByPrimaryKey(String id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);
    
    List<Menu> selectAll();
    
}