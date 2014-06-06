package com.sr.apps.freightbit.order.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
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
		return SUCCESS;
	}
	
	public String addOrder() {
		return SUCCESS;
	}
	
	private OrderBean transformToOrderFormBean(Orders order) {
		OrderBean orderBean = new OrderBean();
		orderBean.setBookingDate(new Date());
		orderBean.setOrderNo(order.getOrderNumber());
		orderBean.setOrderStatus(order.getOrderStatus());
		orderBean.setBookedBy(order.getCreatedBy());

		return orderBean;
	}
	
	private Integer getClientId() {
		Map sessionAttributes = ActionContext.getContext().getSession();
    	Integer clientId = (Integer) sessionAttributes.get("clientId");
		return clientId;
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
