package com.sr.biz.freightbit.vesselSchedule.entity;

import javax.persistence.*;
import java.io.Serializable;

import java.sql.Time;
import java.util.Date;

/**
 * Created by Clarence C. Victoria on 7/22/14.
 */

@Entity
@Table(name = "vesselschedules", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "vesselScheduleId"))
public class VesselSchedules implements Serializable{

    private Integer vesselScheduleId;
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
    private String voyageNumber;

    public VesselSchedules() {
    }

    public VesselSchedules(Integer vesselScheduleId, Integer clientId, Integer vendorId, String originPort, String departureDate, String departureTime, String destinationPort, String arrivalDate, String arrivalTime, Date createdTimestamp, String createdBy, Date modifiedTimestamp, String modifiedBy, String voyageNumber) {
        this.vesselScheduleId = vesselScheduleId;
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
        this.voyageNumber = voyageNumber;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "vesselScheduleId", unique = true)
    public Integer getVesselScheduleId() {
        return vesselScheduleId;
    }

    public void setVesselScheduleId(Integer vesselScheduleId) {
        this.vesselScheduleId = vesselScheduleId;
    }

    @Column(name = "clientId")
    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    @Column(name = "vendorId")
    public Integer getVendorId() {
        return vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }

    @Column(name = "originPort")
    public String getOriginPort() {
        return originPort;
    }

    public void setOriginPort(String originPort) {
        this.originPort = originPort;
    }

    @Column(name = "departureDate")
    public String getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(String departureDate) {
        this.departureDate = departureDate;
    }

    @Column(name = "departureTime")
    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    @Column(name = "destinationPort")
    public String getDestinationPort() {
        return destinationPort;
    }

    public void setDestinationPort(String destinationPort) {
        this.destinationPort = destinationPort;
    }

    @Column(name = "arrivalDate")
    public String getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(String arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    @Column(name = "arrivalTime")
    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    @Column(name = "createdTimestamp")
    public Date getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }

    @Column(name = "createdBy")
    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Column(name = "modifiedTimestamp")
    public Date getModifiedTimestamp() {
        return modifiedTimestamp;
    }

    public void setModifiedTimestamp(Date modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }

    @Column(name = "modifiedBy")
    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    @Column(name = "voyageNumber")
    public String getVoyageNumber() {
        return voyageNumber;
    }

    public void setVoyageNumber(String voyageNumber) {
        this.voyageNumber = voyageNumber;
    }
}
