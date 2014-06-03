package com.sr.biz.freightbit.core.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Created by JMXPSX on 5/27/14.
 */
@Table(name = "orders", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "orderNumber"))
public class Orders implements Serializable{

    private Integer orderId;
    private Client client;
    private Integer orderNumber;
    private String serviceType;
    private String serviceMode;
    private String notificationType;
    private Date orderDate;
    private String paymentMode;
    private Integer quantity;
    private String size;
    private String classification;
    private float estimatedWeight;
    private float declaredValue;
    private String commodity;
    private String comments;
    private float rate;
    private String orderStatus;
    private String vendorCode;
    private String truckCode;
    private String trailerCode;
    private String driverCode;
    private String vesselNumber;
    private String accountRep;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;

    public Orders() {}

    public Orders(Integer orderId, Client client, Integer orderNumber, String serviceType, String serviceMode, String notificationType, Date orderDate, String paymentMode, Integer quantity, String size, String classification, float estimatedWeight, float declaredValue, String commodity, String comments, float rate, String orderStatus, String vendorCode, String truckCode, String trailerCode, String driverCode, String vesselNumber, String accountRep, Date createdTimestamp, String createdBy, Date modifiedTimestamp, String modifiedBy) {
        this.orderId = orderId;
        this.client = client;
        this.orderNumber = orderNumber;
        this.serviceType = serviceType;
        this.serviceMode = serviceMode;
        this.notificationType = notificationType;
        this.orderDate = orderDate;
        this.paymentMode = paymentMode;
        this.quantity = quantity;
        this.size = size;
        this.classification = classification;
        this.estimatedWeight = estimatedWeight;
        this.declaredValue = declaredValue;
        this.commodity = commodity;
        this.comments = comments;
        this.rate = rate;
        this.orderStatus = orderStatus;
        this.vendorCode = vendorCode;
        this.truckCode = truckCode;
        this.trailerCode = trailerCode;
        this.driverCode = driverCode;
        this.vesselNumber = vesselNumber;
        this.accountRep = accountRep;
        this.createdTimestamp = createdTimestamp;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedBy = modifiedBy;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "orderId", unique = true, nullable = false)
    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clientId", nullable = false)
    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    @Column(name = "orderNumber", unique = true, nullable = false)
    public Integer getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(Integer orderNumber) {
        this.orderNumber = orderNumber;
    }

    @Column(name = "serviceType", nullable = false)
    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    @Column(name = "serviceMode", nullable = false)
    public String getServiceMode() {
        return serviceMode;
    }

    public void setServiceMode(String serviceMode) {
        this.serviceMode = serviceMode;
    }

    @Column(name = "notificationType", nullable = false)
    public String getNotificationType() {
        return notificationType;
    }

    public void setNotificationType(String notificationType) {
        this.notificationType = notificationType;
    }

    @Column(name = "orderDate", nullable = false)
    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    @Column(name = "paymentMode", nullable = false)
    public String getPaymentMode() {
        return paymentMode;
    }

    public void setPaymentMode(String paymentMode) {
        this.paymentMode = paymentMode;
    }

    @Column(name = "quantity", nullable = false)
    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Column(name = "size", nullable = false)
    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @Column(name = "classification", nullable = false)
    public String getClassification() {
        return classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }

    @Column(name = "estimatedWeight", nullable = false)
    public float getEstimatedWeight() {
        return estimatedWeight;
    }

    public void setEstimatedWeight(float estimatedWeight) {
        this.estimatedWeight = estimatedWeight;
    }

    @Column(name = "declaredValue", nullable = false)
    public float getDeclaredValue() {
        return declaredValue;
    }

    public void setDeclaredValue(float declaredValue) {
        this.declaredValue = declaredValue;
    }

    @Column(name = "commodity", nullable = false)
    public String getCommodity() {
        return commodity;
    }

    public void setCommodity(String commodity) {
        this.commodity = commodity;
    }

    @Column(name = "comments", nullable = false)
    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    @Column(name = "rate", nullable = false)
    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    @Column(name = "orderStatus", nullable = false)
    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    @Column(name = "vendorCode")
    public String getVendorCode() {
        return vendorCode;
    }

    public void setVendorCode(String vendorCode) {
        this.vendorCode = vendorCode;
    }

    @Column(name = "truckCode")
    public String getTruckCode() {
        return truckCode;
    }

    public void setTruckCode(String truckCode) {
        this.truckCode = truckCode;
    }

    @Column(name = "trailerCode")
    public String getTrailerCode() {
        return trailerCode;
    }

    public void setTrailerCode(String trailerCode) {
        this.trailerCode = trailerCode;
    }

    @Column(name = "driverCode")
    public String getDriverCode() {
        return driverCode;
    }

    public void setDriverCode(String driverCode) {
        this.driverCode = driverCode;
    }

    @Column(name = "vesselNumber")
    public String getVesselNumber() {
        return vesselNumber;
    }

    public void setVesselNumber(String vesselNumber) {
        this.vesselNumber = vesselNumber;
    }

    @Column(name = "accountRep")
    public String getAccountRep() {
        return accountRep;
    }

    public void setAccountRep(String accountRep) {
        this.accountRep = accountRep;
    }

    @Column(name = "createdTimestamp", nullable = false)
    public Date getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }

    @Column(name = "createdBy", nullable = false)
    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Column(name = "modifiedTimestamp", nullable = false)
    public Date getModifiedTimestamp() {
        return modifiedTimestamp;
    }

    public void setModifiedTimestamp(Date modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }

    @Column(name = "modifiedBy", nullable = false )
    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
}
