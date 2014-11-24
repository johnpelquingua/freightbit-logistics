package com.sr.biz.freightbit.operations.entity;

/**
 * Created by Clarence C. Victoria on 11/3/2014.
 */

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "container", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "containerId"))
public class Container implements Serializable{

    private Integer containerId;
    private Integer clientId;
    private String eirType;
    private String eirNumber;
    private String portCode;
    private String receiptNumber;
    private Date dateTime;
    private String shipping;
    private String trucking;
    private String plateNumber;
    private String vanNumber;
    private String driver;
    private String bookingNum;
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
    private String containerType;
    private String sealNumber;
    private String vanLocation;
    private String ladenEmpty;
    private String containerStatus;
    private String forkliftOperator;
    private String operationsDept;

    public Container() {
    }

    public Container(Integer containerId, Integer clientId, String eirType, String eirNumber, String receiptNumber, Date dateTime, String shipping, String trucking, String plateNumber, String vanNumber, String driver, String bookingNum, String orderNumber, String remarks, String vanTo, String vanFrom, String createdBy, Date createdTimestamp, String modifiedBy, Date modifiedTimestamp, String containerNumber, String containerSize, String containerStatus, String forkliftOperator, String operationsDept, String sealNumber, String vanLocation, String ladenEmpty, String containerType, String portCode) {
        this.containerId = containerId;
        this.clientId = clientId;
        this.eirType = eirType;
        this.eirNumber = eirNumber;
        this.portCode = portCode;
        this.receiptNumber = receiptNumber;
        this.dateTime = dateTime;
        this.shipping = shipping;
        this.trucking = trucking;
        this.plateNumber = plateNumber;
        this.vanNumber = vanNumber;
        this.driver = driver;
        this.bookingNum = bookingNum;
        this.orderNumber = orderNumber;
        this.remarks = remarks;
        this.vanTo = vanTo;
        this.vanFrom = vanFrom;
        this.createdBy = createdBy;
        this.createdTimestamp = createdTimestamp;
        this.modifiedBy = modifiedBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.containerNumber = containerNumber;
        this.containerSize = containerSize;
        this.containerStatus = containerStatus;
        this.forkliftOperator = forkliftOperator;
        this.operationsDept = operationsDept;
        this.containerSize = containerType;
        this.containerSize = sealNumber;
        this.containerSize = vanLocation;
        this.containerSize = ladenEmpty;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "containerId")
    public Integer getContainerId() {
        return containerId;
    }

    public void setContainerId(Integer containerId) {
        this.containerId = containerId;
    }

    @Column(name = "clientId")
    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    @Column(name = "eirNumber")
    public String getEirNumber() {
        return eirNumber;
    }

    public void setEirNumber(String eirNumber) {
        this.eirNumber = eirNumber;
    }

    @Column(name = "receiptNumber")
    public String getReceiptNumber() {
        return receiptNumber;
    }

    public void setReceiptNumber(String receiptNumber) {
        this.receiptNumber = receiptNumber;
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

    @Column(name = "bookingNum")
    public String getBookingNum() {
        return bookingNum;
    }

    public void setBookingNum(String bookingNum) {
        this.bookingNum = bookingNum;
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

    @Column(name = "createdBy")
    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Column(name = "createdTimestamp")
    public Date getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
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
    public Date getModifiedTimestamp() {
        return modifiedTimestamp;
    }

    public void setModifiedTimestamp(Date modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }

    @Column(name = "containerNumber")
    public String getContainerNumber() {
        return containerNumber;
    }

    public void setContainerNumber(String containerNumber) {
        this.containerNumber = containerNumber;
    }

    @Column(name = "containerSize")
    public String getContainerSize() {
        return containerSize;
    }

    public void setContainerSize(String containerSize) {
        this.containerSize = containerSize;
    }

    @Column(name="containerType")
    public String getContainerType() {
        return containerType;
    }

    public void setContainerType(String containerType) {
        this.containerType = containerType;
    }

    @Column(name="sealNumber")
    public String getSealNumber() {
        return sealNumber;
    }

    public void setSealNumber(String sealNumber) {
        this.sealNumber = sealNumber;
    }

    @Column(name="vanLocation")
    public String getVanLocation() {
        return vanLocation;
    }

    public void setVanLocation(String vanLocation) {
        this.vanLocation = vanLocation;
    }

    @Column(name="ladenEmpty")
    public String getLadenEmpty() {
        return ladenEmpty;
    }

    public void setLadenEmpty(String ladenEmpty) {
        this.ladenEmpty = ladenEmpty;
    }

    @Column(name="containerStatus")
    public String getContainerStatus() {
        return containerStatus;
    }

    public void setContainerStatus(String containerStatus) {
        this.containerStatus = containerStatus;
    }

    @Column(name = "forkliftOperator")
    public String getForkliftOperator() {
        return forkliftOperator;
    }

    public void setForkliftOperator(String forkliftOperator) {
        this.forkliftOperator = forkliftOperator;
    }

    @Column(name = "operationsDept")
    public String getOperationsDept() {
        return operationsDept;
    }

    public void setOperationsDept(String operationsDept) {
        this.operationsDept = operationsDept;
    }

    @Column(name = "eirType")
         public String getEirType() {
        return eirType;
    }

    public void setEirType(String eirType) {
        this.eirType = eirType;
    }

    @Column(name = "portCode")
    public String getPortCode() {
        return portCode;
    }

    public void setPortCode(String portCode) {
        this.portCode = portCode;
    }
}
