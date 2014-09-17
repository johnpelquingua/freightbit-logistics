package com.sr.apps.freightbit.customer.formbean;

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
    private String dti;
    private String mayorsPermit;
    private String aaf;
    private String signatureCard;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;
    private String customerKeyword;
    private String customerSearchCriteria;


    public CustomerBean() {

    }

    public CustomerBean(Integer customerId, String customerCode, String customerName, String customerType, String website, String phone, String mobile, String fax, String email, String dti, String mayorsPermit, String aaf, String signatureCard, Date createdTimestamp, String createdBy, Date modifiedTimestamp, String modifiedBy, String customerKeyword, String customerSearchCriteria) {
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
        this.customerKeyword = customerKeyword;
        this.customerSearchCriteria = customerSearchCriteria;
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

    public String getDti() {
        return dti;
    }

    public void setDti(String dti) {
        this.dti = dti;
    }

    public String getMayorsPermit() {
        return mayorsPermit;
    }

    public void setMayorsPermit(String mayorsPermit) {
        this.mayorsPermit = mayorsPermit;
    }

    public String getAaf() {
        return aaf;
    }

    public void setAaf(String aaf) {
        this.aaf = aaf;
    }

    public String getSignatureCard() {
        return signatureCard;
    }

    public void setSignatureCard(String signatureCard) {
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

    public String getCustomerKeyword() {
        return customerKeyword;
    }

    public void setCustomerKeyword(String customerKeyword) {
        this.customerKeyword = customerKeyword;
    }

    public String getCustomerSearchCriteria() {
        return customerSearchCriteria;
    }

    public void setCustomerSearchCriteria(String customerSearchCriteria) {
        this.customerSearchCriteria = customerSearchCriteria;
    }
}
