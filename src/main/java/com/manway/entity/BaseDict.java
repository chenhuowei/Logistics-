package com.manway.entity;

public class BaseDict {
    /**
     * 
     */
    private String id;

    /**
     * 
     */
    private String type;

    /**
     * 
     */
    private String name;

    /**
     * 
     */
    private String value;

    /**
     * 
     */
    private String remark;

    /**
     * 
     */
    private Boolean state;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Boolean getState() {
        return state;
    }

    public void setState(Boolean state) {
        this.state = state;
    }
}