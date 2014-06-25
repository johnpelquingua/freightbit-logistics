package com.sr.apps.freightbit.common.formbean;

import java.security.Timestamp;

public class ContactBean {

    private Integer sessionVendorId;
    private Integer contactId;
    private Integer clientId;
    private String referenceTable;
    private Integer referenceId;
    private String contactType;
    private String firstName;
    private String middleName;
    private String lastName;
    private String phone;
    private String mobile;
    private String fax;
    private String email;
    private Timestamp createdTimestamp;
    private String createdBy;
    private Timestamp modifiedTimestamp;
    private String modifiedBy;

    public ContactBean() {

    }

    public ContactBean(String mobile, Integer sessionVendorId, Integer contactId, Integer clientId, String referenceTable, Integer referenceId, String contactType, String firstName, String middleName, String lastName, String phone, String fax, String email, Timestamp createdTimestamp, String createdBy, Timestamp modifiedTimestamp, String modifiedBy) {
        this.mobile = mobile;
        this.sessionVendorId = sessionVendorId;
        this.contactId = contactId;
        this.clientId = clientId;
        this.referenceTable = referenceTable;
        this.referenceId = referenceId;
        this.contactType = contactType;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.phone = phone;
        this.fax = fax;
        this.email = email;
        this.createdTimestamp = createdTimestamp;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedBy = modifiedBy;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Integer getContactId() {
        return contactId;
    }

    public void setContactId(Integer contactId) {
        this.contactId = contactId;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public String getReferenceTable() {
        return referenceTable;
    }

    public void setReferenceTable(String referenceTable) {
        this.referenceTable = referenceTable;
    }

    public Integer getReferenceId() {
        return referenceId;
    }

    public void setReferenceId(Integer referenceId) {
        this.referenceId = referenceId;
    }

    public String getContactType() {
        return contactType;
    }

    public void setContactType(String contactType) {
        this.contactType = contactType;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
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

    public Integer getSessionVendorId() {
        return sessionVendorId;
    }

    public void setSessionVendorId(Integer sessionVendorId) {
        this.sessionVendorId = sessionVendorId;
    }

    public Timestamp getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(Timestamp createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Timestamp getModifiedTimestamp() {
        return modifiedTimestamp;
    }

    public void setModifiedTimestamp(Timestamp modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
}
