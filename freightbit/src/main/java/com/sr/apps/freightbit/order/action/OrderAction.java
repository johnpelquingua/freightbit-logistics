package com.sr.apps.freightbit.order.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
import com.sr.apps.freightbit.core.formbean.UserBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;

public class OrderAction extends ActionSupport implements Preparable {

	private static final long serialVersionUID = 1L;
	
	private List <OrderBean> orderBeanList;
	private OrderBean orderBean;
	private List <Customer> customerList;
	private List <Parameters> serviceRequirementList;
	private List <Parameters> freightTypeList;
	private List <Parameters> modeOfServiceList;
	private List <Parameters> modeOfPaymentList;
	private List <Parameters> notifyByList;
	
	private OrderService orderService;
	private CustomerService customerService;
	private ParameterService parameterService;
	
	public String viewOrders() {
		List<Orders> orderEntityList = orderService.findAllOrdersByClientId(getClientId());
		for (Orders orderElem : orderEntityList) {
			orderBeanList.add(transformToOrderFormBean(orderElem));
		}
		return SUCCESS;
	}
	
	public String loadAddOrderPage() {
		orderBean.setBookingDate(new Date());
		return SUCCESS;
	}
	
	public String addOrder() {
    	//validateOnSubmit(orderBean);
    	//if (hasFieldErrors())
    	//	return INPUT;
    	orderService.addOrder(transformToOrderEntityBean(orderBean));
		return SUCCESS;
	}
	
	private OrderBean transformToOrderFormBean(Orders order) {
		OrderBean orderBean = new OrderBean();
		orderBean.setOrderNo(order.getOrderNumber());
		orderBean.setBookedBy(order.getCreatedBy());
		orderBean.setFreightType(order.getServiceType());
		orderBean.setModeOfService(order.getServiceMode());
		orderBean.setNotifyBy(order.getNotificationType());
		orderBean.setModeOfPayment(order.getPaymentMode());
		orderBean.setBookingDate(order.getOrderDate());
		orderBean.setOrderStatus(order.getOrderStatus());
		orderBean.setCustomerName("Test");
		
		//Consignee Info
		Contacts consigneeContact = customerService.findContactById(order.getConsigneeContactId());	
		ContactBean contactBean = new ContactBean();
		contactBean.setName(getFullName(consigneeContact.getFirstName(), consigneeContact.getMiddleName(), consigneeContact.getLastName()));
		contactBean.setEmail(consigneeContact.getMobile());
		contactBean.setMobile(consigneeContact.getEmail());
		orderBean.setConsigneeInfoContact(contactBean);
		
		Address consigneeAddress = customerService.findAddressById(order.getConsigneeAddressId());
		AddressBean addressBean = new AddressBean();
		addressBean.setAddress(getAddress(consigneeAddress));
		orderBean.setConsigneeInfoAddress(addressBean);
		
		//Shipper Info
		Contacts shipperContact = customerService.findContactById(order.getShipperContactId());	
	    contactBean = new ContactBean();
		contactBean.setName(getFullName(shipperContact.getFirstName(), shipperContact.getMiddleName(), shipperContact.getLastName()));
		contactBean.setEmail(shipperContact.getMobile());
		contactBean.setMobile(shipperContact.getEmail());
		orderBean.setShipperInfoContact(contactBean);
		
		Address shipperAddress = customerService.findAddressById(order.getShipperAddressId());
		addressBean = new AddressBean();
		addressBean.setAddress(getAddress(shipperAddress));
		orderBean.setShipperInfoAddress(addressBean);

		return orderBean;
	}
	
	private Orders transformToOrderEntityBean(OrderBean orderBean) {
		Orders order = new Orders();
		order.setOrderNumber(orderBean.getOrderNo());
		order.setServiceType(orderBean.getFreightType());
		order.setServiceMode(orderBean.getModeOfService());
		order.setNotificationType(orderBean.getNotifyBy());
		order.setOrderDate(orderBean.getBookingDate());
		order.setPaymentMode(orderBean.getModeOfPayment());
		order.setOrderStatus(orderBean.getOrderStatus());
		
		User loggedInUser = getUser();
		if(StringUtils.isBlank(orderBean.getBookedBy())) { //A NULL Booked By field means, the Order is NEW and not an edit
			order.setCreatedBy(loggedInUser.getUsername());
			order.setAccountRep(loggedInUser.getUsername());			
		} else {
			order.setCreatedBy(orderBean.getBookedBy());
			order.setAccountRep(orderBean.getBookedBy());
		}
		order.setModifiedBy(loggedInUser.getUsername());
		
		//Shipper Details
		order.setShipperCode("WHAT");
		Address shipperAddress = customerService.findAddressByRefIdAndType("SHIPPER", orderBean.getCustomerId());
		order.setShipperAddressId(shipperAddress.getAddressId());
		Contacts shipperContact = customerService.findContactByRefIdAndType("SHIPPER", orderBean.getCustomerId());
		order.setShipperContactId(shipperContact.getContactId());
		
		//Consignee Details
		Address consigneeAddress = customerService.findAddressByRefIdAndType("SHIPPER", orderBean.getCustomerId());
		order.setConsigneeAddressId(consigneeAddress.getAddressId());
		Contacts consigneeContact = customerService.findContactByRefIdAndType("SHIPPER", orderBean.getCustomerId());
		order.setConsigneeContactId(consigneeContact.getContactId());
		
		return order;
	}
	
