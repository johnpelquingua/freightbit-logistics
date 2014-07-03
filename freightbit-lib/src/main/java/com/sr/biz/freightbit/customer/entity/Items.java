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
    private Client client;
    private Integer customerId;
    private String itemName;
    private String itemCode;
    private Integer length;
    private Integer width;
    private Integer height;
    private Float srp;
    private Integer criticalQuality;
    private Float basePrice;
    private String note;
    private String description;
    private Date createdTimeStamp;
    private String createdBy;
    private Date modifiedTimeStamp;
    private String modifiedBy;

    public Items() {

    }

    public Items(Integer customerItemsId, Client client, Integer customerId, String itemName, String itemCode, Integer length, Integer width, Integer height, Float srp, Integer criticalQuality, Float basePrice, String note, String description, Date createdTimeStamp, String createdBy, Date modifiedTimeStamp, String modifiedBy) {
        this.customerItemsId = customerItemsId;
        this.client = client;
        this.customerId = customerId;
        this.itemName = itemName;
        this.itemCode = itemCode;
        this.length = length;
        this.width = width;
        this.height = height;
        this.srp = srp;
        this.criticalQuality = criticalQuality;
        this.basePrice = basePrice;
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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "clientId", nullable = false)
    public Client getClient() { return client; }
    public void setClient(Client client) { this.client = client; }


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
    public Integer getLength() { return length; }
    public void setLength(Integer length) { this.length = length; }

    @Column(name = "width")
    public Integer getWidth() { return width; }
    public void setWidth(Integer width) { this.width = width; }

    @Column(name = "height")
    public Integer getHeight() { return height; }
    public void setHeight(Integer height) { this.height = height; }

    @Column(name = "srp")
    public Float getSrp() { return srp; }
    public void setSrp(Float srp) { this.srp = srp; }

    @Column(name = "criticalQuality")
    public Integer getCriticalQuality() { return criticalQuality; }
    public void setCriticalQuality(Integer criticalQuality) { this.criticalQuality = criticalQuality; }

    @Column(name = "basePrice")
    public Float getBasePrice() { return basePrice; }
    public void setBasePrice(Float basePrice) { this.basePrice = basePrice; }

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
