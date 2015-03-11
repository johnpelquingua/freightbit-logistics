package com.sr.apps.freightbit.customer.formbean;

import java.util.Date;

public class ConsigneeBean {

    private Integer addressId;
    private Integer contactId;
    private String firstName;
    private String middleName;
    private String lastName;
    private String phone;
    private String mobile;
    private String email;
    private String fax;
    private String addressType;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private String zip;
    private Integer referenceId1;
    private Integer referenceId2;
    private Date createdTimeStamp1;
    private String createdBy1;
    private Date createdTimeStamp2;
    private String createdBy2;
    private Integer contactReferenceId;
    private String companyName;

    public ConsigneeBean() {
    }

    public ConsigneeBean(String fax, Integer addressId, Integer contactId, String firstName, String middleName, String lastName, String phone, String mobile, String email, String addressType, String addressLine1, String addressLine2, String city, String state, String zip, Integer referenceId1, Integer referenceId2, Date createdTimeStamp1, String createdBy1, Date createdTimeStamp2, String createdBy2, Integer contactReferenceId, String companyName) {
        this.fax = fax;
        this.addressId = addressId;
        this.contactId = contactId;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.phone = phone;
        this.mobile = mobile;
        this.email = email;
        this.addressType = addressType;
        this.addressLine1 = addressLine1;
        this.addressLine2 = addressLine2;
        this.city = city;
        this.state = state;
        this.zip = zip;
        this.referenceId1 = referenceId1;
        this.referenceId2 = referenceId2;
        this.createdTimeStamp1 = createdTimeStamp1;
        this.createdBy1 = createdBy1;
        this.createdTimeStamp2 = createdTimeStamp2;
        this.createdBy2 = createdBy2;
        this.contactReferenceId = contactReferenceId;
        this.companyName = companyName;
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

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddressType() {
        return addressType;
    }

    public void setAddressType(String addressType) {
        this.addressType = addressType;
    }

    public String getAddressLine1() {
        return addressLine1;
    }

    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }

    public String getAddressLine2() {
        return addressLine2;
    }

    public void setAddressLine2(String addressLine2) {
        this.addressLine2 = addressLine2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public Integer getContactId() {
        return contactId;
    }

    public void setContactId(Integer contactId) {
        this.contactId = contactId;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public Date getCreatedTimeStamp1() {
        return createdTimeStamp1;
    }

    public void setCreatedTimeStamp1(Date createdTimeStamp1) {
        this.createdTimeStamp1 = createdTimeStamp1;
    }

    public String getCreatedBy1() {
        return createdBy1;
    }

    public void setCreatedBy1(String createdBy1) {
        this.createdBy1 = createdBy1;
    }

    public Date getCreatedTimeStamp2() {
        return createdTimeStamp2;
    }

    public void setCreatedTimeStamp2(Date createdTimeStamp2) {
        this.createdTimeStamp2 = createdTimeStamp2;
    }

    public String getCreatedBy2() {
        return createdBy2;
    }

    public void setCreatedBy2(String createdBy2) {
        this.createdBy2 = createdBy2;
    }

    public Integer getReferenceId1() {
        return referenceId1;
    }

    public void setReferenceId1(Integer referenceId1) {
        this.referenceId1 = referenceId1;
    }

    public Integer getReferenceId2() {
        return referenceId2;
    }

    public void setReferenceId2(Integer referenceId2) {
        this.referenceId2 = referenceId2;
    }

    public Integer getContactReferenceId() {
        return contactReferenceId;
    }

    public void setContactReferenceId(Integer contactReferenceId) {
        this.contactReferenceId = contactReferenceId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
}
