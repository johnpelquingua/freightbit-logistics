package com.sr.apps.freightbit.order.formbean;

import java.util.Date;

public class OrderItemsBean {

    private Integer orderItemId;
    private Integer orderId;
    private Integer quantity;
    private String classification;
    private String description;
    private Double declaredValue;
    private Double weight;
    private String remarks;
    private Float rate;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;
    private String nameSize;
    private String status;
    private String shipmentStatus;
    private Float volume;
    private Integer clientId;
    private String commodity;
    private String comments;
    private String vendorSea;
    private String vendorOrigin;
    private String vendorDestination;
    private String vesselName;
    private String finalPickupDate;
    private String finalDeliveryDate;
    private String driverOrigin;
    private String driverDestination;
    private String truckOrigin;
    private String truckDestination;
    private String vesselScheduleId;
    private String orderNum;
    private String editItem;
    private String port;
    private String serviceRequirement;

    public OrderItemsBean(){

    }

    public OrderItemsBean(Date createdTimestamp, Integer orderItemId, Integer orderId, Integer quantity, String classification, String description, Double declaredValue, Double weight, String remarks, Float rate, String createdBy, Date modifiedTimestamp, String modifiedBy, String nameSize, String status, String shipmentStatus, Float volume, Integer clientId, String commodity, String comments, String vendorSea, String vendorOrigin, String vendorDestination, String vesselName, String finalPickupDate, String finalDeliveryDate, String driverOrigin, String driverDestination, String truckOrigin, String truckDestination, String vesselScheduleId, String orderNum, String editItem, String port, String serviceRequirement) {
        this.createdTimestamp = createdTimestamp;
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.quantity = quantity;
        this.classification = classification;
        this.description = description;
        this.declaredValue = declaredValue;
        this.weight = weight;
        this.remarks = remarks;
        this.rate = rate;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedBy = modifiedBy;
        this.nameSize = nameSize;
        this.status = status;
        this.shipmentStatus = shipmentStatus;
        this.volume = volume;
        this.clientId = clientId;
        this.commodity = commodity;
        this.comments = comments;
        this.vendorSea = vendorSea;
        this.vendorOrigin = vendorOrigin;
        this.vendorDestination = vendorDestination;
        this.vesselName = vesselName;
        this.finalPickupDate = finalPickupDate;
        this.finalDeliveryDate = finalDeliveryDate;
        this.driverOrigin = driverOrigin;
        this.driverDestination = driverDestination;
        this.truckOrigin = truckOrigin;
        this.truckDestination = truckDestination;
        this.vesselScheduleId = vesselScheduleId;
        this.orderNum = orderNum;
        this.editItem = editItem;
        this.port = port;
        this.serviceRequirement = serviceRequirement;
    }

    public String getVendorSea() {
        return vendorSea;
    }

    public void setVendorSea(String vendorSea) {
        this.vendorSea = vendorSea;
    }

    public String getVesselName() {
        return vesselName;
    }

    public void setVesselName(String vesselName) {
        this.vesselName = vesselName;
    }

    public String getVendorOrigin() {
        return vendorOrigin;
    }

    public void setVendorOrigin(String vendorOrigin) {
        this.vendorOrigin = vendorOrigin;
    }

    public String getFinalPickupDate() {
        return finalPickupDate;
    }

    public void setFinalPickupDate(String finalPickupDate) {
        this.finalPickupDate = finalPickupDate;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getCommodity() {
        return commodity;
    }

    public void setCommodity(String commodity) {
        this.commodity = commodity;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public Float getRate() {
        return rate;
    }

    public void setRate(Float rate) {
        this.rate = rate;
    }

    public Integer getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(Integer orderItemId) {
        this.orderItemId = orderItemId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getClassification() {
        return classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getDeclaredValue() {
        return declaredValue;
    }

    public void setDeclaredValue(Double declaredValue) {
        this.declaredValue = declaredValue;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
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

    public String getNameSize() {
        return nameSize;
    }

    public void setNameSize(String nameSize) {
        this.nameSize = nameSize;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Float getVolume() {
        return volume;
    }

    public void setVolume(Float volume) {
        this.volume = volume;
    }

    public String getDriverOrigin() {
        return driverOrigin;
    }

    public void setDriverOrigin(String driverOrigin) {
        this.driverOrigin = driverOrigin;
    }

    public String getDriverDestination() {
        return driverDestination;
    }

    public void setDriverDestination(String driverDestination) {
        this.driverDestination = driverDestination;
    }

    public String getTruckOrigin() {
        return truckOrigin;
    }

    public void setTruckOrigin(String truckOrigin) {
        this.truckOrigin = truckOrigin;
    }

    public String getTruckDestination() {
        return truckDestination;
    }

    public void setTruckDestination(String truckDestination) {
        this.truckDestination = truckDestination;
    }

    public String getVendorDestination() {
        return vendorDestination;
    }

    public void setVendorDestination(String vendorDestination) {
        this.vendorDestination = vendorDestination;
    }

    public String getVesselScheduleId() {
        return vesselScheduleId;
    }

    public void setVesselScheduleId(String vesselScheduleId) {
        this.vesselScheduleId = vesselScheduleId;
    }

    public String getFinalDeliveryDate() {
        return finalDeliveryDate;
    }

    public void setFinalDeliveryDate(String finalDeliveryDate) {
        this.finalDeliveryDate = finalDeliveryDate;
    }

    public String getEditItem() {
        return editItem;
    }

    public void setEditItem(String editItem) {
        this.editItem = editItem;
    }

    public String getServiceRequirement() {
        return serviceRequirement;
    }

    public void setServiceRequirement(String serviceRequirement) {
        this.serviceRequirement = serviceRequirement;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getShipmentStatus() {
        return shipmentStatus;
    }

    public void setShipmentStatus(String shipmentStatus) {
        this.shipmentStatus = shipmentStatus;
    }
}