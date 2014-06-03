package com.sr.biz.freightbit.vendor.entity;

/**
 * Created with IntelliJ IDEA.
 * User: johnpelquingua.com
 * Date: 5/13/14
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
@Table(name = "trailers", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "trailerId"))

public class Trailers implements java.io.Serializable{

    private Integer trailerId;
    private Client client;
    private Vendor vendor;
    private String trailerCode;
    private String trailerType;
    private int trailerLength;
    private float grossWeight;
    private String modelName;
    private int modelYear;
    private int axle;
    private String vin;
    private String plateNumber;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;

    public Trailers(Integer trailerId, Client client, Vendor vendor, String trailerCode, String trailerType,
                    int trailerLength, float grossWeight, String modelName, int modelYear, int axle, String vin,
                    String plateNumber, Date createdTimestamp, String createdBy, Date modifiedTimestamp,
                    String modifiedBy){

        this.trailerId = trailerId;
        this.client = client;
        this.vendor = vendor;
        this.trailerCode = trailerCode;
        this.trailerType = trailerType;
        this.trailerLength = trailerLength;
        this.grossWeight = grossWeight;
        this.modelName = modelName;
        this.modelYear = modelYear;
        this.axle = axle;
        this.vin = vin;
        this.plateNumber = plateNumber;
        this.createdTimestamp = createdTimestamp;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedBy = modifiedBy;
    }

    public Trailers(){}

    @Id
    @GeneratedValue
    @Column(name = "trailerId", unique = true, nullable = false)
    public Integer getTrailerId() {
        return this.trailerId;
    }

    public void setTrailerId(Integer trailerId) {
        this.trailerId = trailerId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clientId", nullable = false)
    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "vendorId")
    public Vendor getVendor() {
        return this.vendor;
    }

    public void setVendor(Vendor vendor) {
        this.vendor = vendor;
    }

    @Column(name = "trailerCode", nullable = false)
    public String getTrailerCode() {
        return this.trailerCode;
    }

    public void setTrailerCode(String trailerCode) {
        this.trailerCode = trailerCode;
    }

    @Column(name = "trailerType", nullable = false)
    public String getTrailerType() {
        return this.trailerType;
    }

    public void setTrailerType(String trailerType) {
        this.trailerType = trailerType;
    }

    @Column(name = "trailerLength", nullable = false)
    public int getTrailerLength() {
        return this.trailerLength;
    }

    public void setTrailerLength(int trailerLength) {
        this.trailerLength = trailerLength;
    }

    @Column(name = "grossWeight", nullable = false)
    public float getGrossWeight() {
        return this.grossWeight;
    }

    public void setGrossWeight(float grossWeight) {
        this.grossWeight = grossWeight;
    }

    @Column(name = "modelName", nullable = false)
    public String getModelName() {
        return this.modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    @Column(name = "modelYear", nullable = false)
    public int getModelYear() {
        return this.modelYear;
    }

    public void setModelYear(int modelYear) {
        this.modelYear = modelYear;
    }

    @Column(name = "axle", nullable = false)
    public int getAxle() {
        return axle;
    }

    public void setAxle(int axle) {
        this.axle = axle;
    }

    @Column(name = "vin", nullable = false)
    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    @Column(name = "plateNumber", nullable = false)
    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    @Column(name = "createdTimestamp", nullable = false)
    public Date getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }

    @Column(name = "createdBy", nullable = false)
    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Column(name = "modifiedTimestamp", nullable = false)
    public Date getModifiedTimestamp() {
        return modifiedTimestamp;
    }

    public void setModifiedTimestamp(Date modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }

    @Column(name = "modifiedBy", nullable = false)
    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
}
