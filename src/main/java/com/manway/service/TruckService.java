/**
@date 2016年11月19日下午11:02:24
@author chenhuowei
@copyright manway


*/
package com.manway.service;


import java.util.List;
import java.util.Map;

import com.manway.base.BaseService;
import com.manway.entity.Truck;
import com.manway.queryParam.TruckQueryParam;
import com.manway.utils.PageUtil;

public interface TruckService extends BaseService<Truck>{

	public PageUtil findByPage(int page,int rows,TruckQueryParam truckQueryParam);
	
	List<Map<String, Object>>  findAsComobox();
	
	public Truck findByTruckId(String truckId);
	
}
