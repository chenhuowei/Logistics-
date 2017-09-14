/**
@date 2016年12月4日下午9:21:20
@author chenhuowei
@copyright manway


*/
package com.manway.service;

import java.util.List;

import com.manway.base.BaseService;
import com.manway.entity.OrderTrack;
import com.manway.utils.PageUtil;

public interface OrderTrackService extends BaseService<OrderTrack> {

	public PageUtil findByPage(int page, int rows,String orderFormId);
	public List<OrderTrack> findByOrderFormId(String orderFormId);
}
