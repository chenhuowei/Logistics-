package com.manway.service;


import java.util.List;
import java.util.Map;

import com.manway.base.BaseService;
import com.manway.entity.User;
import com.manway.queryParam.UserQueryParam;
import com.manway.utils.PageUtil;

public interface UserService extends BaseService<User> {

	public boolean employeeNumberRepeat(String employeeNumber);
	PageUtil findByPage(int page, int rows,UserQueryParam param);
	
	List<Map<String, String>> findAsCombobox();
	
	User findUserByNumberPassword(String username,String password);
	
}
