/**
@date 2016年12月8日下午11:22:32
@author chenhuowei
@copyright manway


*/
package com.manway.company.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manway.base.BaseController;
import com.manway.entity.Customer;
import com.manway.queryParam.CustomerQueryParam;
import com.manway.service.CustomerServcie;
import com.manway.utils.JsonUtil;
import com.manway.utils.StringUtil;

@Controller
@RequestMapping("/customer")
public class CutomerController implements BaseController<Customer> {

	@Resource
	private CustomerServcie customerService;
	
	@RequestMapping("/customerPage.do")
	public String toPage() {
		
		return "company/customerPage";
	}

	@RequestMapping(value="/save.do",method=RequestMethod.POST)
	@ResponseBody
	public Object save(Customer record) {
		try {
			record.setId(StringUtil.uuid());
			customerService.save(record);
			return JsonUtil.save(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.save(false);
	}

	@RequestMapping("/delete.do")
	@ResponseBody
	public Object deleteById(String ids) {
		try {
			if (StringUtil.isNotBlank(ids)){
				for(String id: ids.split(",")){
					customerService.deleteById(id);
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
	public Object updateSelectById(Customer record) {
		try {
			customerService.updateSelectById(record);
			return JsonUtil.update(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.update(false);
	}

	@RequestMapping("/findById.do")
	@ResponseBody
	public Object findById(String id) {
		if (StringUtil.isNotBlank(id)){
			return customerService.findById(id);
		}
		return null;
	}

	@RequestMapping("/findByPage.do")
	@ResponseBody
	public Object findByPage(int page,int rows,CustomerQueryParam param){
		
		return customerService.findByPage(page, rows,param);
	}
	
	
	
	
}
