/**
@date 2016年11月19日下午11:04:06
@author chenhuowei
@copyright manway


*/
package com.manway.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manway.dao.TruckMapper;
import com.manway.entity.Truck;
import com.manway.queryParam.TruckQueryParam;
import com.manway.service.TruckService;
import com.manway.utils.PageUtil;

@Service("truckService")
public class TruckServiceImpl implements TruckService {

	@Resource
	private TruckMapper truckMapper;
	
	
	public void save(Truck record) {
		truckMapper.insert(record);
	}

	public void saveSelect(Truck record) {
		truckMapper.insertSelective(record);
	}

	public void deleteById(String id) {
		truckMapper.deleteByPrimaryKey(id);
	}

	public void updateById(Truck record) {
		truckMapper.updateByPrimaryKey(record);
	}

	public void updateSelectById(Truck record) {
		truckMapper.updateByPrimaryKeySelective(record);
	}

	public Truck findById(String id) {

		return truckMapper.selectByPrimaryKey(id);
	}

	public List<Truck> findAll() {

		return null;
	}

	public PageUtil findByPage(int page, int rows,TruckQueryParam param) {

		 PageHelper.startPage(page, rows, true);
		 PageInfo<Truck> pageInfo = new PageInfo<Truck>(truckMapper.findByPage(param));
		
		return new PageUtil(pageInfo.getTotal(), pageInfo.getList());
	}

	public List<Map<String, Object>> findAsComobox() {
		
		return truckMapper.findAsCombobox();
	}

	public Truck findByTruckId(String truckId) {
		
		return truckMapper.findByTruckId(truckId);
	}

}
