/**
@date 2016年11月20日上午9:36:39
@author chenhuowei
@copyright manway


*/
package com.manway.utils;

import java.util.List;

public class PageUtil {

	private long total;
	@SuppressWarnings("rawtypes")
	private List rows;
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	@SuppressWarnings("rawtypes")
	public List getRows() {
		return rows;
	}
	public void setRows(@SuppressWarnings("rawtypes") List rows) {
		this.rows = rows;
	}
	public PageUtil() {
		super();
		
	}
	@SuppressWarnings("rawtypes")
	public PageUtil(long total, List rows) {
		super();
		this.total = total;
		this.rows = rows;
	}
	
	
	
	
}
