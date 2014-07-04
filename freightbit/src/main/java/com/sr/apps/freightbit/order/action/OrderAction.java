package com.sr.apps.freightbit.order.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.sr.apps.freightbit.customer.formbean.CustomerBean;
import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
import com.sr.apps.freightbit.core.formbean.UserBean;
import com.sr.apps.freightbit.customer.formbean.CustomerBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.order.formbean.OrderItemsBean;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;
import org.apache.commons.lang3.StringUtils;

public class OrderAction extends ActionSupport implements Preparable {

	private static final long serialVersionUID = 1L;
	
	private List <OrderBean> orderBeanList;
	private OrderBean orderBean;
	private List <Customer> customerList;
	private List <Parameters> serviceRequirementList;
	private List <Parameters> freightTypeList;
	private List <Parameters> modeOfServiceList;
	private List <Parameters> modeOfPaymentList;
    private List <Parameters> orderSearchList;
	private List <Parameters> notifyByList;
	private List <Contacts> shipperList;
	private List <Contacts> consigneeList;
    private List <CustomerBean> customerBean;

    private Integer orderIdParam;


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

    public String viewOrdersViaSearch() {
        String column = getColumnFilter();
        List<Orders> orderEntityList = new ArrayList<Orders>();

        if (StringUtils.isBlank(column)) {
            orderEntityList = orderService.findOrdersByCriteria(column, orderBean.getOrderKeyword(), getClientId());
        } else {
            orderEntityList = orderService.findAllOrders();
        }

        for (Orders orderElem : orderEntityList) {
			orderBeanList.add(transformToOrderFormBean(orderElem));
		}

        return SUCCESS;
    }

    public String getColumnFilter() {
        String column = "";
        if ("BOOKING NUMBER".equals(orderBean.getOrderSearchCriteria())) {
            column = "orderNumber";
        } else if ("SHIPPER NAME".equals(orderBean.getOrderSearchCriteria())) {
            column = "vendorName";
        } else if ("CONSIGNEE NAME".equals(orderBean.getOrderSearchCriteria())) {
            column = "consigneeCode";
        } else if ("SERVICE MODE".equals(orderBean.getOrderSearchCriteria())) {
            column = "serviceMode";
        } else if ("SERVICE TYPE".equals(orderBean.getOrderSearchCriteria())) {
            column = "serviceType";
        } else if ("STATUS".equals(orderBean.getOrderSearchCriteria())) {
            column = "status";
        }
        return column;
    }
	
	public String loadAddOrderPage() {
		//orderBean.setBookingDate(new Date());
    return SUCCESS;
	}

    public String bookingSearch() {
        return SUCCESS;
    }
	
	public String addOrder() {
    	validateOnSubmit(orderBean);
    	if (hasFieldErrors()){
    		return INPUT;
        }
    	orderService.addOrder(transformToOrderEntityBean(orderBean));
		return SUCCESS;
	}

    public String editOrder(){
        Orders orderEntity = orderService.findOrdersById(orderIdParam);

        validateOnSubmit(orderBean);
        if (hasFieldErrors()){
            return INPUT;
        }
        orderService.updateOrder(orderEntity);
        return SUCCESS;
    }

    public String deleteOrder(){
        return SUCCESS;
    }

	public String loadContactInfoList() {
		shipperList = customerService.findContactByRefIdAndType("SHIPPER", orderBean.getCustomerId());
		consigneeList = customerService.findContactByRefIdAndType("CONSIGNEE", orderBean.getCustomerId());
		return SUCCESS;
	}
	
	private OrderBean transformToOrderFormBean(Orders order) {
		OrderBean orderBean = new OrderBean();
		orderBean.setOrderNo(order.getOrderNumber());
		orderBean.setBookedBy(order.getCreatedBy());
		orderBean.setFreightType(order.getServiceType());
		orderBean.setModeOfService(order.getServiceMode());
        orderBean.setServiceRequirement(order.getServiceRequirement());
		orderBean.setNotifyBy(order.getNotificationType());
		orderBean.setModeOfPayment(order.getPaymentMode());
		orderBean.setBookingDate(order.getOrderDate());
		orderBean.setOrderStatus(order.getOrderStatus());
		orderBean.setOriginationPort(order.getOriginationPort());
		orderBean.setDestinationPort(order.getDestinationPort());
		orderBean.setPickupDate(order.getPickupDate());
		orderBean.setPickupTime(order.getPickupTime());
		orderBean.setDeliveryDate(order.getDeliveryDate());
		orderBean.setDeliveryTime(order.getDeliveryTime());
        orderBean.setBookingDate(new Date());

        List <Customer> customer = customerService.findCustomersByCriteria("customerCode", order.getShipperCode(), getClientId());
		if (customer != null) {
			orderBean.setCustomerName(customer.get(0).getCustomerName());
			orderBean.setShipperCode(customer.get(0).getCustomerCode());
			orderBean.setConsigneeCode(customer.get(0).getCustomerCode());
		}
		
		//Consignee Info
		Contacts consigneeContact = customerService.findContactById(order.getConsigneeContactId());	
		ContactBean contactBean = new ContactBean();
		//contactBean.setName(getFullName(consigneeContact.getFirstName(), consigneeContact.getMiddleName(), consigneeContact.getLastName()));
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
		//contactBean.setName(getFullName(shipperContact.getFirstName(), shipperContact.getMiddleName(), shipperContact.getLastName()));
		contactBean.setEmail(shipperContact.getMobile());
		contactBean.setMobile(shipperContact.getEmail());
		orderBean.setShipperInfoContact(contactBean);
		
		Address shipperAddress = customerService.findAddressById(order.getShipperAddressId());
		addressBean = new AddressBean();
		addressBean.setAddress(getAddress(shipperAddress));
		orderBean.setShipperInfoAddress(addressBean);
		
		//Order Items Bean
		List <OrderItems> orderItems = order.getOrderItems();
		List <OrderItemsBean> orderItemsBean = new ArrayList<OrderItemsBean>();
		for (OrderItems orderItem : orderItems) {
			orderItemsBean.add(transformToOrderItemsFormBean(orderItem));
		}
		orderBean.setOrderItemsBean(orderItemsBean);
		
		return orderBean;
	}

