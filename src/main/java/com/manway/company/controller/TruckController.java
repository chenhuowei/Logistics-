/**

@date 2016年11月19日下午11:07:22
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
import com.manway.entity.Truck;
import com.manway.entity.User;
import com.manway.queryParam.TruckQueryParam;
import com.manway.service.TruckService;
import com.manway.service.UserService;
import com.manway.utils.JsonUtil;
import com.manway.utils.StringUtil;
import com.manway.utils.Utils;

@Controller
@RequestMapping("/truck")
public class TruckController implements BaseController<Truck> {

	@Resource
	private TruckService truckService;
	
	@RequestMapping("/truckPage.do")
	public String toPage() {
		
		return "company/truckPage";
	}

	@ResponseBody
	@RequestMapping(value="/save.do",method=RequestMethod.POST)
	public Object save(Truck record) {
		try {
			record.setId(StringUtil.uuid());
			record.setTruckId(Utils.createTruckId());
			truckService.save(record);
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
					truckService.deleteById(id);
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
	public Object updateSelectById(Truck record) {
		try {
			truckService.updateSelectById(record);
			return JsonUtil.update(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.update(false);
	}

	@ResponseBody
	@RequestMapping(value="/findById.do",method=RequestMethod.GET)
	public Object findById(String id) {
		
		return truckService.findById(id);
	}
	
	@ResponseBody
	@RequestMapping(value="/findByPage.do",method=RequestMethod.GET)
	public Object findByPage(int page,int rows,TruckQueryParam param) {
		
		return truckService.findByPage(page, rows,param);
	}
	
	@ResponseBody
	@RequestMapping(value="/findAsCombobox.do",method=RequestMethod.GET)
	public Object  findAsComobox() {
		
		return truckService.findAsComobox();
	}

}
