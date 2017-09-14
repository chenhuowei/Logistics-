package com.manway.entity;

public class OrderTrack {
    /**
     * 
     */
    private String id;

    /**
     * 出发点
     */
    private String location;

    /**
     * 目的地
     */
    private String destination;

    /**
     * 操作员
     */
    private String operator;

    /**
     * 
     */
    private String operatorNumber;

    /**
     * 
     */
    private String operatorMobile;

    /**
     * 操作类型：出库、入库，配送
     */
    private String operatorType;

    /**
     * 
     */
    private String operatorId;

    /**
     * 
     */
    private String operateTime;

    /**
     * 
     */
    private String orderUpdateTime;

    /**
     * 入库时间
     */
    private String orderInTime;

    /**
     * 
     */
    private String orderOutTime;

    /**
     * 
     */
    private String truckId;

    /**
     * 
     */
    private String truckPlateNumber;

    /**
     * 
     */
    private String driverMobile;

    /**
     * 
     */
    private String driverName;

    /**
     * 
     */
    private String orderFormId;

    /**
     * 
     */
    private String remark;

    /**
     * 
     */
    private String storeName;

    /**
     * 
     */
    private String storeId;

    /**
     * 运输状态
     */
    private Boolean trackState;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getOperatorNumber() {
        return operatorNumber;
    }

    public void setOperatorNumber(String operatorNumber) {
        this.operatorNumber = operatorNumber;
    }

    public String getOperatorMobile() {
        return operatorMobile;
    }

    public void setOperatorMobile(String operatorMobile) {
        this.operatorMobile = operatorMobile;
    }

    public String getOperatorType() {
        return operatorType;
    }

    public void setOperatorType(String operatorType) {
        this.operatorType = operatorType;
    }

    public String getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId;
    }

    public String getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(String operateTime) {
        this.operateTime = operateTime;
    }

    public String getOrderUpdateTime() {
        return orderUpdateTime;
    }

    public void setOrderUpdateTime(String orderUpdateTime) {
        this.orderUpdateTime = orderUpdateTime;
    }

    public String getOrderInTime() {
        return orderInTime;
    }

    public void setOrderInTime(String orderInTime) {
        this.orderInTime = orderInTime;
    }

    public String getOrderOutTime() {
        return orderOutTime;
    }

    public void setOrderOutTime(String orderOutTime) {
        this.orderOutTime = orderOutTime;
    }

    public String getTruckId() {
        return truckId;
    }

    public void setTruckId(String truckId) {
        this.truckId = truckId;
    }

    public String getTruckPlateNumber() {
        return truckPlateNumber;
    }

    public void setTruckPlateNumber(String truckPlateNumber) {
        this.truckPlateNumber = truckPlateNumber;
    }

    public String getDriverMobile() {
        return driverMobile;
    }

    public void setDriverMobile(String driverMobile) {
        this.driverMobile = driverMobile;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public String getOrderFormId() {
        return orderFormId;
    }

    public void setOrderFormId(String orderFormId) {
        this.orderFormId = orderFormId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getStoreId() {
        return storeId;
    }

    public void setStoreId(String storeId) {
        this.storeId = storeId;
    }

    public Boolean getTrackState() {
        return trackState;
    }

    public void setTrackState(Boolean trackState) {
        this.trackState = trackState;
    }
}