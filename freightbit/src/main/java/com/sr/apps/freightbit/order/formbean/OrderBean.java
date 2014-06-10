package com.sr.apps.freightbit.order.formbean;

import java.util.Date;
import java.util.List;

import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;

public class OrderBean {
	
	private Integer orderId;
	private String customerName;
	private Integer customerId;
	private String orderNo;
	private Date bookingDate;
	private String freightType;
	private String modeOfService;
	private String modeOfPayment;
	private String notifyBy;
	private String referenceNo;
	private String originalRefNo;
	private String containerNo;
	private String sealNo;
	private String bookedBy;
	private String orderStatus;
	private String shipperCode;
	private String consigneeCode;

	private AddressBean shipperInfoAddress;
	private ContactBean shipperInfoContact;
	private AddressBean consigneeInfoAddress;
	private ContactBean consigneeInfoContact;
	private List <OrderItemsBean> orderItemsBean;
	
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public Date getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}
	public String getFreightType() {
		return freightType;
	}
	public void setFreightType(String freightType) {
		this.freightType = freightType;
	}
	public String getModeOfService() {
		return modeOfService;
	}
	public void setModeOfService(String modeOfService) {
		this.modeOfService = modeOfService;
	}
	public String getModeOfPayment() {
		return modeOfPayment;
	}
	public void setModeOfPayment(String modeOfPayment) {
		this.modeOfPayment = modeOfPayment;
	}
	public String getNotifyBy() {
		return notifyBy;
	}
	public void setNotifyBy(String notifyBy) {
		this.notifyBy = notifyBy;
	}
	public String getReferenceNo() {
		return referenceNo;
	}
	public void setReferenceNo(String referenceNo) {
		this.referenceNo = referenceNo;
	}
	public String getOriginalRefNo() {
		return originalRefNo;
	}
	public void setOriginalRefNo(String originalRefNo) {
		this.originalRefNo = originalRefNo;
	}
	public String getContainerNo() {
		return containerNo;
	}
	public void setContainerNo(String containerNo) {
		this.containerNo = containerNo;
	}
	public String getSealNo() {
		return sealNo;
	}
	public void setSealNo(String sealNo) {
		this.sealNo = sealNo;
	}
	public String getBookedBy() {
		return bookedBy;
	}
	public void setBookedBy(String bookedBy) {
		this.bookedBy = bookedBy;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public AddressBean getShipperInfoAddress() {
		return shipperInfoAddress;
	}
	public void setShipperInfoAddress(AddressBean shipperInfoAddress) {
		this.shipperInfoAddress = shipperInfoAddress;
	}
	public ContactBean getShipperInfoContact() {
		return shipperInfoContact;
	}
	public void setShipperInfoContact(ContactBean shipperInfoContact) {
		this.shipperInfoContact = shipperInfoContact;
	}
	public AddressBean getConsigneeInfoAddress() {
		return consigneeInfoAddress;
	}
	public void setConsigneeInfoAddress(AddressBean consigneeInfoAddress) {
		this.consigneeInfoAddress = consigneeInfoAddress;
	}
	public ContactBean getConsigneeInfoContact() {
		return consigneeInfoContact;
	}
	public void setConsigneeInfoContact(ContactBean consigneeInfoContact) {
		this.consigneeInfoContact = consigneeInfoContact;
	}
	public List<OrderItemsBean> getOrderItemsBean() {
		return orderItemsBean;
	}
	public void setOrderItemsBean(List<OrderItemsBean> orderItemsBean) {
		this.orderItemsBean = orderItemsBean;
	}
	
	
	public String getShipperCode() {
		return shipperCode;
	}
	public void setShipperCode(String shipperCode) {
		this.shipperCode = shipperCode;
	}
	public String getConsigneeCode() {
		return consigneeCode;
	}
	public void setConsigneeCode(String consigneeCode) {
		this.consigneeCode = consigneeCode;
	}
	
}