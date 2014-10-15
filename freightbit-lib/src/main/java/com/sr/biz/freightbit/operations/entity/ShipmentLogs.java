package com.sr.biz.freightbit.operations.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by JMXPSX on 10/14/2014.
 */

@Entity
@Table(name = "shipmentlogs"
        , catalog = "freightbit"
        , uniqueConstraints = @UniqueConstraint(columnNames = "orderId")
)

public class ShipmentLogs implements Serializable {
    private Integer shipmentLogId;
    private String activity;
    private Date createdDate;
    private Integer orderId;
    private String createdBy;

    public ShipmentLogs(){

    }

    public ShipmentLogs(Integer shipmentLogId, String activity, Date createdDate, Integer orderId, String createdBy) {
        this.shipmentLogId = shipmentLogId;
        this.activity = activity;
        this.createdDate = createdDate;
        this.orderId = orderId;
        this.createdBy = createdBy;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "shipmentLogId", unique = true)
    public Integer getShipmentLogId() {
        return shipmentLogId;
    }

    public void setShipmentLogId(Integer shipmentLogId) {
        this.shipmentLogId = shipmentLogId;
    }

    @Column(name = "activity")
    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    @Column(name = "createdDate")
    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Column(name = "orderId", unique = true)
    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    @Column(name = "createdBy")
    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }
}

