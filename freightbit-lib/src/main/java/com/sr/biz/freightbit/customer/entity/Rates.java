package com.sr.biz.freightbit.customer.entity;

import com.sr.biz.freightbit.core.entity.Client;

import javax.persistence.*;
import java.util.Date;


/**
 * Created by Solutions Resource on 5/27/14.
 */

@Entity
@Table(name = "customerrates", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "customerRateId"))
public class Rates implements java.io.Serializable {

    private Integer customerRateId;
    private Client clientId;
    private Integer customerId;
    private String origin;
    private String destination;
    private Float rate;
    private String rateType;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;

    public Rates() {

    }

    public Rates(Integer customerRateId, Client clientId, Integer customerId, String origin,
                 String destination, Float rate, String rateType, Date createdTimestamp,
                 String createdBy, Date modifiedTimestamp, String modifiedBy) {
        this.customerRateId = customerRateId;
        this.clientId = clientId;
        this.customerId = customerId;
        this.origin = origin;
        this.destination = destination;
        this.rate = rate;
        this.rateType = rateType;
        this.createdTimestamp = createdTimestamp;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedBy = modifiedBy;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "customerRateId", unique = true, nullable = false)
    public Integer getCustomerRateId() {
        return customerRateId;
    }

    public void setCustomerRateId(Integer customerRateId) {
        this.customerRateId = customerRateId;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clientId", nullable = false)
    public Client getClientId() {
        return clientId;
    }

    public void setClientId(Client clientId) {
        this.clientId = clientId;
    }

    @Column(name = "customerId", nullable = false)
    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    @Column(name = "origin")
    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    @Column(name = "destination", nullable = false)
    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    @Column(name = "rate", nullable = false)
    public Float getRate() {
        return rate;
    }

    public void setRate(Float rate) {
        this.rate = rate;
    }

    @Column(name = "rateType", nullable = false)
    public String getRateType() {
        return rateType;
    }

    public void setRateType(String rateType) {
        this.rateType = rateType;
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
