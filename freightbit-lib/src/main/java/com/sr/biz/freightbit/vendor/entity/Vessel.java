package com.sr.biz.freightbit.vendor.entity;

/**
 * Created by ADMIN on 5/16/2014.
 */

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sr.biz.freightbit.core.entity.Client;

@Entity
@Table(name = "vessels", catalog ="freightbit")

public class Vessel implements Serializable{

    private long vesselId;
    private Client clientId;
    private Vendor vendorId;
    private String vesselNumber;
    private String vesselName;
    private String modelNumber;
    private String modelYear;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;



    public Vessel(){    }

    public Vessel(long vesselId, Client clientId, Vendor vendorId, String vesselNumber,
                  String vesselName, String modelNumber, String modelYear, Date createdTimestamp,
                  String createdBy, Date modifiedTimestamp, String modifiedBy){

        this.vesselId = vesselId;
        this.clientId = clientId;
        this.vendorId = vendorId;
        this.vesselNumber = vesselNumber;
        this.vesselName = vesselName;
        this.modelNumber = modelNumber;
        this.modelYear = modelYear;
        this.createdTimestamp = createdTimestamp;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedBy = modifiedBy;
    }

    @Id
    @GeneratedValue
    @Column(name = "vesselId", unique = true , nullable = false)
    public long getVesselId() {
        return vesselId;
    }
    public void setVesselId(long vesselId) {
        this.vesselId = vesselId;
    }

    @ManyToOne(fetch  = FetchType.EAGER)
    @JoinColumn(name = "clientId", nullable = false)
    public Client getClientId() {
        return clientId;
    }
    public void setClientId(Client clientId) {
        this.clientId = clientId;
    }

    @Column(name = "vendorId", nullable = false)
    public Vendor getVendorId() {
        return vendorId;
    }
    public void setVendorId(Vendor vendorId) {
        this.vendorId = vendorId;
    }

    @Column(name ="vesselNumber", nullable = false)
    public String getVesselNumber() {
        return vesselNumber;
    }
    public void setVesselNumber(String vesselNumber) {
        this.vesselNumber = vesselNumber;
    }

    @Column(name = "vesselName", nullable = false)
    public String getVesselName() {
        return vesselName;
    }
    public void setVesselName(String vesselName) {
        this.vesselName = vesselName;
    }

    @Column(name = "modelNumber", nullable = false)
    public String getModelNumber() {
        return modelNumber;
    }
    public void setModelNumber(String modelNumber) {
        this.modelNumber = modelNumber;
    }

    @Column(name ="modelYear", nullable = false)
    public String getModelYear() {
        return modelYear;
    }
    public void setModelYear(String modelYear) {
        this.modelYear = modelYear;
    }

    @Column(name ="createdTimestamp", nullable = false)
    public Date getCreatedTimestamp() {
        return createdTimestamp;
    }
    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }

    @Column(name ="createdBy", nullable = false)
    public String getCreatedBy() {
        return createdBy;
    }
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Column(name ="modifiedTimestamp", nullable = false)
    public Date getModifiedTimestamp() {
        return modifiedTimestamp;
    }
    public void setModifiedTimestamp(Date modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }

    @Column(name ="modifiedBy", nullable = false)
    public String getModifiedBy() {
        return modifiedBy;
    }
    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }



}
