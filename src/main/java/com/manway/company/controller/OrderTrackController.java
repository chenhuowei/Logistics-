/**
@date 2016年12月5日下午9:53:33
@author chenhuowei
@copyright manway


*/
package com.manway.company.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.manway.base.BaseController;
import com.manway.entity.OrderTrack;
import com.manway.entity.Truck;
import com.manway.service.OrderFormService;
import com.manway.service.OrderTrackService;
import com.manway.service.TruckService;
import com.manway.utils.DateUtil;
import com.manway.utils.JsonUtil;
import com.manway.utils.StringUtil;

@Controller
@RequestMapping("/orderTrack")
public class OrderTrackController implements BaseController<OrderTrack> {
	
	@Resource
	private OrderFormService orderFormService;
	
	@Resource
	private OrderTrackService orderTrackService;
	@Resource
	private TruckService truckService;
	
	private void updateTruck(OrderTrack record) {
		Truck truck = truckService.findByTruckId(record.getTruckId());
		record.setDriverName(truck.getDriverName());
		record.setDriverMobile(truck.getDriverMobile());
		record.setTruckPlateNumber(truck.getTruckPlateNumber());
		truck.setTruckLocation(record.getLocation());
		truckService.updateSelectById(truck);
	}
	
	
	public String toPage() {
		
		return "";
	}

	@RequestMapping("/orderTrackPage.do")
	public String toPage2(String orderFormId,HttpServletRequest request) {
		request.setAttribute("orderForm", orderFormService.findById(orderFormId));
		return "company/orderTrackPage";
	}

	@RequestMapping(value="/save.do",method=RequestMethod.POST)
	@ResponseBody
	public Object save(OrderTrack record) {
		try {
			record.setId(StringUtil.uuid());
			record.setOrderUpdateTime(DateUtil.formatDateTime(null, new Date()));
			record.setOperateTime(DateUtil.formatDateTime(null, new Date()));
			
			updateTruck(record);
			
			orderTrackService.save(record);
			return JsonUtil.save(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.save(false);
	}


	@RequestMapping(value="/delete.do",method=RequestMethod.GET)
	@ResponseBody
	public Object deleteById(String ids) {
		try {
			if (StringUtil.isNotBlank(ids)){
				for(String id : ids.split(",")){
					orderTrackService.deleteById(id);
				}
				return JsonUtil.delete(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.delete(false);
	}

	@RequestMapping(value="/update.do",method=RequestMethod.POST)
	@ResponseBody
	public Object updateSelectById(OrderTrack record) {
		try {
			record.setOrderUpdateTime(DateUtil.formatDateTime(null, new Date()));
			record.setOperateTime(DateUtil.formatDateTime(null, new Date()));
			updateTruck(record);
			orderTrackService.updateSelectById(record);
			return JsonUtil.update(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.update(false);
	}

	@RequestMapping(value="/findById.do",method=RequestMethod.GET)
	@ResponseBody
	public Object findById(String id) {
		
		return orderTrackService.findById(id);
	}
	
	@RequestMapping(value="/findByPage.do",method=RequestMethod.GET)
	@ResponseBody
	public Object findByPage(int page, int rows,String orderFormId) {
		
		return orderTrackService.findByPage(page,rows,orderFormId);
	}
	
	@RequestMapping(value="/findByOrderFormId.do",method=RequestMethod.GET)
	@ResponseBody
	public Object findByOrderFormId(String orderFormId) {
		Map<String, Object> json = new HashMap<String, Object>();
		json.put("orderForm", orderFormService.findByOrderId(orderFormId));
		json.put("orderTrack", orderTrackService.findByOrderFormId(orderFormId));
		
		return json;
	}

}
