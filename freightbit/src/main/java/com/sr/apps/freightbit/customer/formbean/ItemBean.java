package com.sr.apps.freightbit.customer.formbean;

/**
 * Created by ADMIN on 6/5/2014.
 */

import java.util.Date;

public class ItemBean {

    private Integer customerItemsId;
    private Integer customerId;
    private String itemName;
    private String itemCode;
    private Double length;
    private Double width;
    private Double height;
    private Float srp;
    private Integer criticalQuality;
    private Float weight;
    private String note;
    private String description;
    private Date createdTimeStamp;
    private String createdBy;
    private Date modifiedTimeStamp;
    private String modifiedBy;


    public ItemBean() {

    }


    public ItemBean(Integer customerItemsId, Integer customerId, String itemName,
                    String itemCode, Double length, Double width, Double height, Float srp, Integer criticalQuality,
                    Float weight, String note, String description, Date createdTimeStamp, String createdBy,
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
        this.weight = weight;
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

    public Double getLength() {
        return length;
    }

    public void setLength(Double length) {
        this.length = length;
    }

    public Double getWidth() {
        return width;
    }

    public void setWidth(Double width) {
        this.width = width;
    }

    public Double getHeight() {
        return height;
    }

    public void setHeight(Double height) {
        this.height = height;
    }

    public Float getSrp() {
        return srp;
    }

    public void setSrp(Float srp) {
        this.srp = srp;
    }

    public Integer getCriticalQuality() {
        return criticalQuality;
    }

    public void setCriticalQuality(Integer criticalQuality) {
        this.criticalQuality = criticalQuality;
    }

    public Float getWeight() {
        return weight;
    }

    public void setWeight(Float weight) {
        this.weight = weight;
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
