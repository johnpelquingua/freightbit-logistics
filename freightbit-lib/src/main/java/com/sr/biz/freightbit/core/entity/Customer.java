package com.sr.biz.freightbit.core.entity;

/**
 * Created by ADMIN on 5/13/14.
 */

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;


@Entity
@Table(name = "customers", catalog = "freightbit")

public class Customer implements java.io.Serializable {

    private long customerId;
    private Client client;
    private String customerName;
    private String customerType;
    private String website;
    private String phone;
    private String mobile;
    private String fax;
    private String email;
    private boolean dti;
    private boolean mayorsPermit;
    private boolean aaf;
    private boolean signatureCard;
    private Date createdTime;
    private String createdBy;
    private Date modifiedTimeStamp;
    private String modifiedBy;


    public Customer(){
    }

    public Customer(long customerId,Client client, String customerName, String customerType,
                    String website, String phone,
                    String mobile, String fax,
                    String email, boolean dti,
                    boolean mayorsPermit, boolean aaf,
                    boolean signatureCard, Date createdTime,
                    String createdBy, Date modifiedTimeStamp,
                    String modifiedBy){

        this.customerId = customerId;
        this.client = client;
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
        this.createdTime = createdTime;
        this.createdBy = createdBy;
        this.modifiedTimeStamp = modifiedTimeStamp;
        this.modifiedBy = modifiedBy;
    }


    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "customerId", unique = true )
    public long getCustomerId() {
        return customerId;
    }
    public void setCustomerId(long customerId) {
        this.customerId = customerId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clientId" )
    public Client getClient() {
        return this.client;
    }
    public void setClient(Client client) {
        this.client = client;
    }

    @Column(name = "customerName")
    public String getCustomerName() {
        return customerName;
    }
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    @Column(name = "customerType", nullable = false)
    public String getCustomerType() {
        return customerType;
    }
    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    @Column(name = "website", unique = true)
    public String getWebsite() {
        return website;
    }
    public void setWebsite(String website) {
        this.website = website;
    }

    @Column(name = "phone", unique = true)
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Column(name ="mobile", unique = true )
    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    @Column(name ="fax", unique = true )
    public String getFax() {
        return fax;
    }
    public void setFax(String fax) {
        this.fax = fax;
    }

    @Column(name ="email", unique = true , nullable = true)
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name ="dti",unique = true)
    public boolean isDti() {
        return dti;
    }
    public void setDti(boolean dti) {
        this.dti = dti;
    }

    @Column(name ="mayorsPermit", unique = true)
    public boolean isMayorsPermit() {
        return mayorsPermit;
    }
    public void setMayorsPermit(boolean mayorsPermit) {
        this.mayorsPermit = mayorsPermit;
    }

    @Column(name ="aaf", unique = true)
    public boolean isAaf() {
        return aaf;
    }
    public void setAaf(boolean aaf) {
        this.aaf = aaf;
    }

    @Column(name ="signatureCard", unique = true)
    public boolean isSignatureCard() {
        return signatureCard;
    }
    public void setSignatureCard(boolean signatureCard) {
        this.signatureCard = signatureCard;
    }

    @Column(name ="createdTimestamp")
    public Date getCreatedTime() {
        return createdTime;
    }
    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    @Column(name ="createdBy")
    public String getCreatedBy() {
        return createdBy;
    }
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Column(name ="modifiedTimeStamp")
    public Date getModifiedTimeStamp() {
        return modifiedTimeStamp;
    }
    public void setModifiedTimeStamp(Date modifiedTimeStamp) {
        this.modifiedTimeStamp = modifiedTimeStamp;
    }

    @Column(name ="modifiedBy")
    public String getModifiedBy() {
        return modifiedBy;
    }
    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

}
