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

    public TruckBean() {
    }

    public TruckBean(Integer truckId, String truckCode, String truckType, String plateNumber, String modelNumber, Integer modelYear, String engineNumber, Integer grossWeight, Integer vendorId, Date createdTimeStamp, String createdBy, Date modifiedTimeStamp, String modifiedBy) {
        this.truckId = truckId;
        this.truckCode = truckCode;
        this.truckType = truckType;
        this.plateNumber = plateNumber;
        this.modelNumber = modelNumber;
        this.modelYear = modelYear;
        this.engineNumber = engineNumber;
        this.grossWeight = grossWeight;
        this.vendorId = vendorId;
        this.createdTimeStamp = createdTimeStamp;
        this.createdBy = createdBy;
        this.modifiedTimeStamp = modifiedTimeStamp;
        this.modifiedBy = modifiedBy;
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
}
