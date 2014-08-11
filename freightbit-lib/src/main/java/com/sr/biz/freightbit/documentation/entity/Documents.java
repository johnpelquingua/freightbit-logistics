package com.sr.biz.freightbit.documentation.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Clarence C. Victoria on 8/8/14.
 */

@Entity
@Table(name = "documents", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "documentId"))
public class Documents implements Serializable {

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

    public Documents() {
    }

    public Documents(Integer documentId, String documentType, Integer clientId,
                     Integer orderId, String placeOfIssue, Integer billOfLadingNo,
                     String estimatedDeparture, String estimatedArrival, String vessel,
                     String voyageNumber, Date acceptanceDate, Date releaseDate,
                     String referenceNo, String orNo, String trucker, String truckPlateNo,
                     String containerNo, String sealNo, Integer qty, String size, String remarks,
                     String details, Float rate, String amountWords, Float php, Float totalRate,
                     Float totalFreight) {
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
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "documentId", unique = true)
    public Integer getDocumentId() {
        return documentId;
    }

    public void setDocumentId(Integer documentId) {
        this.documentId = documentId;
    }

    @Column(name = "documentType")
    public String getDocumentType() {
        return documentType;
    }

    public void setDocumentType(String documentType) {
        this.documentType = documentType;
    }

    @Column(name = "clientId")
    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    @Column(name = "orderId")
    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    @Column(name = "placeOfIssue")
    public String getPlaceOfIssue() {
        return placeOfIssue;
    }

    public void setPlaceOfIssue(String placeOfIssue) {
        this.placeOfIssue = placeOfIssue;
    }

    @Column(name = "billOfLadingNo")
    public Integer getBillOfLadingNo() {
        return billOfLadingNo;
    }

    public void setBillOfLadingNo(Integer billOfLadingNo) {
        this.billOfLadingNo = billOfLadingNo;
    }

    @Column(name = "estimatedDeparture")
    public String getEstimatedDeparture() {
        return estimatedDeparture;
    }

    public void setEstimatedDeparture(String estimatedDeparture) {
        this.estimatedDeparture = estimatedDeparture;
    }

    @Column(name = "estimatedArrival")
    public String getEstimatedArrival() {
        return estimatedArrival;
    }

    public void setEstimatedArrival(String estimatedArrival) {
        this.estimatedArrival = estimatedArrival;
    }

    @Column(name = "vessel")
    public String getVessel() {
        return vessel;
    }

    public void setVessel(String vessel) {
        this.vessel = vessel;
    }

    @Column(name = "voyageNumber")
    public String getVoyageNumber() {
        return voyageNumber;
    }

    public void setVoyageNumber(String voyageNumber) {
        this.voyageNumber = voyageNumber;
    }

    @Column(name = "acceptanceDate")
    public Date getAcceptanceDate() {
        return acceptanceDate;
    }

    public void setAcceptanceDate(Date acceptanceDate) {
        this.acceptanceDate = acceptanceDate;
    }

    @Column(name = "releaseDate")
    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    @Column(name = "referenceNo")
    public String getReferenceNo() {
        return referenceNo;
    }

    public void setReferenceNo(String referenceNo) {
        this.referenceNo = referenceNo;
    }

    @Column(name = "orNo")
    public String getOrNo() {
        return orNo;
    }

    public void setOrNo(String orNo) {
        this.orNo = orNo;
    }

    @Column(name = "trucker")
    public String getTrucker() {
        return trucker;
    }

    public void setTrucker(String trucker) {
        this.trucker = trucker;
    }

    @Column(name = "truckPlateNo")
    public String getTruckPlateNo() {
        return truckPlateNo;
    }

    public void setTruckPlateNo(String truckPlateNo) {
        this.truckPlateNo = truckPlateNo;
    }

    @Column(name = "containerNo")
    public String getContainerNo() {
        return containerNo;
    }

    public void setContainerNo(String containerNo) {
        this.containerNo = containerNo;
    }

    @Column(name = "sealNo")
    public String getSealNo() {
        return sealNo;
    }

    public void setSealNo(String sealNo) {
        this.sealNo = sealNo;
    }

    @Column(name = "qty")
    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }

    @Column(name = "size")
    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @Column(name = "remarks")
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Column(name = "details")
    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    @Column(name = "rate")
    public Float getRate() {
        return rate;
    }

    public void setRate(Float rate) {
        this.rate = rate;
    }

    @Column(name = "amountWords")
    public String getAmountWords() {
        return amountWords;
    }

    public void setAmountWords(String amountWords) {
        this.amountWords = amountWords;
    }

    @Column(name = "php")
    public Float getPhp() {
        return php;
    }

    public void setPhp(Float php) {
        this.php = php;
    }

    @Column(name = "totalRate")
    public Float getTotalRate() {
        return totalRate;
    }

    public void setTotalRate(Float totalRate) {
        this.totalRate = totalRate;
    }

    @Column(name = "totalFreight")
    public Float getTotalFreight() {
        return totalFreight;
    }

    public void setTotalFreight(Float totalFreight) {
        this.totalFreight = totalFreight;
    }
}
