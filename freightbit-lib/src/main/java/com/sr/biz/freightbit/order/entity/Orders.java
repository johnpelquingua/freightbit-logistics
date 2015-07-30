package com.sr.biz.freightbit.order.entity;
// Generated Jun 4, 2014 9:55:23 PM by Hibernate Tools 3.6.0


import com.sr.biz.freightbit.core.entity.Client;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "orders"
        , catalog = "freightbit"
        , uniqueConstraints = @UniqueConstraint(columnNames = "orderNumber")
)
public class Orders implements java.io.Serializable {

    private Integer orderId;
    /*private Integer clientId;*/
    private Client client;
    private String orderNumber;
    private String serviceRequirement;
    private String serviceType;
    private String serviceMode;
    private String notificationType;
    private Date orderDate;
    private String paymentMode;
    private String comments;
    private String orderStatus;
    private String vendorCode;
    private String truckCode;
    private String trailerCode;
    private String driverCode;
    private String vesselNumber;
    private String shipperCode;
    private Integer shipperAddressId;
    private Integer shipperContactId;
    private String consigneeCode;
    private Integer consigneeAddressId;
    private Integer consigneeContactId;
    private String accountRep;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;
    private Date pickupDate;
    private String originationPort;
    private Date deliveryDate;
    private String destinationPort;
    private Double rates;
    private List<OrderItems> orderItems = new ArrayList<OrderItems>();
    private Integer customerId;
    private Integer consigneeContactPersonId;
    private Integer aging;
    private Integer limit = 10;


    public Orders() {
    }


    public Orders(String serviceMode, Integer orderId, Client client, String orderNumber, String serviceRequirement, String serviceType, String notificationType, Date orderDate, String paymentMode, String comments, String orderStatus, String vendorCode, String truckCode, String trailerCode, String driverCode, String vesselNumber, String shipperCode, Integer shipperAddressId, Integer shipperContactId, String consigneeCode, Integer consigneeAddressId, Integer consigneeContactId, String accountRep, Date createdTimestamp, String createdBy, Date modifiedTimestamp, String modifiedBy, Date pickupDate, String originationPort, Date deliveryDate, String destinationPort, Double rates, List<OrderItems> orderItems, Integer customerId, Integer consigneeContactPersonId, Integer aging) {
        this.serviceMode = serviceMode;
        this.orderId = orderId;
        this.client = client;
        this.orderNumber = orderNumber;
        this.serviceRequirement = serviceRequirement;
        this.serviceType = serviceType;
        this.notificationType = notificationType;
        this.orderDate = orderDate;
        this.paymentMode = paymentMode;
        this.comments = comments;
        this.orderStatus = orderStatus;
        this.vendorCode = vendorCode;
        this.truckCode = truckCode;
        this.trailerCode = trailerCode;
        this.driverCode = driverCode;
        this.vesselNumber = vesselNumber;
        this.shipperCode = shipperCode;
        this.shipperAddressId = shipperAddressId;
        this.shipperContactId = shipperContactId;
        this.consigneeCode = consigneeCode;
        this.consigneeAddressId = consigneeAddressId;
        this.consigneeContactId = consigneeContactId;
        this.accountRep = accountRep;
        this.createdTimestamp = createdTimestamp;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedBy = modifiedBy;
        this.pickupDate = pickupDate;
        this.originationPort = originationPort;
        this.deliveryDate = deliveryDate;
        this.destinationPort = destinationPort;
        this.rates = rates;
        this.orderItems = orderItems;
        this.customerId = customerId;
        this.consigneeContactPersonId = consigneeContactPersonId;
        this.aging = aging;
        this.limit = 10;

    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "orderId", unique = true, nullable = false)
    public Integer getOrderId() {
        return this.orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }


