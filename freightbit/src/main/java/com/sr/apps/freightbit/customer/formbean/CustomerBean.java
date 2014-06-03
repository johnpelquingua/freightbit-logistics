package com.sr.apps.freightbit.customer.formbean;

/**
 * Created by ADMIN on 5/29/2014.
 */
public class CustomerBean {

    private String customerId;
    private String customerName;
    private String customerType;
    private String phone;
    private String email;
    private String website;
    private String mobile;
    private String fax;
    private Boolean dti;
    private Boolean mayorsPermit;
    private Boolean aaf;
    private Boolean signatureCard;

    public CustomerBean(){

    }

    public CustomerBean(String customerId
                       ,String customerName, String phone, String email,
                       String customerType, String website,String mobile, String fax,
                       Boolean dti, Boolean mayorsPermit, Boolean aaf, Boolean signatureCard){
            this.customerId = customerId;
            this.customerName = customerName;
            this.phone = phone;
            this.email = email;
            this.customerType = customerType;
            this.website = website;
            this.mobile = mobile;
            this.fax = fax;
            this.dti = dti;
            this.mayorsPermit = mayorsPermit;
            this.aaf = aaf;
            this.signatureCard = signatureCard;

    }
    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public Boolean getDti() {
        return dti;
    }

    public void setDti(Boolean dti) {
        this.dti = dti;
    }

    public Boolean getMayorsPermit() {
        return mayorsPermit;
    }

    public void setMayorsPermit(Boolean mayorsPermit) {
        this.mayorsPermit = mayorsPermit;
    }

    public Boolean getAaf() {
        return aaf;
    }

    public void setAaf(Boolean aaf) {
        this.aaf = aaf;
    }

    public Boolean getSignatureCard() {
        return signatureCard;
    }

    public void setSignatureCard(Boolean signatureCard) {
        this.signatureCard = signatureCard;
    }
}
