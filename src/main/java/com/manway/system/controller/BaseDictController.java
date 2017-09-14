package com.manway.system.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manway.base.BaseController;
import com.manway.entity.BaseDict;
import com.manway.service.BaseDictService;
import com.manway.utils.JsonUtil;
import com.manway.utils.StringUtil;

@Controller
@RequestMapping("/baseDict")
public class BaseDictController implements BaseController<BaseDict> {

	@Resource
	private BaseDictService baseDictService;
	
	@RequestMapping("/baseDictPage.do")
	public String toPage() {
		
		return "system/baseDictPage";
	}

	@ResponseBody
	@RequestMapping(value="/save.do",method=RequestMethod.POST)
	public Object save(BaseDict record) {
		try {
			record.setId(StringUtil.uuid());
			baseDictService.save(record);
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
				for(String id :ids.split(",")){
					baseDictService.deleteById(id);
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
	public Object updateSelectById(BaseDict record) {
		try {
			baseDictService.updateSelectById(record);
			return JsonUtil.update(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.update(false);
	}

	@ResponseBody
	@RequestMapping(value="/findById.do",method=RequestMethod.GET)
	public Object findById(String id) {
		
		return baseDictService.findById(id);
	}
	
	@ResponseBody
	@RequestMapping(value="/findByPage.do",method=RequestMethod.GET)
	public Object findByPage(int page,int rows) {
		
		return baseDictService.findByPage(page, rows);
	}
	
	@ResponseBody
	@RequestMapping(value="/findType.do",method=RequestMethod.GET)
	public Object selectType(){
		
		return baseDictService.findType();
	}
	
	@ResponseBody
	@RequestMapping(value="/findByType.do",method=RequestMethod.GET)
	public Object findByType(String type){
		
		return baseDictService.findByType(type);
	}
	
	
	
	
	
	

}
