package com.manway.user.controller;


import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manway.base.BaseController;
import com.manway.entity.User;
import com.manway.queryParam.UserQueryParam;
import com.manway.service.UserService;
import com.manway.utils.DateUtil;
import com.manway.utils.EncryptUtil;
import com.manway.utils.JsonUtil;
import com.manway.utils.StringUtil;

@Controller
@RequestMapping("/user")
public class UserController implements BaseController<User> {

	@Resource
	private UserService userService;
	
	@RequestMapping("/userPage.do")
	public String toPage() {
		
		return "user/userPage";
	}
	
	@RequestMapping("/personnalPage.do")
	public String personnalPage() {
		
		return "user/personnalPage";
	}
	
	@RequestMapping("/passwordPage.do")
	public String passwordPage() {
		
		return "user/passwordPage";
	}

	@ResponseBody
	@RequestMapping(value="/save.do",method=RequestMethod.POST)
	public Object save(User record) {
		
		try {
			record.setId(StringUtil.uuid());
			record.setAge(DateUtil.birthToAge(record.getBirth()));
			if (null != record.getPassword()){
				record.setPassword(EncryptUtil.md5Encode(record.getPassword()));
			}
			
			userService.save(record);
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
					
					userService.deleteById(id);
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
	public Object updateSelectById(User record) {
		try {
			record.setAge(DateUtil.birthToAge(record.getBirth()));
			if (null != record.getPassword()){
				record.setPassword(EncryptUtil.md5Encode(record.getPassword()));
			}
			record.setUpdateTime(DateUtil.formatDate(null, new Date()));
			userService.updateSelectById(record);
			return JsonUtil.update(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.update(false);
	}
	
	@ResponseBody
	@RequestMapping(value="/updatePassword.do",method=RequestMethod.POST)
	public Object updatePassword(String userId,String oldPassword,String newPassword) {
		try {
			User record = userService.findById(userId);
			if (record.getPassword().equals(EncryptUtil.md5Encode(oldPassword))){
				record.setPassword(EncryptUtil.md5Encode(newPassword));
				record.setUpdateTime(DateUtil.formatDate(null, new Date()));
				userService.updateSelectById(record);
				return JsonUtil.update(true);
			}else {
				return JsonUtil.messageJson(false, "原密码不匹配");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JsonUtil.update(false);
	}

	@ResponseBody
	@RequestMapping(value="/findById.do",method=RequestMethod.GET)
	public Object findById(String id) {
		
		return userService.findById(id);
	}

	
	@ResponseBody
	@RequestMapping(value="/findByPage.do",method=RequestMethod.GET)
	public Object findByPage(int page, int rows,UserQueryParam param) {
		
		return userService.findByPage(page, rows,param);
	}

	@ResponseBody
	@RequestMapping(value="/employeeNumberRepeat.do",method=RequestMethod.GET)
	public Object employeeNumberCheck(String employeeNumber){
		
		return userService.employeeNumberRepeat(employeeNumber);
	}

	
	@ResponseBody
	@RequestMapping(value="/findAsCombobox.do",method=RequestMethod.GET)
	public Object findAsCombobox(){
		
		return userService.findAsCombobox();
	}
	
	
	
	
	
}