    private CustomerBean transformToCustomerFormBean(Customer customer) {

        CustomerBean formBean = new CustomerBean();
        formBean.setCustomerName(customer.getCustomerName());
        return formBean;
    }
	
	private OrderItemsBean transformToOrderItemsFormBean(OrderItems orderItem) {
		OrderItemsBean orderItemBean = new OrderItemsBean();
		orderItemBean.setCargoDetails(orderItem.getCommodity());
		orderItemBean.setQuantity(orderItem.getQuantity());
		orderItemBean.setClassification(orderItem.getClassification());
		orderItemBean.setDeclaredValue(orderItem.getDeclaredValue());
		orderItemBean.setHeight(orderItem.getHeight());
		orderItemBean.setWidth(orderItem.getWidth());
		orderItemBean.setLength(orderItem.getLength());
		orderItemBean.setWeight(orderItem.getWeight());
		return  orderItemBean;
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
		order.setOriginationPort(orderBean.getOriginationPort());
		order.setDestinationPort(orderBean.getDestinationPort());
		
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
		order.setShipperCode(orderBean.getShipperCode());
		order.setShipperAddressId(orderBean.getShipperInfoAddress().getAddressId());
		order.setShipperContactId(orderBean.getShipperInfoContact().getContactId());
		
		//Consignee Details
		order.setConsigneeCode(orderBean.getConsigneeCode());
		order.setConsigneeAddressId(orderBean.getConsigneeInfoAddress().getAddressId());
		order.setConsigneeContactId(orderBean.getConsigneeInfoContact().getContactId());
		
		//Order Item Details
		List <OrderItems> orderItems = new ArrayList<OrderItems>();
		for (OrderItemsBean orderItemBean: orderBean.getOrderItemsBean()) {
			orderItems.add(transformToOrderItemsEntityBean(orderItemBean));
		}																	  
		order.setOrderItems(orderItems);
		
		return order;
	}
	
	private OrderItems transformToOrderItemsEntityBean(OrderItemsBean orderItemBean) {
		OrderItems orderItem = new OrderItems();
		
		//TO DO: To included OrderItems entity in Order Entity
/*		if (orderItem.getOrderItemId() != null && !("").equals(orderItem.getOrderItemId()))
			orderItem.setOrderItemId(orderItemBean.getOrderItemId());
		
		orderItem.setOrderId(orderItemBean.getOrderId());*/
		orderItem.setCommodity(orderItemBean.getCargoDetails());
		orderItem.setQuantity(orderItemBean.getQuantity());
		orderItem.setClassification(orderItemBean.getClassification());
		orderItem.setDeclaredValue(orderItemBean.getDeclaredValue());
		orderItem.setHeight(orderItemBean.getHeight());
		orderItem.setWidth(orderItemBean.getWidth());
		orderItem.setLength(orderItemBean.getLength());
		orderItem.setWeight(orderItemBean.getWeight());
		return orderItem;
	}
	
    public void validateOnSubmit(OrderBean orderBean) {
    	clearErrorsAndMessages();
       //validate notification type
    }
    
	public List<Contacts> getShipperList() {
		return shipperList;
	}

	public void setShipperList(List<Contacts> shipperList) {
		this.shipperList = shipperList;
	}

	public List<Contacts> getConsigneeList() {
		return consigneeList;
	}

	public void setConsigneeList(List<Contacts> consigneeList) {
		this.consigneeList = consigneeList;
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
		customerList = customerService.findAllCustomer();
		serviceRequirementList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.SERVICE_REQUIREMENT);
		freightTypeList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.FREIGHT_TYPE);
		modeOfPaymentList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.MODE_OF_PAYMENT);
		modeOfServiceList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.MODE_OF_SERVICE);
		notifyByList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.NOTIFY_BY);
        orderSearchList = parameterService.getParameterMap(ParameterConstants.ORDER, ParameterConstants.ORDER_SEARCH);
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

    public List<CustomerBean> getCustomerBean() {
        return customerBean;
    }

    public void setCustomerBean(List<CustomerBean> customerBean) {
        this.customerBean = customerBean;
    }

    public Integer getOrderIdParam() {
        return orderIdParam;
    }

    public void setOrderIdParam(Integer orderIdParam) {
        this.orderIdParam = orderIdParam;
    }

    public List<Parameters> getOrderSearchList() {
        return orderSearchList;
    }

    public void setOrderSearchList(List<Parameters> orderSearchList) {
        this.orderSearchList = orderSearchList;
    }
}
