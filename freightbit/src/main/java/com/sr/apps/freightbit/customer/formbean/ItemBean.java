package com.sr.apps.freightbit.customer.formbean;

/**
 * Created by ADMIN on 6/5/2014.
 */

import com.sr.biz.freightbit.customer.entity.Customer;

import java.util.Date;

public class ItemBean {

    private Integer customerItemsId;
    private Integer customerId;
    private String itemName;
    private String itemCode;
    private Integer length;
    private Integer width;
    private Integer height;
    private Double srp;
    private Integer criticalQuality;
    private Double basePrice;
    private String note;
    private String description;
    private Date createdTimeStamp;
    private String createdBy;
    private Date modifiedTimeStamp;
    private String modifiedBy;


    public ItemBean() {

    }


    public ItemBean(Integer customerItemsId, Integer customerId, String itemName,
                    String itemCode, Integer length, Integer width,Integer height, Double srp, Integer criticalQuality,
                    Double basePrice, String note, String description, Date createdTimeStamp, String createdBy,
                    Date modifiedTimeStamp, String modifiedBy) {


        this.customerItemsId = customerItemsId;
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

    public Integer getCustomerItemsId() {
        return customerItemsId;
    }

    public void setCustomerItemsId(Integer customerItemsId) {
        this.customerItemsId = customerItemsId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    public Integer getLength() {
        return length;
    }

    public void setLength(Integer length) {
        this.length = length;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public Double getSrp() {
        return srp;
    }

    public void setSrp(Double srp) {
        this.srp = srp;
    }

    public Integer getCriticalQuality() {
        return criticalQuality;
    }

    public void setCriticalQuality(Integer criticalQuality) {
        this.criticalQuality = criticalQuality;
    }

    public Double getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(Double basePrice) {
        this.basePrice = basePrice;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedTimeStamp() {
        return createdTimeStamp;
    }

    public void setCreatedTimeStamp(Date createdTimeStamp) {
        this.createdTimeStamp = createdTimeStamp;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getModifiedTimeStamp() {
        return modifiedTimeStamp;
    }

    public void setModifiedTimeStamp(Date modifiedTimeStamp) {
        this.modifiedTimeStamp = modifiedTimeStamp;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }
}