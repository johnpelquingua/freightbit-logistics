package com.sr.apps.freightbit.operations.formbean;

import java.util.Date;

/**
 * Created by Clarence C. Victoria on 7/23/14.
 */
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

    public VesselScheduleBean() {

    }

    public VesselScheduleBean(Integer vesselScheduleId, String voyageNumber, Integer clientId, Integer vendorId, String originPort, String departureDate, String departureTime, String destinationPort, String arrivalDate, String arrivalTime, Date createdTimestamp, String createdBy, Date modifiedTimestamp, String modifiedBy, String vesselScheduleKeyword, String vesselScheduleCriteria) {
        this.vesselScheduleId = vesselScheduleId;
        this.voyageNumber = voyageNumber;
        this.clientId = clientId;
        this.vendorId = vendorId;
        this.originPort = originPort;
        this.departureDate = departureDate;
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
}
