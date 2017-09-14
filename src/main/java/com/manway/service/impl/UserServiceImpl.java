package com.manway.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manway.dao.UserMapper;
import com.manway.entity.User;
import com.manway.queryParam.UserQueryParam;
import com.manway.service.UserService;
import com.manway.utils.PageUtil;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;
	
	public void save(User record) {
		userMapper.insert(record);
	}

	public void saveSelect(User record) {
		userMapper.insertSelective(record);
	}

	public void deleteById(String id) {
		userMapper.deleteByPrimaryKey(id);
	}

	public void updateById(User record) {
		userMapper.updateByPrimaryKey(record);
	}

	public void updateSelectById(User record) {
		userMapper.updateByPrimaryKeySelective(record);
	}

	public User findById(String id) {

		return userMapper.selectByPrimaryKey(id);
	}

	public List<User> findAll() {

		return null;
	}

	public PageUtil findByPage(int page, int limit,UserQueryParam param) {

		PageHelper.startPage(page, limit, true);
		PageInfo<User> pageInfo = new PageInfo<User>(userMapper.selectByPage(param));
		return new PageUtil(pageInfo.getTotal(), pageInfo.getList());
	}

	public boolean employeeNumberRepeat(String employeeNumber) {
		if (userMapper.employeeNumberRepeat(employeeNumber) == 0){
			return false;
		}
		return true;
	}

	public List<Map<String, String>> findAsCombobox() {
		
		return userMapper.findAsCombobox();
	}

	public User findUserByNumberPassword(String username, String password) {
		List<User> users = userMapper.findUserByNumberPassword(username, password);
		if (null != users && users.size() > 0){
			return users.get(0);
		}
		
		return null;
	}

}
