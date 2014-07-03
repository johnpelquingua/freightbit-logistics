package com.sr.biz.freightbit.vendor.entity;

/**
 * Created by ADMIN on 5/16/2014.
 */

import com.sr.biz.freightbit.core.entity.Client;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "vessels", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "vesselId"))
public class Vessel implements Serializable {

    private Integer vesselId;
    private Client clientId;
    private Integer vendorId;
    private String vesselNumber;
    private String vesselName;
    private String modelNumber;
    private Integer modelYear;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;


    public Vessel() {
    }

    public Vessel(Integer vesselId, Client clientId, Integer vendorId, String vesselNumber,
                  String vesselName, String modelNumber, Integer modelYear, Date createdTimestamp,
                  String createdBy, Date modifiedTimestamp, String modifiedBy) {

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
    @Column(name = "vesselId", unique = true)
    public Integer getVesselId() {
        return vesselId;
    }

    public void setVesselId(Integer vesselId) {
        this.vesselId = vesselId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clientId")
    public Client getClientId() {
        return clientId;
    }

    public void setClientId(Client clientId) {
        this.clientId = clientId;
    }

    @Column(name = "vendorId")
    public Integer getVendorId() {
        return vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }

    @Column(name = "vesselNumber")
    public String getVesselNumber() {
        return vesselNumber;
    }

    public void setVesselNumber(String vesselNumber) {
        this.vesselNumber = vesselNumber;
    }

    @Column(name = "vesselName")
    public String getVesselName() {
        return vesselName;
    }

    public void setVesselName(String vesselName) {
        this.vesselName = vesselName;
    }

    @Column(name = "modelNumber")
    public String getModelNumber() {
        return modelNumber;
    }

    public void setModelNumber(String modelNumber) {
        this.modelNumber = modelNumber;
    }

    @Column(name = "modelYear")
    public Integer getModelYear() {
        return modelYear;
    }

    public void setModelYear(Integer modelYear) {
        this.modelYear = modelYear;
    }

    @Column(name = "createdTimestamp")
    public Date getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }

    @Column(name = "createdBy", nullable = true)
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
}
