package com.sr.apps.freightbit.operations.formbean;

import java.util.Date;

public class VesselScheduleBean {

    private Integer vesselScheduleId;
    private String voyageNumber;
    private Integer clientId;
    private Integer vendorId;
    private String originPort;
    private String departureDate;
    private String departureTime;
    private String destinationPort;
    private String arrivalDate;
    private String arrivalTime;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;
    private String vesselScheduleKeyword;
    private String vesselScheduleCriteria;
    private String vendorCode;
    private String vesselName;
    private String vendorName;
    private String vendorClass;
    private String ordersLCL;

    public VesselScheduleBean() {

    }

    public VesselScheduleBean(String departureDate, Integer vesselScheduleId, String voyageNumber, Integer clientId, Integer vendorId, String originPort, String departureTime, String destinationPort, String arrivalDate, String arrivalTime, Date createdTimestamp, String createdBy, Date modifiedTimestamp, String modifiedBy, String vesselScheduleKeyword, String vesselScheduleCriteria, String vendorCode, String vesselName, String vendorName, String vendorClass, String ordersLCL) {
        this.departureDate = departureDate;
        this.vesselScheduleId = vesselScheduleId;
        this.voyageNumber = voyageNumber;
        this.clientId = clientId;
        this.vendorId = vendorId;
        this.originPort = originPort;
        this.departureTime = departureTime;
        this.destinationPort = destinationPort;
        this.arrivalDate = arrivalDate;
        this.arrivalTime = arrivalTime;
        this.createdTimestamp = createdTimestamp;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedBy = modifiedBy;
        this.vesselScheduleKeyword = vesselScheduleKeyword;
        this.vesselScheduleCriteria = vesselScheduleCriteria;
        this.vendorCode = vendorCode;
        this.vesselName = vesselName;
        this.vendorName = vendorName;
        this.vendorClass = vendorClass;
        this.ordersLCL = ordersLCL;
    }

    public String getVendorCode() {
        return vendorCode;
    }

    public void setVendorCode(String vendorCode) {
        this.vendorCode = vendorCode;
    }

    public Integer getVesselScheduleId() {
        return vesselScheduleId;
    }

    public void setVesselScheduleId(Integer vesselScheduleId) {
        this.vesselScheduleId = vesselScheduleId;
    }

    public String getVoyageNumber() {
        return voyageNumber;
    }

    public void setVoyageNumber(String voyageNumber) {
        this.voyageNumber = voyageNumber;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public Integer getVendorId() {
        return vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }

    public String getOriginPort() {
        return originPort;
    }

    public void setOriginPort(String originPort) {
        this.originPort = originPort;
    }

    public String getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(String departureDate) {
        this.departureDate = departureDate;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getDestinationPort() {
        return destinationPort;
    }

    public void setDestinationPort(String destinationPort) {
        this.destinationPort = destinationPort;
    }

    public String getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(String arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public Date getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getModifiedTimestamp() {
        return modifiedTimestamp;
    }

    public void setModifiedTimestamp(Date modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public String getVesselScheduleKeyword() {
        return vesselScheduleKeyword;
    }

    public void setVesselScheduleKeyword(String vesselScheduleKeyword) {
        this.vesselScheduleKeyword = vesselScheduleKeyword;
    }

    public String getVesselScheduleCriteria() {
        return vesselScheduleCriteria;
    }

    public void setVesselScheduleCriteria(String vesselScheduleCriteria) {
        this.vesselScheduleCriteria = vesselScheduleCriteria;
    }

    public String getVesselName() {
        return vesselName;
    }

    public void setVesselName(String vesselName) {
        this.vesselName = vesselName;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public String getVendorClass() {
        return vendorClass;
    }

    public void setVendorClass(String vendorClass) {
        this.vendorClass = vendorClass;
    }

    public String getOrdersLCL() {
        return ordersLCL;
    }

    public void setOrdersLCL(String ordersLCL) {
        this.ordersLCL = ordersLCL;
    }
}
