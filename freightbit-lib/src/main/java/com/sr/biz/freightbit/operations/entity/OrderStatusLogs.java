package com.sr.biz.freightbit.operations.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Clarence C. Victoria on 7/30/14.
 */
@Entity
@Table(name = "orderstatuslogs", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "statusId"))
public class OrderStatusLogs implements Serializable {
    private Integer statusId;
    private Integer orderId;
    private Integer orderItemId;
    private String status;
    private String createdBy;
    private Date createdTimestamp;

    public OrderStatusLogs() {
    }

    public OrderStatusLogs(Integer statusId, Integer orderId, Integer orderItemId, String status, String createdBy, Date createdTimestamp) {
        this.statusId = statusId;
        this.orderId = orderId;
        this.orderItemId = orderItemId;
        this.status = status;
        this.createdBy = createdBy;
        this.createdTimestamp = createdTimestamp;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "statusId", unique = true)
    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    @Column(name = "orderId", unique = true)
    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    @Column(name = "orderItemId", unique = true)
    public Integer getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(Integer orderItemId) {
        this.orderItemId = orderItemId;
    }

    @Column(name = "status", unique = true)
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "createdBy", unique = true)
    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Column(name = "createdTimestamp", unique = true)
    public Date getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }
}
