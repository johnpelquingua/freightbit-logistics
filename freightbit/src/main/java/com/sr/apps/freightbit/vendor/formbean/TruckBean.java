package com.sr.apps.freightbit.vendor.formbean;

public class TruckBean {

    private String truckId;
    private String vendorId;
    private Integer clientId;
    private String truckCode;
    private String truckType;
    private String truckPlateNumber;
    private String truckModelNumber;
    private Integer truckModelYear;
    private String truckEngineNumber;
    private Integer truckGrossWeight;

    public TruckBean() {
    }

    public TruckBean(String truckId, String vendorId, Integer clientId,
                     String truckCode, String truckType, String truckPlateNumber,
                     String truckModelNumber, Integer truckModelYear, String truckEngineNumber,
                     Integer truckGrossWeight) {
        this.truckId = truckId;
        this.vendorId = vendorId;
        this.clientId = clientId;
        this.truckCode = truckCode;
        this.truckType = truckType;
        this.truckPlateNumber = truckPlateNumber;
        this.truckModelNumber = truckModelNumber;
        this.truckModelYear = truckModelYear;
        this.truckEngineNumber = truckEngineNumber;
        this.truckGrossWeight = truckGrossWeight;
    }

    public String getTruckId() {
        return truckId;
    }

    public void setTruckId(String truckId) {
        this.truckId = truckId;
    }

    public String getVendorId() {
        return vendorId;
    }

    public void setVendorId(String vendorId) {
        this.vendorId = vendorId;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
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

    public String getTruckPlateNumber() {
        return truckPlateNumber;
    }

    public void setTruckPlateNumber(String truckPlateNumber) {
        this.truckPlateNumber = truckPlateNumber;
    }

    public String getTruckModelNumber() {
        return truckModelNumber;
    }

    public void setTruckModelNumber(String truckModelNumber) {
        this.truckModelNumber = truckModelNumber;
    }

    public Integer getTruckModelYear() {
        return truckModelYear;
    }

    public void setTruckModelYear(Integer truckModelYear) {
        this.truckModelYear = truckModelYear;
    }

    public String getTruckEngineNumber() {
        return truckEngineNumber;
    }

    public void setTruckEngineNumber(String truckEngineNumber) {
        this.truckEngineNumber = truckEngineNumber;
    }

    public Integer getTruckGrossWeight() {
        return truckGrossWeight;
    }

    public void setTruckGrossWeight(Integer truckGrossWeight) {
        this.truckGrossWeight = truckGrossWeight;
    }
}
