package com.sr.biz.freightbit.order.entity;
// Generated Jun 4, 2014 9:55:23 PM by Hibernate Tools 3.6.0


import javax.persistence.*;
import java.util.Date;

/**
 * Orderitems generated by hbm2java
 */
@Entity
@Table(name = "orderitems"
        , catalog = "freightbit"
)
public class OrderItems implements java.io.Serializable {


    private Integer orderItemId;
    private Integer clientId;
    private Orders order;
    private Integer quantity;
    private String classification;
    private String commodity;
    private Double declaredValue;
    private Double height;
    private Double width;
    private Double length;
    private Double weight;
    private String comments;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;

    public OrderItems() {
    }

    public OrderItems(Integer clientId, Integer quantity, String classification, String commodity, Double declaredValue, Double height, Double width, Double length, String comments, Date createdTimestamp, String createdBy, Date modifiedTimestamp, String modifiedBy) {
        this.clientId = clientId;
        this.quantity = quantity;
        this.classification = classification;
        this.commodity = commodity;
        this.declaredValue = declaredValue;
        this.height = height;
        this.width = width;
        this.length = length;
        this.comments = comments;
        this.createdTimestamp = createdTimestamp;
        this.createdBy = createdBy;
        this.modifiedTimestamp = modifiedTimestamp;
        this.modifiedBy = modifiedBy;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "orderItemId", unique = true, nullable = false)
    public Integer getOrderItemId() {
        return this.orderItemId;
    }

    public void setOrderItemId(Integer orderItemId) {
        this.orderItemId = orderItemId;
    }


    @Column(name = "clientId", nullable = false)
    public Integer getClientId() {
        return this.clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    @JoinColumn(name = "orderId", nullable = false)
    public Orders getOrder() {
        return this.order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }


    @Column(name = "quantity", nullable = false)
    public Integer getQuantity() {
        return this.quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }


    @Column(name = "classification", nullable = false, length = 10)
    public String getClassification() {
        return this.classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }


    @Column(name = "commodity", nullable = false, length = 100)
    public String getCommodity() {
        return this.commodity;
    }

    public void setCommodity(String commodity) {
        this.commodity = commodity;
    }


    @Column(name = "declaredValue", nullable = false, precision = 12, scale = 0)
    public Double getDeclaredValue() {
        return this.declaredValue;
    }

    public void setDeclaredValue(Double declaredValue) {
        this.declaredValue = declaredValue;
    }


    @Column(name = "height", nullable = false, precision = 12, scale = 0)
    public Double getHeight() {
        return this.height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }


    @Column(name = "width", nullable = false, precision = 12, scale = 0)
    public Double getWidth() {
        return this.width;
    }

    public void setWidth(Double width) {
        this.width = width;
    }


    @Column(name = "length", nullable = false, precision = 12, scale = 0)
    public Double getLength() {
        return this.length;
    }

    public void setLength(Double length) {
        this.length = length;
    }

    @Column(name = "weight", nullable = false, precision = 12, scale = 0)
    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    @Column(name = "comments", nullable = false)
    public String getComments() {
        return this.comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "createdTimestamp", nullable = false, length = 19)
    public Date getCreatedTimestamp() {
        return this.createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }


    @Column(name = "createdBy", nullable = false, length = 10)
    public String getCreatedBy() {
        return this.createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "modifiedTimestamp", nullable = false, length = 19)
    public Date getModifiedTimestamp() {
        return this.modifiedTimestamp;
    }

    public void setModifiedTimestamp(Date modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }


    @Column(name = "modifiedBy", nullable = false, length = 10)
    public String getModifiedBy() {
        return this.modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }


}


