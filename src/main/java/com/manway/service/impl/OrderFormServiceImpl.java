package com.manway.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manway.dao.OrderFormMapper;
import com.manway.entity.OrderForm;
import com.manway.queryParam.OrderFormQueryParam;
import com.manway.service.OrderFormService;
import com.manway.utils.PageUtil;

@Service("orderFormService")
public class OrderFormServiceImpl implements OrderFormService {

	@Resource
	private OrderFormMapper orderFormMapper;
	
	public void save(OrderForm record) {
		orderFormMapper.insert(record);
	}

	public void saveSelect(OrderForm record) {
		orderFormMapper.insertSelective(record);
	}

	public void deleteById(String id) {
		orderFormMapper.deleteByPrimaryKey(id);
	}

	public void updateById(OrderForm record) {
		orderFormMapper.updateByPrimaryKey(record);
	}

	public void updateSelectById(OrderForm record) {
		orderFormMapper.updateByPrimaryKeySelective(record);
	}

	public OrderForm findById(String id) {

		return orderFormMapper.selectByPrimaryKey(id);
	}

	public List<OrderForm> findAll() {

		return null;
	}

	public PageUtil findByPage(int page, int rows,OrderFormQueryParam param) {

		PageHelper.startPage(page, rows);
		PageInfo<OrderForm> pageInfo = new PageInfo<OrderForm>(orderFormMapper.findByPage(param));
		return new PageUtil(pageInfo.getTotal(), pageInfo.getList());
	}

	public OrderForm findByOrderId(String orderId) {
		
		List<OrderForm> list = orderFormMapper.findByOrderId(orderId);
		if (null != list && list.size() > 0){
			return list.get(0);
		}
		
		return null;
	}

	public int countYunOrder() {
		
		return orderFormMapper.countYunOrder();
	}

}
