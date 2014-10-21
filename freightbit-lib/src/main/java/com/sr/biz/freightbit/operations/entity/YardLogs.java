package com.sr.biz.freightbit.operations.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

/**
 * Created by user on 10/21/2014.
 */
@Entity
@Table(name = "yardlogs", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "yardLogsId"))

public class YardLogs implements Serializable{
    private Integer yardlogsId;
    private Integer clientId;
    private Integer addressId;
    private Date gateInDate;
    private Time gateInTime;
    private Date gateOutDate;
    private Time gateoutTime;
    private String truckCode;
    private String trailerCode;
    private String driverCode;
    private Integer bayNumber;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedby;

    public YardLogs(){

    }


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "yardLogsID", unique = true)
    public Integer getYardlogsId() {
        return yardlogsId;
    }

    public void setYardlogsId(Integer yardlogsId) {
        this.yardlogsId = yardlogsId;
    }

    @Column(name = "clientId", unique = true)
    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }
    @Column(name = "addressId", unique = true)
    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }
    @Column(name = "gateInDate", unique = true)
    public Date getGateInDate() {
        return gateInDate;
    }

    public void setGateInDate(Date gateInDate) {
        this.gateInDate = gateInDate;
    }
    @Column(name = "gateInTime", unique = true)
    public Time getGateInTime() {
        return gateInTime;
    }

    public void setGateInTime(Time gateInTime) {
        this.gateInTime = gateInTime;
    }
    @Column(name = "gateOutDate", unique = true)
    public Date getGateOutDate() {
        return gateOutDate;
    }

    public void setGateOutDate(Date gateOutDate) {
        this.gateOutDate = gateOutDate;
    }
    @Column(name = "gateOutTime", unique = true)
    public Time getGateoutTime() {
        return gateoutTime;
    }

    public void setGateoutTime(Time gateoutTime) {
        this.gateoutTime = gateoutTime;
    }
    @Column(name = "truckCode", unique = true)
    public String getTruckCode() {
        return truckCode;
    }

    public void setTruckCode(String truckCode) {
        this.truckCode = truckCode;
    }
    @Column(name = "trailerCode", unique = true)
    public String getTrailerCode() {
        return trailerCode;
    }

    public void setTrailerCode(String trailerCode) {
        this.trailerCode = trailerCode;
    }
    @Column(name = "driverCode", unique = true)
    public String getDriverCode() {
        return driverCode;
    }

    public void setDriverCode(String driverCode) {
        this.driverCode = driverCode;
    }
    @Column(name = "bayNumebr", unique = true)
    public Integer getBayNumber() {
        return bayNumber;
    }

    public void setBayNumber(Integer bayNumber) {
        this.bayNumber = bayNumber;
    }
    @Column(name = "createdTimestamp", unique = true)
    public Date getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }
    @Column(name = "createdBy", unique = true)
    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }
    @Column(name = "modifiedTimestamp", unique = true)
    public Date getModifiedTimestamp() {
        return modifiedTimestamp;
    }

    public void setModifiedTimestamp(Date modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }
    @Column(name = "ModifiedBy", unique = true)
    public String getModifiedby() {
        return modifiedby;
    }

    public void setModifiedby(String modifiedby) {
        this.modifiedby = modifiedby;
    }
}
