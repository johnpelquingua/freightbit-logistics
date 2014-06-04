package com.sr.apps.freightbit.customer.formbean;

import com.sr.biz.freightbit.core.entity.Client;

import java.util.Date;

/**
 * Created by ADMIN on 5/29/2014.
 */
public class CustomerBean {

    private Integer customerId;
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

    public CustomerBean(){

    }

    public CustomerBean(Integer customerId, String customerCode, String customerName,
                        String customerType, String website, String phone, String mobile,
                        String fax, String email, int dti, int mayorsPermit, int aaf,
                        int signatureCard, Date createdTimestamp, String createdBy,
                        Date modifiedTimestamp, String modifiedBy) {
        this.customerId = customerId;
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

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getDti() {
        return dti;
    }

    public void setDti(int dti) {
        this.dti = dti;
    }

    public int getMayorsPermit() {
        return mayorsPermit;
    }

    public void setMayorsPermit(int mayorsPermit) {
        this.mayorsPermit = mayorsPermit;
    }

    public int getAaf() {
        return aaf;
    }

    public void setAaf(int aaf) {
        this.aaf = aaf;
    }

    public int getSignatureCard() {
        return signatureCard;
    }

    public void setSignatureCard(int signatureCard) {
        this.signatureCard = signatureCard;
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

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
}
