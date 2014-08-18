package com.sr.apps.freightbit.operations.formbean;

/**
 * Created by Clarence C. Victoria on 8/5/14.
 */
public class OperationsBean {

    private Integer orderItemParam;
    private String nameSizeParam;
    private Integer vendorList;
    private Integer orderId;
    private String vendorCode;
    private String driverCode;
    private String truckCode;

    public Integer getVendorList() {
        return vendorList;
    }

    public void setVendorList(Integer vendorList) {
        this.vendorList = vendorList;
    }

    public String getNameSizeParam() {
        return nameSizeParam;
    }

    public void setNameSizeParam(String nameSizeParam) {
        this.nameSizeParam = nameSizeParam;
    }

    public Integer getOrderItemParam() {
        return orderItemParam;
    }

    public void setOrderItemParam(Integer orderItemParam) {
        this.orderItemParam = orderItemParam;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getVendorCode() {
        return vendorCode;
    }

    public void setVendorCode(String vendorCode) {
        this.vendorCode = vendorCode;
    }

    public String getDriverCode() {
        return driverCode;
    }

    public void setDriverCode(String driverCode) {
        this.driverCode = driverCode;
    }

    public String getTruckCode() {
        return truckCode;
    }

    public void setTruckCode(String truckCode) {
        this.truckCode = truckCode;
    }
}
