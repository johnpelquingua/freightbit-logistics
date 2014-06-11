package com.sr.apps.freightbit.common.formbean;

import com.sr.apps.freightbit.vendor.formbean.DriverBean;
import com.sr.apps.freightbit.vendor.formbean.OtherInformationBean;
import com.sr.apps.freightbit.vendor.formbean.TruckBean;
import com.sr.apps.freightbit.vendor.formbean.VesselBean;

import java.util.List;

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
    /*private List <VesselBean> vesselBeanList;
    private List <TruckBean> truckBeanList;
    private List <DriverBean> driverBeanList;
    private List <AddressBean> addressBeanList;
    private List <ContactBean> contactBeanList;
    private OtherInformationBean otherInformationBean;*/

    public ContactBean() {

    }

    public ContactBean(Integer sessionVendorId, Integer contactId, Integer clientId, String referenceTable, Integer referenceId, String contactType, String firstName, String middleName, String lastName, String phone, String mobile, String fax, String email) {
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
        this.mobile = mobile;
        this.fax = fax;
        this.email = email;
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
}
