package com.manway.login.controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.manway.entity.User;
import com.manway.service.CompanyService;
import com.manway.service.JobService;
import com.manway.service.UserService;
import com.manway.utils.ConstantUtil;
import com.manway.utils.EncryptUtil;
import com.manway.utils.StringUtil;

@Controller
@RequestMapping("/base")
public class LoginController {

	@Resource
	private UserService userService;
	@Resource
	private CompanyService companyService;
	@Resource
	private JobService jobService;
	
	@RequestMapping("/loginPage.do")
	public String toLogin(){
		
		return "home/login";
	}
	
	@RequestMapping("/login.do")
	public String login(String username,String password,@RequestParam(required=false)Boolean rememberMe,
			HttpServletRequest request,HttpServletResponse response){
		try {
			if (StringUtil.isNotBlank(username) && StringUtil.isNotBlank(password)){
				User user = userService.
						findUserByNumberPassword(username, EncryptUtil.md5Encode(password));
				if (null != user ){
					request.getSession().setAttribute(ConstantUtil.USER, user);
					request.getSession().setAttribute(ConstantUtil.COMPANY, 
							companyService.findById(user.getCompanyId()));
					request.getSession().setAttribute(ConstantUtil.JOB,
							jobService.findById(user.getJobId()));
					request.setAttribute(ConstantUtil.LOGIN_STATE, 
							user.getName()+",登录成功！");
					if (rememberMe){
						Cookie cookie1 = new Cookie("username", user.getEmployeeNumber());
						Cookie cookie2 = new Cookie("password", user.getPassword2());
						cookie1.setMaxAge(60 * 60 * 24 * 3);
						cookie2.setMaxAge(60 * 60 * 24 * 3);
						response.addCookie(cookie1);
						response.addCookie(cookie2);
					}
					return "home/home";
				}else{
					
					request.setAttribute(ConstantUtil.LOGIN_STATE, "用户名或用户密码有误！！！");
					return "home/login";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute(ConstantUtil.LOGIN_STATE, "服务器出错，请稍后再试！！！");
		return "home/login";
	}
	
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		if (null != session.getAttribute("USER")){
			session.invalidate();
			request.setAttribute(ConstantUtil.LOGIN_STATE, "退出登录成功！！！");
		}
		request.setAttribute(ConstantUtil.LOGIN_STATE, "退出登录异常！！！");
		return "redirect:/base/loginPage.do";
	}
	
}
