package com.manway.dao;

import com.manway.entity.User;
import com.manway.queryParam.UserQueryParam;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {
	int deleteByPrimaryKey(String id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByPage(UserQueryParam param);
    List<Map<String, String>> findAsCombobox();

    User selectByPrimaryKey(String id);

    int employeeNumberRepeat(@Param("employeeNumber")String employeeNumber);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> findUserByNumberPassword(@Param("username")String username,
    		@Param("password")String password);
}