package com.sr.apps.freightbit.order.formbean;

import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
import com.sr.apps.freightbit.customer.formbean.CustomerBean;

import java.util.Date;
import java.util.List;

public class OrderBean {

	private Integer orderId;
	private String customerName;
	private Integer customerId;
	private String orderNo;
	private Date bookingDate;
	private String freightType;
	private String modeOfService;
	private String modeOfPayment;
    private String serviceRequirement;
	private String notifyBy;
	private String referenceNo;
	private String originalRefNo;
	private String containerNo;
	private String sealNo;
	private String bookedBy;
	private String orderStatus;
	private String shipperCode;
	private String consigneeCode;
    private Date pickupDate;
    /*private Date pickupTime;*/
    private String originationPort;
    private Date deliveryDate;
    /*private Date deliveryTime;*/
    private String destinationPort;
    private Double rates;
    private String orderSearchCriteria;
    private String orderKeyword;
    private String orderNumber;
    private String serviceType;
    private Date orderDate;
    private String comments;
    private String truckCode;
    private String trailerCode;
    private String driverCode;
    private String vesselNumber;
    private Integer shipperAddressId;
    private Integer shipperContactId;
    private String shipperContactName;
    private Integer consigneeContactId;
    private Integer consigneeAddressId;
    private String consigneeName;
    private String accountRep;
    private Date createdTimestamp;
    private String createdBy;
    private Date modifiedTimestamp;
    private String modifiedBy;
    private String vendorCode;
    private Integer consigneeContactPersonId;
    private String consigneeContactName;
    private String documentCheck;
    private Integer documentId;
    private Float orderVolume;
    private Double orderWeight;
    private Integer aging;

	private AddressBean shipperInfoAddress;
	private ContactBean shipperInfoContact;
	private AddressBean consigneeInfoAddress;
	private ContactBean consigneeInfoContact;
	private List <OrderItemsBean> orderItemsBean;
    private List <CustomerBean> customerBean;

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

    public List<CustomerBean> getCustomerBean() {
        return customerBean;
    }

    public void setCustomerBean(List<CustomerBean> customerBean) {
        this.customerBean = customerBean;
    }

    public String getServiceRequirement() {
        return serviceRequirement;
    }

    public void setServiceRequirement(String serviceRequirement) {
        this.serviceRequirement = serviceRequirement;
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
	
	
	public Date getPickupDate() {
		return pickupDate;
	}
	public void setPickupDate(Date pickupDate) {
		this.pickupDate = pickupDate;
	}
	/*public Date getPickupTime() {
		return pickupTime;
	}
	public void setPickupTime(Date pickupTime) {
		this.pickupTime = pickupTime;
	}*/
	public String getOriginationPort() {
		return originationPort;
	}
	public void setOriginationPort(String originationPort) {
		this.originationPort = originationPort;
	}
	public Date getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	/*public Date getDeliveryTime() {
		return deliveryTime;
	}
	public void setDeliveryTime(Date deliveryTime) {
		this.deliveryTime = deliveryTime;
	}*/
	public String getDestinationPort() {
		return destinationPort;
	}
	public void setDestinationPort(String destinationPort) {
		this.destinationPort = destinationPort;
	}
	public Double getRates() {
		return rates;
	}
	public void setRates(Double rates) {
		this.rates = rates;
	}

    public String getOrderSearchCriteria() {
        return orderSearchCriteria;
    }

    public void setOrderSearchCriteria(String orderSearchCriteria) {
        this.orderSearchCriteria = orderSearchCriteria;
    }

    public String getOrderKeyword() {
        return orderKeyword;
    }

    public void setOrderKeyword(String orderKeyword) {
        this.orderKeyword = orderKeyword;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getTruckCode() {
        return truckCode;
    }

    public void setTruckCode(String truckCode) {
        this.truckCode = truckCode;
    }

    public String getTrailerCode() {
        return trailerCode;
    }

    public void setTrailerCode(String trailerCode) {
        this.trailerCode = trailerCode;
    }

    public String getDriverCode() {
        return driverCode;
    }

    public void setDriverCode(String driverCode) {
        this.driverCode = driverCode;
    }

    public String getVesselNumber() {
        return vesselNumber;
    }

    public void setVesselNumber(String vesselNumber) {
        this.vesselNumber = vesselNumber;
    }

    public Integer getShipperAddressId() {
        return shipperAddressId;
    }

    public void setShipperAddressId(Integer shipperAddressId) {
        this.shipperAddressId = shipperAddressId;
    }

    public Integer getConsigneeContactId() {
        return consigneeContactId;
    }

    public void setConsigneeContactId(Integer consigneeContactId) {
        this.consigneeContactId = consigneeContactId;
    }

    public String getAccountRep() {
        return accountRep;
    }

    public void setAccountRep(String accountRep) {
        this.accountRep = accountRep;
    }

    public Date getCreatedTimestamp() {
        return createdTimestamp;
    }

    public void setCreatedTimestamp(Date createdTimestamp) {
        this.createdTimestamp = createdTimestamp;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getModifiedTimestamp() {
        return modifiedTimestamp;
    }

    public void setModifiedTimestamp(Date modifiedTimestamp) {
        this.modifiedTimestamp = modifiedTimestamp;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public Integer getShipperContactId() {
        return shipperContactId;
    }

    public void setShipperContactId(Integer shipperContactId) {
        this.shipperContactId = shipperContactId;
    }

    public Integer getConsigneeAddressId() {
        return consigneeAddressId;
    }

    public void setConsigneeAddressId(Integer consigneeAddressId) {
        this.consigneeAddressId = consigneeAddressId;
    }

    public String getVendorCode() {
        return vendorCode;
    }

    public void setVendorCode(String vendorCode) {
        this.vendorCode = vendorCode;
    }

    public String getShipperContactName() {
        return shipperContactName;
    }

    public void setShipperContactName(String shipperContactName) {
        this.shipperContactName = shipperContactName;
    }

    public String getConsigneeName() {
        return consigneeName;
    }

    public void setConsigneeName(String consigneeName) {
        this.consigneeName = consigneeName;
    }

    public Integer getConsigneeContactPersonId() {
        return consigneeContactPersonId;
    }

    public void setConsigneeContactPersonId(Integer consigneeContactPersonId) {
        this.consigneeContactPersonId = consigneeContactPersonId;
    }

    public String getConsigneeContactName() {
        return consigneeContactName;
    }

    public void setConsigneeContactName(String consigneeContactName) {
        this.consigneeContactName = consigneeContactName;
    }

    public String getDocumentCheck() {
        return documentCheck;
    }

    public void setDocumentCheck(String documentCheck) {
        this.documentCheck = documentCheck;
    }

    public Integer getDocumentId() {
        return documentId;
    }

    public void setDocumentId(Integer documentId) {
        this.documentId = documentId;
    }

    public Integer getAging() {
        return aging;
    }

    public void setAging(Integer aging) {
        this.aging = aging;
    }

    public Float getOrderVolume() {
        return orderVolume;
    }

    public void setOrderVolume(Float orderVolume) {
        this.orderVolume = orderVolume;
    }

    public Double getOrderWeight() {
        return orderWeight;
    }

    public void setOrderWeight(Double orderWeight) {
        this.orderWeight = orderWeight;
    }
}