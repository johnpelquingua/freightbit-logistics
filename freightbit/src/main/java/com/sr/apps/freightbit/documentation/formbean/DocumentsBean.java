package com.sr.apps.freightbit.documentation.formbean;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 * Date: 8/8/14
 * Time: 10:21 AM
 * To change this template use File | Settings | File Templates.
 */
public class DocumentsBean {
    private Integer documentId;
    private String documentType;
    private Integer clientId;
    private Integer orderId;
    private String placeOfIssue;
    private Integer billOfLadingNo;
    private String estimatedDeparture;
    private String estimatedArrival;
    private String vessel;
    private String voyageNumber;
    private Date acceptanceDate;
    private Date releaseDate;
    private String referenceNo;
    private String orNo;
    private String trucker;
    private String truckPlateNo;
    private String containerNo;
    private String sealNo;
    private Integer qty;
    private String size;
    private String remarks;
    private String details;
    private Float rate;
    private String amountWords;
    private Float php;
    private Float totalRate;
    private Float totalFreight;

    private Integer documentIdParam;
    private Integer orderIdParam;

    public DocumentsBean() {
    }

    public DocumentsBean(Integer documentId, String documentType,
                         Integer clientId, Integer orderId, String placeOfIssue,
                         Integer billOfLadingNo, String estimatedDeparture, String estimatedArrival,
                         String vessel, String voyageNumber, Date acceptanceDate,
                         Date releaseDate, String referenceNo, String orNo,
                         String trucker, String truckPlateNo, String containerNo,
                         String sealNo, Integer qty, String size, String remarks,
                         String details, Float rate, String amountWords, Float php,
                         Float totalRate, Float totalFreight, Integer documentIdParam,
                         Integer orderIdParam) {
        this.documentId = documentId;
        this.documentType = documentType;
        this.clientId = clientId;
        this.orderId = orderId;
        this.placeOfIssue = placeOfIssue;
        this.billOfLadingNo = billOfLadingNo;
        this.estimatedDeparture = estimatedDeparture;
        this.estimatedArrival = estimatedArrival;
        this.vessel = vessel;
        this.voyageNumber = voyageNumber;
        this.acceptanceDate = acceptanceDate;
        this.releaseDate = releaseDate;
        this.referenceNo = referenceNo;
        this.orNo = orNo;
        this.trucker = trucker;
        this.truckPlateNo = truckPlateNo;
        this.containerNo = containerNo;
        this.sealNo = sealNo;
        this.qty = qty;
        this.size = size;
        this.remarks = remarks;
        this.details = details;
        this.rate = rate;
        this.amountWords = amountWords;
        this.php = php;
        this.totalRate = totalRate;
        this.totalFreight = totalFreight;
        this.documentIdParam = documentIdParam;
        this.orderIdParam = orderIdParam;
    }

    public Integer getDocumentId() {
        return documentId;
    }

    public void setDocumentId(Integer documentId) {
        this.documentId = documentId;
    }

    public String getDocumentType() {
        return documentType;
    }

    public void setDocumentType(String documentType) {
        this.documentType = documentType;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getPlaceOfIssue() {
        return placeOfIssue;
    }

    public void setPlaceOfIssue(String placeOfIssue) {
        this.placeOfIssue = placeOfIssue;
    }

    public Integer getBillOfLadingNo() {
        return billOfLadingNo;
    }

    public void setBillOfLadingNo(Integer billOfLadingNo) {
        this.billOfLadingNo = billOfLadingNo;
    }

    public String getEstimatedDeparture() {
        return estimatedDeparture;
    }

    public void setEstimatedDeparture(String estimatedDeparture) {
        this.estimatedDeparture = estimatedDeparture;
    }

    public String getEstimatedArrival() {
        return estimatedArrival;
    }

    public void setEstimatedArrival(String estimatedArrival) {
        this.estimatedArrival = estimatedArrival;
    }

    public String getVessel() {
        return vessel;
    }

    public void setVessel(String vessel) {
        this.vessel = vessel;
    }

    public String getVoyageNumber() {
        return voyageNumber;
    }

    public void setVoyageNumber(String voyageNumber) {
        this.voyageNumber = voyageNumber;
    }

    public Date getAcceptanceDate() {
        return acceptanceDate;
    }

    public void setAcceptanceDate(Date acceptanceDate) {
        this.acceptanceDate = acceptanceDate;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getReferenceNo() {
        return referenceNo;
    }

    public void setReferenceNo(String referenceNo) {
        this.referenceNo = referenceNo;
    }

    public String getOrNo() {
        return orNo;
    }

    public void setOrNo(String orNo) {
        this.orNo = orNo;
    }

    public String getTrucker() {
        return trucker;
    }

    public void setTrucker(String trucker) {
        this.trucker = trucker;
    }

    public String getTruckPlateNo() {
        return truckPlateNo;
    }

    public void setTruckPlateNo(String truckPlateNo) {
        this.truckPlateNo = truckPlateNo;
    }

    public String getContainerNo() {
        return containerNo;
    }

    public void setContainerNo(String containerNo) {
        this.containerNo = containerNo;
    }

    public String getSealNo() {
        return sealNo;
    }

    public void setSealNo(String sealNo) {
        this.sealNo = sealNo;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Float getRate() {
        return rate;
    }

    public void setRate(Float rate) {
        this.rate = rate;
    }

    public String getAmountWords() {
        return amountWords;
    }

    public void setAmountWords(String amountWords) {
        this.amountWords = amountWords;
    }

    public Float getPhp() {
        return php;
    }

    public void setPhp(Float php) {
        this.php = php;
    }

    public Float getTotalRate() {
        return totalRate;
    }

    public void setTotalRate(Float totalRate) {
        this.totalRate = totalRate;
    }

    public Float getTotalFreight() {
        return totalFreight;
    }

    public void setTotalFreight(Float totalFreight) {
        this.totalFreight = totalFreight;
    }

    public Integer getDocumentIdParam() {
        return documentIdParam;
    }

    public void setDocumentIdParam(Integer documentIdParam) {
        this.documentIdParam = documentIdParam;
    }

    public Integer getOrderIdParam() {
        return orderIdParam;
    }

    public void setOrderIdParam(Integer orderIdParam) {
        this.orderIdParam = orderIdParam;
    }
}
