package com.sr.apps.freightbit.operations.formbean;

import com.sr.biz.freightbit.core.entity.Client;

import java.util.Date;

public class ContainerBean {

    private Integer containerId;
    private Client clientId;
    private String eirNumber;
    private String receiptNumber;
    private Date gateInTime;
    private Date gateOutTime;
    private String strGateInTime;
    private String strGateOutTime;
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
    private String containerType;
    private String containerStatus;
    private String sealNumber;
    private String bulletSeal;
    private String shippingSeal;
    private String vanLocation;
    private String ladenEmpty;
    private String forkliftOperator;
    private String operationsDept;
    private String containerSearchCriteria;
    private String containerKeyword;
    private String eirType;
    private String portCode;
    // for documents link on container list view
    private String DocumentCheck;
    private Integer documentId;
    private String documentManifestCheck;
    private Integer documentManifestId;
    private String voyageVendorDestination;

    public ContainerBean() {
    }

    public ContainerBean(String shipping, Integer containerId, Client clientId, String eirNumber, String receiptNumber, Date gateInTime, Date gateOutTime, String strGateInTime, String strGateOutTime, String trucking, String plateNumber, String vanNumber, String driver, String orderNumber, String remarks, String vanTo, String vanFrom, String createdBy, Date createdTimestamp, String modifiedBy, Date modifiedTimestamp, String containerNumber, String containerSize, String containerType, String containerStatus, String sealNumber, String bulletSeal, String shippingSeal, String vanLocation, String ladenEmpty, String forkliftOperator, String operationsDept, String containerSearchCriteria, String containerKeyword, String eirType, String portCode, String documentCheck, Integer documentId, String documentManifestCheck, Integer documentManifestId, String voyageVendorDestination) {
        this.shipping = shipping;
        this.containerId = containerId;
        this.clientId = clientId;
        this.eirNumber = eirNumber;
        this.receiptNumber = receiptNumber;
        this.gateInTime = gateInTime;
        this.gateOutTime = gateOutTime;
        this.strGateInTime = strGateInTime;
        this.strGateOutTime = strGateOutTime;
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
        this.containerNumber = containerNumber;
        this.containerSize = containerSize;
        this.containerType = containerType;
        this.containerStatus = containerStatus;
        this.sealNumber = sealNumber;
        this.bulletSeal = bulletSeal;
        this.shippingSeal = shippingSeal;
        this.vanLocation = vanLocation;
        this.ladenEmpty = ladenEmpty;
        this.forkliftOperator = forkliftOperator;
        this.operationsDept = operationsDept;
        this.containerSearchCriteria = containerSearchCriteria;
        this.containerKeyword = containerKeyword;
        this.eirType = eirType;
        this.portCode = portCode;
        DocumentCheck = documentCheck;
        this.documentId = documentId;
        this.documentManifestCheck = documentManifestCheck;
        this.documentManifestId = documentManifestId;
        this.voyageVendorDestination = voyageVendorDestination;
    }

    public Integer getContainerId() {
        return containerId;
    }

    public void setContainerId(Integer containerId) {
        this.containerId = containerId;
    }

    public Client getClientId() {
        return clientId;
    }

    public void setClientId(Client clientId) {
        this.clientId = clientId;
    }

    public String getEirNumber() {
        return eirNumber;
    }

    public void setEirNumber(String eirNumber) {
        this.eirNumber = eirNumber;
    }

    public String getReceiptNumber() {
        return receiptNumber;
    }

    public void setReceiptNumber(String receiptNumber) {
        this.receiptNumber = receiptNumber;
    }

    public Date getGateInTime() {
        return gateInTime;
    }

    public void setGateInTime(Date gateInTime) {
        this.gateInTime = gateInTime;
    }

    public Date getGateOutTime() {
        return gateOutTime;
    }

    public void setGateOutTime(Date gateOutTime) {
        this.gateOutTime = gateOutTime;
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

    public String getContainerType() {
        return containerType;
    }

    public void setContainerType(String containerType) {
        this.containerType = containerType;
    }

    public String getContainerStatus() {
        return containerStatus;
    }

    public void setContainerStatus(String containerStatus) {
        this.containerStatus = containerStatus;
    }

    public String getSealNumber() {
        return sealNumber;
    }

    public void setSealNumber(String sealNumber) {
        this.sealNumber = sealNumber;
    }

    public String getBulletSeal() {
        return bulletSeal;
    }

    public void setBulletSeal(String bulletSeal) {
        this.bulletSeal = bulletSeal;
    }

    public String getShippingSeal() {
        return shippingSeal;
    }

    public void setShippingSeal(String shippingSeal) {
        this.shippingSeal = shippingSeal;
    }

    public String getVanLocation() {
        return vanLocation;
    }

    public void setVanLocation(String vanLocation) {
        this.vanLocation = vanLocation;
    }

    public String getLadenEmpty() {
        return ladenEmpty;
    }

    public void setLadenEmpty(String ladenEmpty) {
        this.ladenEmpty = ladenEmpty;
    }

    public String getForkliftOperator() {
        return forkliftOperator;
    }

    public void setForkliftOperator(String forkliftOperator) {
        this.forkliftOperator = forkliftOperator;
    }

    public String getOperationsDept() {
        return operationsDept;
    }

    public void setOperationsDept(String operationsDept) {
        this.operationsDept = operationsDept;
    }

    public String getEirType() {
        return eirType;
    }

    public void setEirType(String eirType) {
        this.eirType = eirType;
    }

    public String getContainerSearchCriteria() {
        return containerSearchCriteria;
    }

    public void setContainerSearchCriteria(String containerSearchCriteria) {
        this.containerSearchCriteria = containerSearchCriteria;
    }

    public String getContainerKeyword() {
        return containerKeyword;
    }

    public void setContainerKeyword(String containerKeyword) {
        this.containerKeyword = containerKeyword;
    }

    public Integer getDocumentId() {
        return documentId;
    }

    public void setDocumentId(Integer documentId) {
        this.documentId = documentId;
    }

    public String getDocumentCheck() {
        return DocumentCheck;
    }

    public void setDocumentCheck(String documentCheck) {
        DocumentCheck = documentCheck;
    }

    public String getPortCode() {
        return portCode;
    }

    public void setPortCode(String portCode) {
        this.portCode = portCode;
    }

    public String getDocumentManifestCheck() {
        return documentManifestCheck;
    }

    public void setDocumentManifestCheck(String documentManifestCheck) {
        this.documentManifestCheck = documentManifestCheck;
    }

    public Integer getDocumentManifestId() {
        return documentManifestId;
    }

    public void setDocumentManifestId(Integer documentManifestId) {
        this.documentManifestId = documentManifestId;
    }

    public String getStrGateInTime() {
        return strGateInTime;
    }

    public void setStrGateInTime(String strGateInTime) {
        this.strGateInTime = strGateInTime;
    }

    public String getStrGateOutTime() {
        return strGateOutTime;
    }

    public void setStrGateOutTime(String strGateOutTime) {
        this.strGateOutTime = strGateOutTime;
    }

    public String getVoyageVendorDestination() {
        return voyageVendorDestination;
    }

    public void setVoyageVendorDestination(String voyageVendorDestination) {
        this.voyageVendorDestination = voyageVendorDestination;
    }
}