package com.manway.company.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manway.base.BaseController;
import com.manway.entity.OrderForm;
import com.manway.queryParam.OrderFormQueryParam;
import com.manway.service.OrderFormService;
import com.manway.utils.DateUtil;
import com.manway.utils.JsonUtil;
import com.manway.utils.StringUtil;
import com.manway.utils.Utils;

@Controller
@RequestMapping("/orderForm")
public class OrderFormController implements BaseController<OrderForm> {

	@Resource
	private OrderFormService orderFormService;
	
	@RequestMapping("/orderFormPage.do")
	public String toPage() {
		
		return "company/orderFormPage";
	}

	@RequestMapping("/create.do")
	public String orderFormCreate() {
		
		return "company/orderFormCreatePage";
	}
	
	@ResponseBody
	@RequestMapping(value="/save.do",method=RequestMethod.POST)
	public Object save(OrderForm record,@RequestParam(required=false)Boolean yun) {
		try {
			record.setId(StringUtil.uuid());
			record.setCreateTime(DateUtil.formatDateTime(null, new Date()));
			record.setOrderId(Utils.createOrderId());
			if (yun){
				record.setIsPayment(false);
				record.setOrderState(5);
			}
			orderFormService.save(record);
			return JsonUtil.save(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.save(false);
	}

	@ResponseBody
	@RequestMapping(value="/delete.do",method=RequestMethod.GET)
	public Object deleteById(String ids) {
		try {
			if (StringUtil.isNotBlank(ids)){
				for(String id : ids.split(",")){
					orderFormService.deleteById(id);
				}
				return JsonUtil.delete(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.delete(false);
	}

	@ResponseBody
	@RequestMapping(value="/update.do",method=RequestMethod.POST)
	public Object updateSelectById(OrderForm record) {
		try {
			record.setUpdateTime(DateUtil.formatDate(null, new Date()));
			orderFormService.updateSelectById(record);
			return JsonUtil.update(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.update(false);
	}

	@ResponseBody
	@RequestMapping(value="/findById.do",method=RequestMethod.GET)
	public Object findById(String id) {
		
		return orderFormService.findById(id);
	}
	
	@ResponseBody
	@RequestMapping(value="/findByPage.do",method=RequestMethod.GET)
	public Object findByPage(int page,int rows,OrderFormQueryParam param) {
		
		return orderFormService.findByPage(page, rows,param);
	}

	public Object save(OrderForm record) {
		
		return null;
	}
	
	@RequestMapping("/countYunOrder.do")
	@ResponseBody
	public Object countYunOrder() {
		Map<String, Integer> json = new HashMap<String, Integer>();
		json.put("taskCount", orderFormService.countYunOrder());
		return json;
	}

}
