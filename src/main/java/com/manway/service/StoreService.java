/**
@date 2016年11月21日下午9:30:21
@author chenhuowei
@copyright manway


*/
package com.manway.service;

import com.manway.base.BaseService;
import com.manway.entity.Store;
import com.manway.utils.PageUtil;

public interface StoreService extends BaseService<Store> {

	PageUtil findByPage(int page,int rows);
}
