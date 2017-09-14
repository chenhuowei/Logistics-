package com.manway.dao;

import com.manway.entity.Store;
import java.util.List;

public interface StoreMapper {


    int deleteByPrimaryKey(String id);

    int insert(Store record);

    int insertSelective(Store record);


    Store selectByPrimaryKey(String id);

    List<Store> findByPage();

    int updateByPrimaryKeySelective(Store record);

    int updateByPrimaryKey(Store record);
}