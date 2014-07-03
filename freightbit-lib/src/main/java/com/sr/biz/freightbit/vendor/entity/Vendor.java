package com.sr.biz.freightbit.vendor.entity;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 */

import com.sr.biz.freightbit.core.entity.Client;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "vendors", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "vendorId"))
public class Vendor implements java.io.Serializable {

    private Integer vendorId;
    private Client client;
    private String vendorCode;
    private String vendorName;
    private String vendorType;
    private String vendorClass;
    private String vendorStatus;
    private Date createdTimeStamp;
    private String createdBy;
    private Date modifiedTimeStamp;
    private String modifiedBY;

    public Vendor() {

    }

    public Vendor(Client client, String vendorCode, String vendorName,
                  String vendorType, String vendorClass, String vendorStatus, Date createdTimeStamp,
                  String createdBy, Date modifiedTimeStamp, String modifiedBY) {

        this.client = client;
        this.vendorCode = vendorCode;
        this.vendorName = vendorName;
        this.vendorType = vendorType;
        this.vendorClass = vendorClass;
        this.vendorStatus = vendorStatus;
        this.createdTimeStamp = createdTimeStamp;
        this.createdBy = createdBy;
        this.modifiedTimeStamp = modifiedTimeStamp;
        this.modifiedBY = modifiedBY;
    }


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "vendorId", unique = true)
    public Integer getVendorId() {
        return this.vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clientId")
    public Client getClient() {
        return this.client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    @Column(name = "vendorCode")
    public String getVendorCode() {
        return this.vendorCode;
    }

    public void setVendorCode(String vendorCode) {
        this.vendorCode = vendorCode;
    }

    @Column(name = "vendorName")
    public String getVendorName() {
        return this.vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    @Column(name = "vendorType")
    public String getVendorType() {
        return this.vendorType;
    }

    public void setVendorType(String vendorType) {
        this.vendorType = vendorType;
    }

    @Column(name = "vendorClass")
    public String getVendorClass() {
        return this.vendorClass;
    }

    public void setVendorClass(String vendorClass) {
        this.vendorClass = vendorClass;
    }

    @Column(name = "vendorStatus")
    public String getVendorStatus() {
        return this.vendorStatus;
    }

    public void setVendorStatus(String vendorStatus) {
        this.vendorStatus = vendorStatus;
    }

    @Column(name = "createdTimeStamp")
    public Date getCreatedTimeStamp() {
        return this.createdTimeStamp;
    }

    public void setCreatedTimeStamp(Date createdTimeStamp) {
        this.createdTimeStamp = createdTimeStamp;
    }

    @Column(name = "createdBy")
    public String getCreatedBy() {
        return this.createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Column(name = "modifiedTimeStamp")
    public Date getModifiedTimeStamp() {
        return modifiedTimeStamp;
    }

    public void setModifiedTimeStamp(Date modifiedTimeStamp) {
        this.modifiedTimeStamp = modifiedTimeStamp;
    }

    @Column(name = "modifiedBy")
    public String getModifiedBY() {
        return modifiedBY;
    }

    public void setModifiedBY(String modifiedBY) {
        this.modifiedBY = modifiedBY;
    }
}
