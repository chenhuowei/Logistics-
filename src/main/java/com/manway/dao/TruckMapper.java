package com.manway.dao;

import com.manway.entity.Truck;
import com.manway.queryParam.TruckQueryParam;

import java.util.List;
import java.util.Map;

public interface TruckMapper {

    int deleteByPrimaryKey(String id);

    int insert(Truck record);

    int insertSelective(Truck record);

    List<Truck> findByPage(TruckQueryParam truckQueryParam);
    Truck selectByPrimaryKey(String id);
    Truck findByTruckId(String truckId);

    List<Map<String, Object>>  findAsCombobox();

    int updateByPrimaryKeySelective(Truck record);

    int updateByPrimaryKey(Truck record);
}