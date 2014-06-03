package com.sr.biz.freightbit.vendor.entity;

/**
 * Created with IntelliJ IDEA.
 * User: johnpelquingua.com
 * Date: 5/13/14
 * Time: 4:43 PM
 * To change this template use File | Settings | File Templates.
 */

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.sr.biz.freightbit.core.entity.Client;

@Entity
@Table(name = "trucks", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "truckId"))

public class Trucks implements java.io.Serializable{

    private long truckId;
    private Client client;
    private Vendor vendor;
    private String truckCode;
    private String truckType;
    private String plateNumber;
    private String modelNumber;
    private int modelYear;
    private String engineNumber;
    private int grossWeight;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;

    public Trucks(long truckId, Client client, Vendor vendor, String truckCode, String truckType,
                  String plateNumber, String modelNumber, int modelYear, String engineNumber,
                  int grossWeight, Date createdTimestamp, String createdBy, Date modifiedTimestamp,
                  String modifiedBy){

        this.truckId = truckId;
        this.client = client;
        this.vendor = vendor;
        this.truckCode = truckCode;
        this.truckType = truckType;
        this.plateNumber = plateNumber;
        this.modelNumber = modelNumber;
        this.modelYear = modelYear;
        this.engineNumber = engineNumber;
        this.grossWeight = grossWeight;
        this.createdTimestamp = createdTimestamp;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedBy = modifiedBy;
    }

    public Trucks(){}

    @Id
    @GeneratedValue
    @Column(name = "truckId", unique = true, nullable = false)
    public long getTruckId() {
        return this.truckId;
    }

    public void setTruckId(long truckId) {
        this.truckId = truckId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clientId", nullable = false)
    public Client getClient() {
        return this.client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "vendorId", nullable = false)
    public Vendor getVendor() {
        return this.vendor;
    }

    public void setVendor(Vendor vendor) {
        this.vendor = vendor;
    }

    @Column(name = "truckCode", nullable = false)
    public String getTruckCode() {
        return this.truckCode;
    }

    public void setTruckCode(String truckCode) {
        this.truckCode = truckCode;
    }

    @Column(name = "truckType")
    public String getTruckType() {
        return this.truckType;
    }

    public void setTruckType(String truckType) {
        this.truckType = truckType;
    }

    @Column(name = "plateNumber")
    public String getPlateNumber() {
        return this.plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    @Column(name = "modelNumber")
    public String getModelNumber() {
        return this.modelNumber;
    }

    public void setModelNumber(String modelNumber) {
        this.modelNumber = modelNumber;
    }

    @Column(name = "modelYear")
    public int getModelYear() {
        return this.modelYear;
    }

    public void setModelYear(int modelYear) {
        this.modelYear = modelYear;
    }

    @Column(name = "engineNumber")
    public String getEngineNumber() {
        return this.engineNumber;
    }

    public void setEngineNumber(String engineNumber) {
        this.engineNumber = engineNumber;
    }

    @Column(name = "grossWeight")
    public int getGrossWeight() {
        return this.grossWeight;
    }

    public void setGrossWeight(int grossWeight) {
        this.grossWeight = grossWeight;
    }

    @Column(name = "createdTimestamp")
    public Date getCreatedTimestamp() {
        return this.createdTimestamp;
    }

    public void setCreatedTimestamp(Date createTimestamp) {
        this.createdTimestamp = createTimestamp;
    }

    @Column(name = "createdBy")
    public String getCreatedBy() {
        return this.createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Column(name = "modifiedTimestamp")
    public Date getModifiedTimestamp() {
        return this.modifiedTimestamp;
    }

    public void setModifiedTimestamp(Date modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }

    @Column(name = "modifiedBy")
    public String getModifiedBy() {
        return this.modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
}
