package com.sr.apps.freightbit.vendor.formbean;

import java.util.Date;

public class VesselBean {

    private Integer vendorId;
    private String vesselNumber;
    private String vesselName;
    private String modelNumber;
    private Integer modelYear;
    private Integer vesselId;
    private Date createdTimeStamp;
    private String createdBy;
    private Date modifiedTimeStamp;
    private String modifiedBy;
    private String vesselType;

    public VesselBean() {
    }

    public VesselBean(String vesselType, Integer vendorId, String vesselNumber, String vesselName, String modelNumber, Integer modelYear, Integer vesselId, Date createdTimeStamp, String createdBy, Date modifiedTimeStamp, String modifiedBy) {
        this.vesselType = vesselType;
        this.vendorId = vendorId;
        this.vesselNumber = vesselNumber;
        this.vesselName = vesselName;
        this.modelNumber = modelNumber;
        this.modelYear = modelYear;
        this.vesselId = vesselId;
        this.createdTimeStamp = createdTimeStamp;
        this.createdBy = createdBy;
        this.modifiedTimeStamp = modifiedTimeStamp;
        this.modifiedBy = modifiedBy;
    }

    public Integer getVendorId() {
        return vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }

    public String getVesselNumber() {
        return vesselNumber;
    }

    public void setVesselNumber(String vesselNumber) {
        this.vesselNumber = vesselNumber;
    }

    public String getVesselName() {
        return vesselName;
    }

    public void setVesselName(String vesselName) {
        this.vesselName = vesselName;
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

    public Integer getVesselId() {
        return vesselId;
    }

    public void setVesselId(Integer vesselId) {
        this.vesselId = vesselId;
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

    public String getVesselType() {
        return vesselType;
    }

    public void setVesselType(String vesselType) {
        this.vesselType = vesselType;
    }
}