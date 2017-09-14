package com.manway.service;


import com.manway.base.BaseService;
import com.manway.entity.OrderForm;
import com.manway.queryParam.OrderFormQueryParam;
import com.manway.utils.PageUtil;

public interface OrderFormService extends BaseService<OrderForm> {

	public PageUtil findByPage(int page,int rows,OrderFormQueryParam param);
	public OrderForm findByOrderId(String orderId);
	public int countYunOrder();
}
