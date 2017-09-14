package com.manway.company.controller;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manway.base.BaseController;
import com.manway.entity.Job;
import com.manway.service.JobService;
import com.manway.utils.DateUtil;
import com.manway.utils.JsonUtil;
import com.manway.utils.StringUtil;

@Controller
@RequestMapping("/job")
public class JobController implements BaseController<Job> {

	@Resource
	private JobService jobService;
	
	@RequestMapping("/jobPage.do")
	public String toPage() {
		
		return "company/jobPage";
	}

	@ResponseBody
	@RequestMapping(value="/save.do",method=RequestMethod.POST)
	public Object save(Job record) {
		try {
			record.setId(StringUtil.uuid());
			jobService.save(record);
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
					jobService.deleteById(id);
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
	public Object updateSelectById(Job record) {
		try {
			record.setUpdateTime(DateUtil.formatDate(null, new Date()));
			jobService.updateSelectById(record);
			return JsonUtil.update(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.update(false);
	}

	@ResponseBody
	@RequestMapping(value="/findById.do",method=RequestMethod.GET)
	public Object findById(String id) {
		
		return jobService.findById(id);
	}
	
	@ResponseBody
	@RequestMapping(value="/findByPage.do",method=RequestMethod.GET)
	public Object findByPage(int page,int rows){
		
		return jobService.findByPage(page, rows);
	}
	
	@ResponseBody
	@RequestMapping(value="/findAsCombobox.do",method=RequestMethod.GET)
	public Object findAsCombobox(){
		
		return jobService.findAsCombobox();
	}

}
