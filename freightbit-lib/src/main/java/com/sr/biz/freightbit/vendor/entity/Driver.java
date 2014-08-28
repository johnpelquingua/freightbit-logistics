package com.sr.biz.freightbit.vendor.entity;

import com.sr.biz.freightbit.core.entity.Client;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by JMXPSX on 5/16/14.
 */

@Entity
@Table(name = "drivers", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "driverId"))
public class Driver implements Serializable {

    private Integer driverId;
    //    private Vendor vendor;
    private Integer vendorId;
    private Client client;
    private String driverCode;
    private String licenseNumber;
    private String firstName;
    private String middleName;
    private String lastName;
    private String title;
    private String status;
    private Date dateHired;
    private Date dateTerminated;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;

    public Driver() {
    }

    public Driver(Integer driverId, Integer vendorId, Client client,
                  String driverCode, String licenseNumber, String firstName,
                  String middleName, String lastName, String title, String status,
                  Date dateHired, Date dateTerminated, Date createdTimestamp,
                  String createdBy, Date modifiedTimestamp, String modifiedBy) {
        this.driverId = driverId;
        this.vendorId = vendorId;
        this.client = client;
        this.driverCode = driverCode;
        this.licenseNumber = licenseNumber;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.title = title;
        this.status = status;
        this.dateHired = dateHired;
        this.dateTerminated = dateTerminated;
        this.createdTimestamp = createdTimestamp;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedBy = modifiedBy;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "driverId", unique = true, nullable = false)
    public Integer getDriverId() {
        return this.driverId;
    }

    public void setDriverId(Integer driverId) {
        this.driverId = driverId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clientID", nullable = false)
    public Client getClient() {
        return this.client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    @Column(name = "vendorId")
    public Integer getVendorId() {
        return this.vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }

    @Column(name = "driverCode", unique = true)
    public String getDriverCode() {
        return driverCode;
    }

    public void setDriverCode(String driverCode) {
        this.driverCode = driverCode;
    }

    @Column(name = "licenseNumber", unique = true, nullable = false)
    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    @Column(name = "firstName")
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Column(name = "middleName")
    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    @Column(name = "lastName")
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "dateHired")
    public Date getDateHired() {
        return dateHired;
    }

    public void setDateHired(Date dateHired) {
        this.dateHired = dateHired;
    }

    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "dateTerminated")
    public Date getDateTerminated() {
        return dateTerminated;
    }

    public void setDateTerminated(Date dateTerminated) {
        this.dateTerminated = dateTerminated;
    }

    @Column(name = "createdTimestamp")
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
