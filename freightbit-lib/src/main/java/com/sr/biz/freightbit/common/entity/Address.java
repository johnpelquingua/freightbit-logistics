package com.sr.biz.freightbit.common.entity;

import com.sr.biz.freightbit.core.entity.Client;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;


/**
 * Created by Solutions Resource on 5/28/14.
 */

@Entity
@Table(name = "address", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "addressId"))
public class Address implements java.io.Serializable {



    private Integer addressId;
    private Client clientId;
    private String referenceTable;
    private Integer referenceId;
    private String addressType;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private String zip;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;

    public Address(){

    }

    public Address(Integer addressId, Client clientId, String referenceTable, Integer referenceId,
                   String addressType, String addressLine1, String addressLine2, String city, String state,
                   String zip, Date createdTimestamp, String createdBy, Date modifiedTimestamp, String modifiedBy) {
        this.addressId = addressId;
        this.clientId = clientId;
        this.referenceTable = referenceTable;
        this.referenceId = referenceId;
        this.addressType = addressType;
        this.addressLine1 = addressLine1;
        this.addressLine2 = addressLine2;
        this.city = city;
        this.state = state;
        this.zip = zip;
        this.createdTimestamp = createdTimestamp;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedBy = modifiedBy;
    }

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "addressId", unique = true, nullable = false)
    public Integer getAddressId() { return addressId; }
    public void setAddressId(Integer addressId) { this.addressId = addressId; }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clientId", nullable = false)
    public Client getClientId() { return clientId; }
    public void setClientId(Client clientId) { this.clientId = clientId; }

    @Column(name = "referenceTable")
    public String getReferenceTable() { return referenceTable; }
    public void setReferenceTable(String referenceTable) { this.referenceTable = referenceTable; }

    @Column(name = "referenceId")
    public Integer getReferenceId() { return referenceId; }
    public void setReferenceId(Integer referenceId) { this.referenceId = referenceId; }

    @Column(name = "addressType")
    public String getAddressType() { return addressType; }
    public void setAddressType(String addressType) { this.addressType = addressType; }

    @Column(name = "addressLine1")
    public String getAddressLine1() { return addressLine1; }
    public void setAddressLine1(String addressLine1) { this.addressLine1 = addressLine1; }

    @Column(name = "addressLine2")
    public String getAddressLine2() { return addressLine2; }
    public void setAddressLine2(String addressLine2) { this.addressLine2 = addressLine2; }

    @Column(name = "city")
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    @Column(name = "state")
    public String getState() { return state; }
    public void setState(String state) { this.state = state; }

    @Column(name = "zip")
    public String getZip() { return zip; }
    public void setZip(String zip) { this.zip = zip; }

    @Column(name = "createdTimestamp")
    public Date getCreatedTimestamp() { return createdTimestamp; }
    public void setCreatedTimestamp(Date createdTimestamp) { this.createdTimestamp = createdTimestamp; }

    @Column(name = "createdBy")
    public String getCreatedBy() { return createdBy; }
    public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }

    @Column(name = "modifiedTimestamp")
    public Date getModifiedTimestamp() { return modifiedTimestamp; }
    public void setModifiedTimestamp(Date modifiedTimestamp) { this.modifiedTimestamp = modifiedTimestamp; }

    @Column(name = "modifiedBy")
    public String getModifiedBy() { return modifiedBy; }
    public void setModifiedBy(String modifiedBy) { this.modifiedBy = modifiedBy; }



}
