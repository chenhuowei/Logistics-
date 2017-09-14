package com.manway.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.manway.dao.MenuMapper;
import com.manway.entity.Menu;
import com.manway.service.MenuService;
import com.manway.utils.StringUtil;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

	@Resource
	private MenuMapper menuMapper;
	
	
	public void save(Menu record) {
		menuMapper.insert(record);
	}

	public void saveSelect(Menu record) {
		menuMapper.insertSelective(record);
	}

	public void deleteById(String id) {
		menuMapper.deleteByPrimaryKey(id);
	}

	public void updateById(Menu record) {
		menuMapper.updateByPrimaryKey(record);
	}

	public void updateSelectById(Menu record) {
		menuMapper.updateByPrimaryKeySelective(record);
	}

	public Menu findById(String id) {
		
		return menuMapper.selectByPrimaryKey(id);
	}

	public List<Menu> findAll() {
		
		List<Menu> menus = new ArrayList<Menu>();
		List<Menu> data = menuMapper.selectAll();
		
		for(Menu menu : data){
			if(StringUtil.isNotBlank(menu.getPid())){
				for(Menu p : data){
					if (p.getId().equals(menu.getPid()) ){
						p.getChildren().add(menu);
					}
				}
			}else {
				menus.add(menu);
			}
		}
		
		
		return menus;
	}

	public List<Menu> findByPage(int page, int limit) {
		
		return null;
	}

}
