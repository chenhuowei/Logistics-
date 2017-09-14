/**
@date 2016年12月4日下午9:23:18
@author chenhuowei
@copyright manway


*/
package com.manway.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manway.dao.OrderTrackMapper;
import com.manway.entity.OrderTrack;
import com.manway.service.OrderTrackService;
import com.manway.utils.PageUtil;

@Service("orderTrackService")
public class OrderTrackServiceImpl implements OrderTrackService {

	@Resource
	private OrderTrackMapper orderTrackMapper;

	public void save(OrderTrack record) {
		orderTrackMapper.insert(record);
	}

	public void saveSelect(OrderTrack record) {
		orderTrackMapper.insertSelective(record);
	}

	public void deleteById(String id) {
		orderTrackMapper.deleteByPrimaryKey(id);
	}

	public void updateById(OrderTrack record) {
		orderTrackMapper.updateByPrimaryKey(record);
	}

	public void updateSelectById(OrderTrack record) {
		orderTrackMapper.updateByPrimaryKeySelective(record);
	}

	public OrderTrack findById(String id) {
		
		return orderTrackMapper.selectByPrimaryKey(id);
	}

	public List<OrderTrack> findAll() {
		
		return null;
	}

	public PageUtil findByPage(int page,int rows,String orderFormId) {
		PageHelper.startPage(page, rows);
		PageInfo<OrderTrack> list = new PageInfo<OrderTrack>(orderTrackMapper.findByPage(orderFormId));
		return new PageUtil(list.getTotal(), list.getList());
	}

	public List<OrderTrack> findByOrderFormId(String orderFormId) {
		
		return orderTrackMapper.findByOrderFormId(orderFormId);
	}
	
	
}
