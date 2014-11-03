package com.sr.biz.freightbit.operations.entity;

/**
 * Created by Clarence C. Victoria on 11/3/2014.
 */

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import java.util.Date;

@Entity
@Table(name = "container", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "containerId"))

public class Container {

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
    private String createdTimestamp;
    private String modifiedBy;
    private String modifiedTimestamp;

    public Container() {
    }

    public Container(Integer containerId, String eirNumber, Date dateTime, String shipping, String trucking, String plateNumber, String vanNumber, String driver, String orderNumber, String remarks, String vanTo, String vanFrom, String createdBy, String createdTimestamp, String modifiedBy, String modifiedTimestamp) {
        this.containerId = containerId;
        this.eirNumber = eirNumber;
        this.dateTime = dateTime;
        this.shipping = shipping;
        this.trucking = trucking;
        this.plateNumber = plateNumber;
        this.vanNumber = vanNumber;
        this.driver = driver;
        this.orderNumber = orderNumber;
        this.remarks = remarks;
        this.vanTo = vanTo;
        this.vanFrom = vanFrom;
        this.createdBy = createdBy;
        this.createdTimestamp = createdTimestamp;
        this.modifiedBy = modifiedBy;
        this.modifiedTimestamp = modifiedTimestamp;
    }

    @Column(name = "containerId")
    public Integer getContainerId() {
        return containerId;
    }

    public void setContainerId(Integer containerId) {
        this.containerId = containerId;
    }

    @Column(name = "eirNumber")
    public String getEirNumber() {
        return eirNumber;
    }

    public void setEirNumber(String eirNumber) {
        this.eirNumber = eirNumber;
    }

    @Column(name = "dateTime")
    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    @Column(name = "shipping")
    public String getShipping() {
        return shipping;
    }

    public void setShipping(String shipping) {
        this.shipping = shipping;
    }

    @Column(name = "trucking")
    public String getTrucking() {
        return trucking;
    }

    public void setTrucking(String trucking) {
        this.trucking = trucking;
    }

    @Column(name = "plateNumber")
    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    @Column(name = "vanNumber")
    public String getVanNumber() {
        return vanNumber;
    }

    public void setVanNumber(String vanNumber) {
        this.vanNumber = vanNumber;
    }

    @Column(name = "driver")
    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    @Column(name = "orderNumber")
    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    @Column(name = "remarks")
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Column(name = "vanTo")
    public String getVanTo() {
        return vanTo;
    }

    public void setVanTo(String vanTo) {
        this.vanTo = vanTo;
    }

    @Column(name = "vanFrom")
    public String getVanFrom() {
        return vanFrom;
    }

    public void setVanFrom(String vanFrom) {
        this.vanFrom = vanFrom;
    }

    @Column(name = "createBy")
    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Column(name = "createdTimestamp")
    public String getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(String createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }

    @Column(name = "modifiedBy")
    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    @Column(name = "modifiedTimestamp")
    public String getModifiedTimestamp() {
        return modifiedTimestamp;
    }

    public void setModifiedTimestamp(String modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }
}