    public void validateOnSubmit(UserBean userBean) {
    	clearErrorsAndMessages();
       //validate notification type
    }
    
	private Integer getClientId() {
		Map sessionAttributes = ActionContext.getContext().getSession();
    	Integer clientId = (Integer) sessionAttributes.get("clientId");
		return clientId;
	}
	
	private User getUser() {
		Map sessionAttributes = ActionContext.getContext().getSession();
    	return (User) sessionAttributes.get("clientId");
	}
	
	private String getFullName(String firstName, String middleName, String lastName) {
		StringBuilder fullName = new StringBuilder("");
		if (StringUtils.isNotBlank(firstName)) {
			fullName.append(firstName);
		} 
		if (StringUtils.isNotBlank(middleName)) {
			fullName.append(middleName);
		}
		if (StringUtils.isNotBlank(lastName)) {
			fullName.append(lastName);
		}
		return fullName.toString();
	}
	
	private String getAddress(Address address) {
		StringBuilder fullAddress = new StringBuilder("");
		if (StringUtils.isNotBlank(address.getAddressLine1()))
			fullAddress.append(address.getAddressLine1());
		if (StringUtils.isNotBlank(address.getAddressLine2()))
			fullAddress.append(address.getAddressLine2());
		if (StringUtils.isNotBlank(address.getCity()))
			fullAddress.append(address.getCity());
		if (StringUtils.isNotBlank(address.getState()))
			fullAddress.append(address.getState());
		if (StringUtils.isNotBlank(address.getZip()))
			fullAddress.append(address.getZip());
		return fullAddress.toString();		
	}
	
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		customerList = customerService.findCustomerByClientId(getClientId());
		serviceRequirementList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.SERVICE_REQUIREMENT);
		freightTypeList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.FREIGHT_TYPE);
		modeOfPaymentList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.MODE_OF_PAYMENT);
		modeOfServiceList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.MODE_OF_SERVICE);
		notifyByList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.NOTIFY_BY);
	}
	
	public List<OrderBean> getOrderBeanList() {
		return orderBeanList;
	}

	public void setOrderBeanList(List<OrderBean> orderBeanList) {
		this.orderBeanList = orderBeanList;
	}

	public OrderBean getOrderBean() {
		return orderBean;
	}

	public void setOrderBean(OrderBean orderBean) {
		this.orderBean = orderBean;
	}

	public List<Customer> getCustomerList() {
		return customerList;
	}

	public void setCustomerList(List<Customer> customerList) {
		this.customerList = customerList;
	}

	public List<Parameters> getServiceRequirementList() {
		return serviceRequirementList;
	}

	public void setServiceRequirementList(List<Parameters> serviceRequirementList) {
		this.serviceRequirementList = serviceRequirementList;
	}

	public List<Parameters> getFreightTypeList() {
		return freightTypeList;
	}

	public void setFreightTypeList(List<Parameters> freightTypeList) {
		this.freightTypeList = freightTypeList;
	}

	public List<Parameters> getModeOfServiceList() {
		return modeOfServiceList;
	}

	public void setModeOfServiceList(List<Parameters> modeOfServiceList) {
		this.modeOfServiceList = modeOfServiceList;
	}

	public List<Parameters> getModeOfPaymentList() {
		return modeOfPaymentList;
	}

	public void setModeOfPaymentList(List<Parameters> modeOfPaymentList) {
		this.modeOfPaymentList = modeOfPaymentList;
	}

	public List<Parameters> getNotifyByList() {
		return notifyByList;
	}

	public void setNotifyByList(List<Parameters> notifyByList) {
		this.notifyByList = notifyByList;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	public void setParameterService(ParameterService parameterService) {
		this.parameterService = parameterService;
	}


}
