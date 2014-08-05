package com.sr.apps.freightbit.operations.formbean;

/**
 * Created by Clarence C. Victoria on 8/5/14.
 */
public class OperationsBean {

    private Integer orderItemParam;

    private String nameSizeParam;

    private Integer vendorList;

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

}
