package com.sr.apps.freightbit.vendor.formbean;

import java.util.Date;

public class TruckBean {

    private Integer truckId;
    private String truckCode;
    private String truckType;
    private String plateNumber;
    private String modelNumber;
    private Integer modelYear;
    private String engineNumber;
    private Integer grossWeight;
    private Integer vendorId;
    private Date createdTimeStamp;
    private String createdBy;
    private Date modifiedTimeStamp;
    private String modifiedBy;
    private String motorVehicleNumber;
    private Date issueDate;
    private Integer netWeight;
    private Integer netCapacity;
    private String ownerName;
    private String ownerAddress;
    private String officialReceipt;

    public TruckBean() {
    }

    public TruckBean(Integer vendorId, Integer truckId, String truckCode, String truckType, String plateNumber, String modelNumber, Integer modelYear, String engineNumber, Integer grossWeight, Date createdTimeStamp, String createdBy, Date modifiedTimeStamp, String modifiedBy, String motorVehicleNumber, Date issueDate, Integer netWeight, Integer netCapacity, String ownerName, String ownerAddress, String officialReceipt) {
        this.vendorId = vendorId;
        this.truckId = truckId;
        this.truckCode = truckCode;
        this.truckType = truckType;
        this.plateNumber = plateNumber;
        this.modelNumber = modelNumber;
        this.modelYear = modelYear;
        this.engineNumber = engineNumber;
        this.grossWeight = grossWeight;
        this.createdTimeStamp = createdTimeStamp;
        this.createdBy = createdBy;
        this.modifiedTimeStamp = modifiedTimeStamp;
        this.modifiedBy = modifiedBy;
        this.motorVehicleNumber = motorVehicleNumber;
        this.issueDate = issueDate;
        this.netWeight = netWeight;
        this.netCapacity = netCapacity;
        this.ownerName = ownerName;
        this.ownerAddress = ownerAddress;
        this.officialReceipt = officialReceipt;
    }

    public Integer getTruckId() {
        return truckId;
    }

    public void setTruckId(Integer truckId) {
        this.truckId = truckId;
    }

    public String getTruckCode() {
        return truckCode;
    }

    public void setTruckCode(String truckCode) {
        this.truckCode = truckCode;
    }

    public String getTruckType() {
        return truckType;
    }

    public void setTruckType(String truckType) {
        this.truckType = truckType;
    }

    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    public String getModelNumber() {
        return modelNumber;
    }

    public void setModelNumber(String modelNumber) {
        this.modelNumber = modelNumber;
    }

    public Integer getModelYear() {
        return modelYear;
    }

    public void setModelYear(Integer modelYear) {
        this.modelYear = modelYear;
    }

    public String getEngineNumber() {
        return engineNumber;
    }

    public void setEngineNumber(String engineNumber) {
        this.engineNumber = engineNumber;
    }

    public Integer getGrossWeight() {
        return grossWeight;
    }

    public void setGrossWeight(Integer grossWeight) {
        this.grossWeight = grossWeight;
    }

    public Integer getVendorId() {
        return vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }

    public Date getCreatedTimeStamp() {
        return createdTimeStamp;
    }

    public void setCreatedTimeStamp(Date createdTimeStamp) {
        this.createdTimeStamp = createdTimeStamp;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getModifiedTimeStamp() {
        return modifiedTimeStamp;
    }

    public void setModifiedTimeStamp(Date modifiedTimeStamp) {
        this.modifiedTimeStamp = modifiedTimeStamp;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public String getMotorVehicleNumber() {
        return motorVehicleNumber;
    }

    public void setMotorVehicleNumber(String motorVehicleNumber) {
        this.motorVehicleNumber = motorVehicleNumber;
    }

    public Date getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }

    public Integer getNetWeight() {
        return netWeight;
    }

    public void setNetWeight(Integer netWeight) {
        this.netWeight = netWeight;
    }

    public Integer getNetCapacity() {
        return netCapacity;
    }

    public void setNetCapacity(Integer netCapacity) {
        this.netCapacity = netCapacity;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getOwnerAddress() {
        return ownerAddress;
    }

    public void setOwnerAddress(String ownerAddress) {
        this.ownerAddress = ownerAddress;
    }

    public String getOfficialReceipt() {
        return officialReceipt;
    }

    public void setOfficialReceipt(String officialReceipt) {
        this.officialReceipt = officialReceipt;
    }
}
