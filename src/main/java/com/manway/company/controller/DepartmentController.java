package com.manway.company.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manway.base.BaseController;
import com.manway.entity.Department;
import com.manway.service.DepartmentService;
import com.manway.utils.DateUtil;
import com.manway.utils.JsonUtil;
import com.manway.utils.StringUtil;

@Controller
@RequestMapping("/department")
public class DepartmentController implements BaseController<Department> {

	@Resource
	private DepartmentService departmentService;
	
	@RequestMapping("/departmentPage.do")
	public String toPage() {
		
		return "company/departmentPage";
	}

	@ResponseBody
	@RequestMapping(value="/save.do",method=RequestMethod.POST)
	public Object save(Department record) {
		try {
			record.setId(StringUtil.uuid());
			departmentService.save(record);
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
					departmentService.deleteById(id);
				}
				return JsonUtil.delete(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.delete(false);
	}

	@ResponseBody
	@RequestMapping(value="/udpate.do",method=RequestMethod.POST)
	public Object updateSelectById(Department record) {
		try {
			record.setUpdateTime(DateUtil.formatDate(null, new Date()));
			departmentService.updateSelectById(record);
			return JsonUtil.update(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.update(false);
	}

	@ResponseBody
	@RequestMapping(value="/findById.do",method=RequestMethod.GET)
	public Object findById(String id) {
		
		return departmentService.findById(id);
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/findByPage.do",method=RequestMethod.GET)
	public Object findByPage(int page,int rows) {
		
		return departmentService.findByPage(page, rows);
	}
	
	
	
	
	
	

}
