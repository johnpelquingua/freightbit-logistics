package com.sr.apps.freightbit.operations.formbean;

import java.util.Date;

/**
 * Created by Clarence C. Victoria on 11/4/2014.
 */
public class ContainerBean {

    private Integer containerId;
    private String eirNumber;
    private Date dateTime;
    private String shipping;
    private String trucking;
    private String plateNumber;
    private String vanNumber;
    private String driver;
    private String orderNumber;
    private String remarks;
    private String vanTo;
    private String vanFrom;
    private String createdBy;
    private Date createdTimestamp;
    private String modifiedBy;
    private Date modifiedTimestamp;
    private String containerNumber;
    private String containerSize;

    public Integer getContainerId() {
        return containerId;
    }

    public void setContainerId(Integer containerId) {
        this.containerId = containerId;
    }

    public String getEirNumber() {
        return eirNumber;
    }

    public void setEirNumber(String eirNumber) {
        this.eirNumber = eirNumber;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public String getShipping() {
        return shipping;
    }

    public void setShipping(String shipping) {
        this.shipping = shipping;
    }

    public String getTrucking() {
        return trucking;
    }

    public void setTrucking(String trucking) {
        this.trucking = trucking;
    }

    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    public String getVanNumber() {
        return vanNumber;
    }

    public void setVanNumber(String vanNumber) {
        this.vanNumber = vanNumber;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getVanTo() {
        return vanTo;
    }

    public void setVanTo(String vanTo) {
        this.vanTo = vanTo;
    }

    public String getVanFrom() {
        return vanFrom;
    }

    public void setVanFrom(String vanFrom) {
        this.vanFrom = vanFrom;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public Date getModifiedTimestamp() {
        return modifiedTimestamp;
    }

    public void setModifiedTimestamp(Date modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }

    public String getContainerNumber() {
        return containerNumber;
    }

    public void setContainerNumber(String containerNumber) {
        this.containerNumber = containerNumber;
    }

    public String getContainerSize() {
        return containerSize;
    }

    public void setContainerSize(String containerSize) {
        this.containerSize = containerSize;
    }
}
