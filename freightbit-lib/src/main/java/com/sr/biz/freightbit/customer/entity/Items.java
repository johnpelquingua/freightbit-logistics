package com.sr.biz.freightbit.customer.entity;

/**
 * Created by Solutions Resource on 5/26/14.
 */


import com.sr.biz.freightbit.core.entity.Client;

import java.util.Date;
import javax.persistence.*;


@Entity
@Table(name = "customeritems", catalog = "freightbit", uniqueConstraints = @UniqueConstraint(columnNames = "itemCode"))
public class Items implements java.io.Serializable {

    private Integer customerItemsId;
    private Integer clientId;
    private Integer customerId;
    private String itemName;
    private String itemCode;
    private Double length;
    private Double width;
    private Double height;
    private Double srp;
    private Integer criticalQuality;
    private Double weight;
    private String note;
    private String description;
    private Date createdTimeStamp;
    private String createdBy;
    private Date modifiedTimeStamp;
    private String modifiedBy;

    public Items() {

    }

    public Items(Integer customerItemsId, Integer customerId, String itemName, String itemCode, Double length, Double width, Double height, Double srp, Integer criticalQuality, Double weight, String note, String description, Date createdTimeStamp, String createdBy, Date modifiedTimeStamp, String modifiedBy) {
        this.customerItemsId = customerItemsId;
        this.customerId = customerId;
        this.itemName = itemName;
        this.itemCode = itemCode;
        this.length = length;
        this.width = width;
        this.height = height;
        this.srp = srp;
        this.criticalQuality = criticalQuality;
        this.weight = weight;
        this.note = note;
        this.description = description;
        this.createdTimeStamp = createdTimeStamp;
        this.createdBy = createdBy;
        this.modifiedTimeStamp = modifiedTimeStamp;
        this.modifiedBy = modifiedBy;
    }

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "customerItemsId", unique = true, nullable = false)
    public Integer getCustomerItemsId() { return customerItemsId; }
    public void setCustomerItemsId(Integer customerItemsId) { this.customerItemsId = customerItemsId; }

    @Column(name = "clientId")
    public Integer getClientId() { return clientId; }
    public void setClientId(Integer clientId) { this.clientId = clientId; }


    @Column(name = "customerId")
    public Integer getCustomerId() { return customerId; }
    public void setCustomerId(Integer customerId) { this.customerId = customerId; }


    @Column(name = "itemName")
    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }

    @Column(name = "itemCode", nullable = false)
    public String getItemCode() { return itemCode; }
    public void setItemCode(String itemCode) { this.itemCode = itemCode; }

    @Column(name = "length")
    public Double getLength() { return length; }
    public void setLength(Double length) { this.length = length; }

    @Column(name = "width")
    public Double getWidth() { return width; }
    public void setWidth(Double width) { this.width = width; }

    @Column(name = "height")
    public Double getHeight() { return height; }
    public void setHeight(Double height) { this.height = height; }

    @Column(name = "srp")
    public Double getSrp() { return srp; }
    public void setSrp(Double srp) { this.srp = srp; }

    @Column(name = "criticalQuality")
    public Integer getCriticalQuality() { return criticalQuality; }
    public void setCriticalQuality(Integer criticalQuality) { this.criticalQuality = criticalQuality; }

    @Column(name = "weight")
    public Double getWeight() { return weight; }
    public void setWeight(Double weight) { this.weight = weight; }

    @Column(name = "note")
    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }

    @Column(name = "description")
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    @Column(name = "createdTimestamp")
    public Date getCreatedTimeStamp() {
        return createdTimeStamp;
    }

    public void setCreatedTimeStamp(Date createdTimeStamp) {
        this.createdTimeStamp = createdTimeStamp;
    }


    @Column(name = "createdBy" )
    public String getCreatedBy() { return createdBy; }
    public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }

    @Column(name = "modifiedTimestamp")
    public Date getModifiedTimeStamp() {
        return modifiedTimeStamp;
    }

    public void setModifiedTimeStamp(Date modifiedTimeStamp) {
        this.modifiedTimeStamp = modifiedTimeStamp;
    }


    @Column(name = "modifiedBy")
    public String getModifiedBy() { return modifiedBy; }
    public void setModifiedBy(String modifiedBy) { this.modifiedBy = modifiedBy; }

}
