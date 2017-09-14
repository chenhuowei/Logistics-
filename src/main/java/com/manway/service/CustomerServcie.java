/**
@date 2016年12月8日下午11:12:40
@author chenhuowei
@copyright manway


*/
package com.manway.service;

import com.manway.base.BaseService;
import com.manway.entity.Customer;
import com.manway.queryParam.CustomerQueryParam;
import com.manway.utils.PageUtil;

public interface CustomerServcie extends BaseService<Customer> {

	public PageUtil findByPage(int page,int rows,CustomerQueryParam param);
	
}
