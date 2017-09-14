package com.manway.entity;

import java.util.ArrayList;
import java.util.List;

public class Menu {
   
	
	
	private List<Menu> children = new ArrayList<Menu>(0);
	
	
	
    public List<Menu> getChildren() {
		return children;
	}

	public void setChildren(List<Menu> children) {
		this.children = children;
	}

	private String id;

    /**
     * 
     */
    private String remark;

    /**
     * 
     */
    private String text;

    /**
     * 
     */
    private String url;

    /**
     * 
     */
    private String iconCls;

    /**
     * 
     */
    private String pid;

    /**
     * 
     */
    private Boolean leaf;

    /**
     * 
     */
    private String state;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public Boolean getLeaf() {
        return leaf;
    }

    public void setLeaf(Boolean leaf) {
        this.leaf = leaf;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}