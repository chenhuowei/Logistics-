package com.manway.company.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manway.base.BaseController;
import com.manway.entity.Company;
import com.manway.service.CompanyService;
import com.manway.utils.JsonUtil;
import com.manway.utils.StringUtil;

@Controller
@RequestMapping("/company")
public class CompanyController implements BaseController<Company> {

	@Resource
	private CompanyService companyService;
	
	@RequestMapping("/companyPage.do")
	public String toPage() {
		
		return "company/companyPage";
	}

	@ResponseBody
	@RequestMapping(value="/save.do",method=RequestMethod.POST)
	public Object save(Company record) {
		try {
			record.setId(StringUtil.uuid());
			companyService.save(record);
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
					companyService.deleteById(id);
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
	public Object updateSelectById(Company record) {
		try {
			companyService.updateSelectById(record);
			return JsonUtil.update(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.update(false);
	}

	@ResponseBody
	@RequestMapping(value="/findById.do",method=RequestMethod.GET)
	public Object findById(String id) {
		
		return companyService.findById(id);
	}

	@ResponseBody
	@RequestMapping("/findAll.do")
	public Object findAll(){
		
		return companyService.findAll();
	}
	
	@ResponseBody
	@RequestMapping("/findByPage.do")
	public Object findAll(int page,int rows){
		
		return companyService.findByPage(page, rows);
	}
	
	@ResponseBody
	@RequestMapping("/findAsMenu.do")
	public Object findAsMenu(){
		
		return companyService.findAsMenu();
	}
	
	
	
}
