package com.sr.apps.freightbit.operations.formbean;

import java.util.Date;

/**
 * Created by Clarence C. Victoria on 8/4/14.
 */
public class OrderStatusLogsBean {

    private Integer statusId;
    private Integer orderId;
    private String status;
    private String createdBy;
    private Date createdTimestamp;

    public OrderStatusLogsBean() {
    }

    public OrderStatusLogsBean(Integer statusId, Integer orderId, String status, String createdBy, Date createdTimestamp) {
        this.statusId = statusId;
        this.orderId = orderId;
        this.status = status;
        this.createdBy = createdBy;
        this.createdTimestamp = createdTimestamp;
    }

    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }
}