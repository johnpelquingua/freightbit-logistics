package com.sr.biz.freightbit.customer.entity;

/**
 * Created by ADMIN on 5/13/14.
 */

import com.sr.biz.freightbit.core.entity.Client;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;


@Entity
@Table(name = "customers", catalog = "freightbit" , uniqueConstraints = @UniqueConstraint(columnNames = "customerId"))

public class Customer implements java.io.Serializable {

    private Integer customerId;
    private Client client;
    private String customerCode;
    private String customerName;
    private String customerType;
    private String website;
    private String phone;
    private String mobile;
    private String fax;
    private String email;
    private int dti;
    private int mayorsPermit;
    private int aaf;
    private int signatureCard;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;

    public Customer() {
    }

    public Customer(Integer customerId, Client client, String customerCode,
                    String customerName, String customerType, String website,
                    String phone, String mobile, String fax, String email,
                    int dti, int mayorsPermit, int aaf, int signatureCard,
                    Date createdTimestamp, String createdBy, Date modifiedTimestamp,
                    String modifiedBy) {
        this.customerId = customerId;
        this.client = client;
        this.customerCode = customerCode;
        this.customerName = customerName;
        this.customerType = customerType;
        this.website = website;
        this.phone = phone;
        this.mobile = mobile;
        this.fax = fax;
        this.email = email;
        this.dti = dti;
        this.mayorsPermit = mayorsPermit;
        this.aaf = aaf;
        this.signatureCard = signatureCard;
        this.createdTimestamp = createdTimestamp;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedBy = modifiedBy;
    }

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "customerId", unique = true)
    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clientId")
    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    @Column(name = "customerCode")
    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    @Column(name = "customerName")
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    @Column(name = "customerType")
    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    @Column(name = "website")
    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Column(name = "mobile")
    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    @Column(name = "fax")
    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "dti")
    public int getDti() {
        return dti;
    }

    public void setDti(int dti) {
        this.dti = dti;
    }

    @Column(name = "mayorsPermit")
    public int getMayorsPermit() {
        return mayorsPermit;
    }

    public void setMayorsPermit(int mayorsPermit) {
        this.mayorsPermit = mayorsPermit;
    }

    @Column(name = "aaf")
    public int getAaf() {
        return aaf;
    }

    public void setAaf(int aaf) {
        this.aaf = aaf;
    }

    @Column(name = "signatureCard")
    public int getSignatureCard() {
        return signatureCard;
    }

    public void setSignatureCard(int signatureCard) {
        this.signatureCard = signatureCard;
    }

    @Column(name = "createdTimeStamp")
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
}
