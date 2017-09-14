package com.manway.dao;

import java.util.List;

import com.manway.entity.OrderForm;
import com.manway.queryParam.OrderFormQueryParam;

public interface OrderFormMapper {


    int deleteByPrimaryKey(String id);

    int insert(OrderForm record);

    int insertSelective(OrderForm record);


    OrderForm selectByPrimaryKey(String id);

    List<OrderForm> findByPage(OrderFormQueryParam queryParam);
    
    List<OrderForm> findByOrderId(String orderId);

    int updateByPrimaryKeySelective(OrderForm record);

    int updateByPrimaryKey(OrderForm record);
    
    int countYunOrder();
}