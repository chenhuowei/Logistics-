package com.manway.dao;

import com.manway.entity.OrderTrack;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface OrderTrackMapper {

    int deleteByPrimaryKey(String id);

    int insert(OrderTrack record);

    int insertSelective(OrderTrack record);

    OrderTrack selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(OrderTrack record);

    int updateByPrimaryKey(OrderTrack record);
    
    List<OrderTrack> findByPage(@Param("orderFormId")String orderFormId);
    
    List<OrderTrack> findByOrderFormId(@Param("orderFormId")String orderFormId);
}