package com.sr.apps.freightbit.operations.formbean;

import java.util.Date;

/**
 * Created by JMXPSX on 10/14/2014.
 */
public class ShipmentLogsBean {

    private Integer shipmentLogId;
    private String activity;
    private Date createdDate;
    private Integer orderId;

    public Integer getShipmentLogId() {
        return shipmentLogId;
    }

    public void setShipmentLogId(Integer shipmentLogId) {
        this.shipmentLogId = shipmentLogId;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }
}