package com.sr.biz.freightbit.operations.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "orderstatuslogs", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "statusId"))
public class OrderStatusLogs implements Serializable {
    private Integer statusId;
    private Integer orderId;
    private Integer orderItemId;
    private String status;
    private String createdBy;
    private Date createdTimestamp;
    private Date actualDate;
    public OrderStatusLogs() {
    }

    public OrderStatusLogs(Integer statusId, Integer orderId, Integer orderItemId, String status, String createdBy, Date createdTimestamp, Date actualDate) {
        this.statusId = statusId;
        this.orderId = orderId;
        this.orderItemId = orderItemId;
        this.status = status;
        this.createdBy = createdBy;
        this.createdTimestamp = createdTimestamp;
        this.actualDate = actualDate;
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

    @Column(name = "orderId")
    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    @Column(name = "orderItemId")
    public Integer getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(Integer orderItemId) {
        this.orderItemId = orderItemId;
    }

    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name = "createdBy")
    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Column(name = "createdTimestamp")
    public Date getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }

    @Column(name = "actualDate")
    public Date getActualDate() {
        return actualDate;
    }

    public void setActualDate(Date actualDate) {
        this.actualDate = actualDate;
    }

}