    /*@Column(name = "clientId", nullable = false)
    public Integer getClientId() {
        return this.clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }*/

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clientId")
    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    @Column(name = "orderNumber", unique = true, nullable = false)
    public String getOrderNumber() {
        return this.orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    @Column(name = "serviceRequirement", unique = true, nullable = false)
    public String getServiceRequirement() {
        return serviceRequirement;
    }

    public void setServiceRequirement(String serviceRequirement) {
        this.serviceRequirement = serviceRequirement;
    }

    @Column(name = "serviceType", nullable = true, length = 10)
    public String getServiceType() {
        return this.serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }


    @Column(name = "serviceMode", nullable = true, length = 10)
    public String getServiceMode() {
        return this.serviceMode;
    }

    public void setServiceMode(String serviceMode) {
        this.serviceMode = serviceMode;
    }

    @Column(name = "notificationType", length = 30)
    public String getNotificationType() {
        return this.notificationType;
    }

    public void setNotificationType(String notificationType) {
        this.notificationType = notificationType;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "orderDate", nullable = true, length = 10)
    public Date getOrderDate() {
        return this.orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }


    @Column(name = "paymentMode", nullable = true)
    public String getPaymentMode() {
        return this.paymentMode;
    }

    public void setPaymentMode(String paymentMode) {
        this.paymentMode = paymentMode;
    }


    @Column(name = "comments")
    public String getComments() {
        return this.comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }


    @Column(name = "orderStatus", nullable = false, length = 10)
    public String getOrderStatus() {
        return this.orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }


    @Column(name = "vendorCode", length = 10)
    public String getVendorCode() {
        return this.vendorCode;
    }

    public void setVendorCode(String vendorCode) {
        this.vendorCode = vendorCode;
    }


    @Column(name = "truckCode", length = 10)
    public String getTruckCode() {
        return this.truckCode;
    }

    public void setTruckCode(String truckCode) {
        this.truckCode = truckCode;
    }


    @Column(name = "trailerCode", length = 10)
    public String getTrailerCode() {
        return this.trailerCode;
    }

    public void setTrailerCode(String trailerCode) {
        this.trailerCode = trailerCode;
    }


    @Column(name = "driverCode", length = 10)
    public String getDriverCode() {
        return this.driverCode;
    }

    public void setDriverCode(String driverCode) {
        this.driverCode = driverCode;
    }


    @Column(name = "vesselNumber", length = 50)
    public String getVesselNumber() {
        return this.vesselNumber;
    }

    public void setVesselNumber(String vesselNumber) {
        this.vesselNumber = vesselNumber;
    }


    @Column(name = "shipperCode", length = 10)
    public String getShipperCode() {
        return this.shipperCode;
    }

    public void setShipperCode(String shipperCode) {
        this.shipperCode = shipperCode;
    }


    @Column(name = "shipperAddressId")
    public Integer getShipperAddressId() {
        return this.shipperAddressId;
    }

    public void setShipperAddressId(Integer shipperAddressId) {
        this.shipperAddressId = shipperAddressId;
    }


    @Column(name = "shipperContactId", nullable = false)
    public Integer getShipperContactId() {
        return this.shipperContactId;
    }

    public void setShipperContactId(Integer shipperContactId) {
        this.shipperContactId = shipperContactId;
    }


    @Column(name = "consigneeCode", length = 10)
    public String getConsigneeCode() {
        return this.consigneeCode;
    }

    public void setConsigneeCode(String consigneeCode) {
        this.consigneeCode = consigneeCode;
    }


    @Column(name = "consigneeAddressId")
    public Integer getConsigneeAddressId() {
        return this.consigneeAddressId;
    }

    public void setConsigneeAddressId(Integer consigneeAddressId) {
        this.consigneeAddressId = consigneeAddressId;
    }


    @Column(name = "consigneeContactId")
    public Integer getConsigneeContactId() {
        return this.consigneeContactId;
    }

    public void setConsigneeContactId(Integer consigneeContactId) {
        this.consigneeContactId = consigneeContactId;
    }


    @Column(name = "accountRep", length = 10)
    public String getAccountRep() {
        return this.accountRep;
    }

    public void setAccountRep(String accountRep) {
        this.accountRep = accountRep;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "createdTimestamp", nullable = false, length = 19)
    public Date getCreatedTimestamp() {
        return this.createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }


    @Column(name = "createdBy", nullable = false, length = 10)
    public String getCreatedBy() {
        return this.createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "modifiedTimestamp", nullable = false, length = 19)
    public Date getModifiedTimestamp() {
        return this.modifiedTimestamp;
    }

    public void setModifiedTimestamp(Date modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }


    @Column(name = "modifiedBy", nullable = false, length = 10)
    public String getModifiedBy() {
        return this.modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "pickupDate")
    public Date getPickupDate() {
        return pickupDate;
    }


    public void setPickupDate(Date pickupDate) {
        this.pickupDate = pickupDate;
    }

    /*@Temporal(TemporalType.TIMESTAMP)
    @Column(name = "pickupTime")
    public Date getPickupTime() {
        return pickupTime;
    }


    public void setPickupTime(Date pickupTime) {
        this.pickupTime = pickupTime;
    }*/

    @Column(name = "originationPort", length = 25)
    public String getOriginationPort() {
        return originationPort;
    }


    public void setOriginationPort(String originationPort) {
        this.originationPort = originationPort;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "deliveryDate")
    public Date getDeliveryDate() {
        return deliveryDate;
    }


    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    /*@Temporal(TemporalType.TIMESTAMP)
    @Column(name = "deliveryTime")
    public Date getDeliveryTime() {
        return deliveryTime;
    }


    public void setDeliveryTime(Date deliveryTime) {
        this.deliveryTime = deliveryTime;
    }*/


    @Column(name = "destinationPort", length = 25)
    public String getDestinationPort() {
        return destinationPort;
    }


    public void setDestinationPort(String destinationPort) {
        this.destinationPort = destinationPort;
    }

    @Column(name = "rates")
    public Double getRates() {
        return rates;
    }


    public void setRates(Double rates) {
        this.rates = rates;
    }


    @OneToMany(fetch = FetchType.LAZY, mappedBy = "orderId", cascade = {CascadeType.ALL})
    public List<OrderItems> getOrderItems() {
        return this.orderItems;
    }

    public void setOrderItems(List<OrderItems> orderItems) {
        this.orderItems = orderItems;
    }

    @Column(name = "customerId")
    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    @Column(name = "consigneeContactPersonId")
    public Integer getConsigneeContactPersonId() {
        return consigneeContactPersonId;
    }

    public void setConsigneeContactPersonId(Integer consigneeContactPersonId) {
        this.consigneeContactPersonId = consigneeContactPersonId;
    }

    @Column(name = "aging")
    public Integer getAging() {
        return aging;
    }

    public void setAging(Integer aging) {
        this.aging = aging;
    }
}


