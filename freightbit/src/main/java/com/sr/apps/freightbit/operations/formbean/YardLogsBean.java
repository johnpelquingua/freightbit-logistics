package com.sr.apps.freightbit.operations.formbean;

import java.sql.Time;
import java.util.Date;

/**
 * Created by user on 10/21/2014.
 */
public class YardLogsBean {


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


    private YardLogsBean(){

    }

    public YardLogsBean(Integer yardlogsId, Integer clientId, Integer addressId, Time gateInTime, Date gateInDate, Date gateOutDate, Time gateoutTime, String truckCode, String trailerCode, String driverCode, Integer bayNumber, Date createdTimestamp, String createdBy, Date modifiedTimestamp, String modifiedby) {
        this.yardlogsId = yardlogsId;
        this.clientId = clientId;
        this.addressId = addressId;
        this.gateInTime = gateInTime;
        this.gateInDate = gateInDate;
        this.gateOutDate = gateOutDate;
        this.gateoutTime = gateoutTime;
        this.truckCode = truckCode;
        this.trailerCode = trailerCode;
        this.driverCode = driverCode;
        this.bayNumber = bayNumber;
        this.createdTimestamp = createdTimestamp;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedby = modifiedby;
    }

    public Integer getYardlogsId() {
        return yardlogsId;
    }

    public void setYardlogsId(Integer yardlogsId) {
        this.yardlogsId = yardlogsId;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public Date getGateInDate() {
        return gateInDate;
    }

    public void setGateInDate(Date gateInDate) {
        this.gateInDate = gateInDate;
    }

    public Time getGateInTime() {
        return gateInTime;
    }

    public void setGateInTime(Time gateInTime) {
        this.gateInTime = gateInTime;
    }

    public Date getGateOutDate() {
        return gateOutDate;
    }

    public void setGateOutDate(Date gateOutDate) {
        this.gateOutDate = gateOutDate;
    }

    public Time getGateoutTime() {
        return gateoutTime;
    }

    public void setGateoutTime(Time gateoutTime) {
        this.gateoutTime = gateoutTime;
    }

    public String getTruckCode() {
        return truckCode;
    }

    public void setTruckCode(String truckCode) {
        this.truckCode = truckCode;
    }

    public String getTrailerCode() {
        return trailerCode;
    }

    public void setTrailerCode(String trailerCode) {
        this.trailerCode = trailerCode;
    }

    public String getDriverCode() {
        return driverCode;
    }

    public void setDriverCode(String driverCode) {
        this.driverCode = driverCode;
    }

    public Integer getBayNumber() {
        return bayNumber;
    }

    public void setBayNumber(Integer bayNumber) {
        this.bayNumber = bayNumber;
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

    public String getModifiedby() {
        return modifiedby;
    }

    public void setModifiedby(String modifiedby) {
        this.modifiedby = modifiedby;
    }
}
