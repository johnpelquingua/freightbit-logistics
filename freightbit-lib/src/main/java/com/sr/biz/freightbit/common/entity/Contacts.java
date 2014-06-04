package com.sr.biz.freightbit.common.entity;

import com.sr.biz.freightbit.core.entity.Client;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Clarence C. Victoria on 5/26/14.
 */
public class Contacts implements Serializable {
//
    private long contactId;
    private Client client;
    private String referenceTable;
    private int referenceId;
    private String contactType;
    private String firstName;
    private String middleName;
    private String lastName;
    private String phone;
    private String mobile;
    private String fax;
    private String email;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;

    public Contacts() {
    }

    public Contacts(long contactId, Client client, String referenceTable,
                    int referenceId, String contactType, String firstName,
                    String middleName, String lastName, String phone, String mobile,
                    String fax, String email, Date createdTimestamp,
                    String createdBy, Date modifiedTimestamp, String modifiedBy) {
        this.contactId = contactId;
        this.client = client;
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
        this.createdTimestamp = createdTimestamp;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedBy = modifiedBy;
    }


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public long getContactId() {
        return contactId;
    }

    public void setContactId(long contactId) {
        this.contactId = contactId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "CLIENTID", nullable = false)
    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    @Column(name = "referenceTable", nullable = false)
    public String getReferenceTable() {
        return referenceTable;
    }

    public void setReferenceTable(String referenceTable) {
        this.referenceTable = referenceTable;
    }

    @Column(name = "referenceId", nullable = false)
    public int getReferenceId() {
        return referenceId;
    }

    public void setReferenceId(int referenceId) {
        this.referenceId = referenceId;
    }

    @Column(name = "contactType", nullable = false)
    public String getContactType() {
        return contactType;
    }

    public void setContactType(String contactType) {
        this.contactType = contactType;
    }

    @Column(name = "firstName", nullable = false)
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Column(name = "middleName", nullable = false)
    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    @Column(name = "lastName", nullable = false)
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Column(name = "phone", nullable = false)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Column(name = "mobile", nullable = false)
    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    @Column(name = "fax", nullable = false)
    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    @Column(name = "email", nullable = false)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "createdTimestamp", nullable = false)
    public Date getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }

    @Column(name = "createdBy", nullable = false)
    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Column(name = "modifiedTimestamp", nullable = false)
    public Date getModifiedTimestamp() {
        return modifiedTimestamp;
    }

    public void setModifiedTimestamp(Date modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }

    @Column(name = "modifiedBy", nullable = false)
    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
}
