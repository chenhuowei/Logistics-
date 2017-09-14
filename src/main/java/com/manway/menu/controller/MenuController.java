package com.manway.menu.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manway.base.BaseController;
import com.manway.entity.Menu;
import com.manway.service.MenuService;
import com.manway.utils.JsonUtil;
import com.manway.utils.LogUtil;
import com.manway.utils.StringUtil;

@Controller
@RequestMapping("/menu")
public class MenuController implements BaseController<Menu>{

	@Resource
	private MenuService menuService;


	@ResponseBody
	@RequestMapping(value="/save.do",method=RequestMethod.POST)
	public Object save(Menu record) {
		try {
			LogUtil.info(getClass(), record.getText());
			record.setId(StringUtil.uuid());
			menuService.save(record);
			return JsonUtil.save(true);
		} catch (Exception e) {
			
		}
		return JsonUtil.save(false);
	}

	@ResponseBody
	@RequestMapping(value="/delete.do",method=RequestMethod.GET)
	public Object deleteById(String id) {
		try {
			menuService.deleteById(id);
			return JsonUtil.delete(true);
		} catch (Exception e) {

		}
		return JsonUtil.delete(false);
	}

	@ResponseBody
	@RequestMapping(value="/update.do",method=RequestMethod.POST)
	public Object updateSelectById(Menu record) {
		try {
			menuService.updateSelectById(record);
			return JsonUtil.update(true);
		} catch (Exception e) {
		}
		return JsonUtil.update(false);
	}

	@ResponseBody
	@RequestMapping(value="/findById.do",method=RequestMethod.GET)
	public Object findById(String id) {
		
		return menuService.findById(id);
	}

	@ResponseBody
	@RequestMapping(value="/findAll.do",method=RequestMethod.GET)
	public List<Menu> findAll() {
		
		return menuService.findAll();
	}

	public List<Menu> findByPage(int page, int limit) {
		
		return null;
	}

	public String toPage() {
		
		return null;
	}

	
	
	
	
	
}
