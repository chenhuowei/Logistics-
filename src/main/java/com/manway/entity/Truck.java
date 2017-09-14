package com.manway.entity;

public class Truck {
    /**
     * 
     */
	private String truckId;
    private String id;

    /**
     * 
     */
    private String truckType;

    /**
     * 
     */
    private String truckPlateNumber;

    /**
     * 
     */
    private String driverId;

    /**
     * 
     */
    private String driverName;

    /**
     * 
     */
    private String driverNumber;

    /**
     * 
     */
    private String driverMobile;

    /**
     * 
     */
    private String truckLocation;

    /**
     * 
     */
    private String truckState;

    /**
     * 
     */
    private Boolean isWorking;

    /**
     * 
     */
    private Boolean state;

    /**
     * 
     */
    private String remark;

    /**
     * 
     */
    
    
    private Boolean isTemporary;

    public String getTruckId() {
		return truckId;
	}

	public void setTruckId(String truckId) {
		this.truckId = truckId;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTruckType() {
        return truckType;
    }

    public void setTruckType(String truckType) {
        this.truckType = truckType;
    }

    public String getTruckPlateNumber() {
        return truckPlateNumber;
    }

    public void setTruckPlateNumber(String truckPlateNumber) {
        this.truckPlateNumber = truckPlateNumber;
    }

    public String getDriverId() {
        return driverId;
    }

    public void setDriverId(String driverId) {
        this.driverId = driverId;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public String getDriverNumber() {
        return driverNumber;
    }

    public void setDriverNumber(String driverNumber) {
        this.driverNumber = driverNumber;
    }

    public String getDriverMobile() {
        return driverMobile;
    }

    public void setDriverMobile(String driverMobile) {
        this.driverMobile = driverMobile;
    }

    public String getTruckLocation() {
        return truckLocation;
    }

    public void setTruckLocation(String truckLocation) {
        this.truckLocation = truckLocation;
    }

    public String getTruckState() {
        return truckState;
    }

    public void setTruckState(String truckState) {
        this.truckState = truckState;
    }

    public Boolean getIsWorking() {
        return isWorking;
    }

    public void setIsWorking(Boolean isWorking) {
        this.isWorking = isWorking;
    }

    public Boolean getState() {
        return state;
    }

    public void setState(Boolean state) {
        this.state = state;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Boolean getIsTemporary() {
        return isTemporary;
    }

    public void setIsTemporary(Boolean isTemporary) {
        this.isTemporary = isTemporary;
    }
}