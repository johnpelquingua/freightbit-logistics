package com.sr.apps.freightbit.vendor.formbean;

public class VesselBean {

    private Integer vendorId;
    private String vesselNumber;
    private String vesselName;
    private String modelNumber;
    private Integer modelYear;
    private Integer vesselId;

    public VesselBean(){}

    public VesselBean(Integer vendorId, String vesselNumber, String vesselName, String modelNumber, Integer modelYear, Integer vesselId) {
        this.vendorId = vendorId;
        this.vesselNumber = vesselNumber;
        this.vesselName = vesselName;
        this.modelNumber = modelNumber;
        this.modelYear = modelYear;
        this.vesselId = vesselId;
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
}