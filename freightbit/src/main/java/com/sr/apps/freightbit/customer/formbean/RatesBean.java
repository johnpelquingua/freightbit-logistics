package com.sr.apps.freightbit.customer.formbean;

/**
 * Created by Clarence C. Victoria on 6/23/14.
 */
public class RatesBean {
    private Integer customerRateId;
    private Integer customerId;
    private String origin;
    private String destination;
    private Float rate;
    private String rateType;

    public RatesBean() {
    }

    public RatesBean(Integer customerRateId, Integer customerId, String origin, String destination, Float rate, String rateType) {
        this.customerRateId = customerRateId;
        this.customerId = customerId;
        this.origin = origin;
        this.destination = destination;
        this.rate = rate;
        this.rateType = rateType;
    }

    public Integer getCustomerRateId() {
        return customerRateId;
    }

    public void setCustomerRateId(Integer customerRateId) {
        this.customerRateId = customerRateId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public Float getRate() {
        return rate;
    }

    public void setRate(Float rate) {
        this.rate = rate;
    }

    public String getRateType() {
        return rateType;
    }

    public void setRateType(String rateType) {
        this.rateType = rateType;
    }
}
