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
    private static final String ALPHA_NUM = "0123456789";
    private static final Integer compcode = 4;
    //test data should be getCompanyCode(); -jp
    private static final String COMPANY_CODE = "SRI";

    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private List<OrderItemsBean> orderItems = new ArrayList<OrderItemsBean>();
    private OrderBean order = new OrderBean();
    private ContactBean contact = new ContactBean();
    private AddressBean address = new AddressBean();
    private List<Customer> customerList = new ArrayList<Customer>();
    private List<Parameters> serviceRequirementList = new ArrayList<Parameters>();
    private List<Parameters> freightTypeList = new ArrayList<Parameters>();
    private List<Parameters> modeOfServiceList = new ArrayList<Parameters>();
    private List<Parameters> modeOfPaymentList = new ArrayList<Parameters>();
    private List<Parameters> orderSearchList = new ArrayList<Parameters>();
    private List<Parameters> notifyByList = new ArrayList<Parameters>();
    private List<Contacts> shipperList = new ArrayList<Contacts>();
    private List<Contacts> consigneeList = new ArrayList<Contacts>();
    private List<CustomerBean> customerBean = new ArrayList<CustomerBean>();

    private Integer orderIdParam;

    private OrderService orderService;
    private CustomerService customerService;
    private ParameterService parameterService;

    public String viewOrders() {
        String column = getColumnFilter();
        List<Orders> orderEntityList = new ArrayList<Orders>();
        if (StringUtils.isNotBlank(column)) {
            orderEntityList = orderService.findOrdersByCriteria(column, order.getOrderKeyword(), getClientId());
        } else {
            orderEntityList = orderService.findAllOrders();
        }

        for (Orders orderElem : orderEntityList) {
            orders.add(transformToOrderFormBean(orderElem));
        }
        return SUCCESS;
    }

    public String getColumnFilter() {
        String column = "";
        if (order == null) {
            System.out.println("ok");
            return column;
        } else {
            if ("BOOKING NUMBER".equals(order.getOrderSearchCriteria())) {
                column = "orderNumber";
            } else if ("SHIPPER NAME".equals(order.getOrderSearchCriteria())) {
                column = "shipperCode";
            } else if ("CONSIGNEE NAME".equals(order.getOrderSearchCriteria())) {
                column = "consigneeCode";
            } else if ("SERVICE MODE".equals(order.getOrderSearchCriteria())) {
                column = "serviceMode";
            } else if ("SERVICE TYPE".equals(order.getOrderSearchCriteria())) {
                column = "serviceType";
            } else if ("STATUS".equals(order.getOrderSearchCriteria())) {
                column = "orderStatus";
            }
            return column;
        }

    }

    public String loadAddOrderPage() {

        return SUCCESS;
    }

    public String bookingSearch() {
        return SUCCESS;
    }

    public String addOrder() {
        validateOnSubmit(order);
        if (hasFieldErrors()) {
            return INPUT;
        }
        orderService.addOrder(transformToOrderEntityBean(order));
        return SUCCESS;
    }

    public String loadEditOrder() {
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToFormBeanOrder(orderEntity);
        return SUCCESS;
    }

    public String editOrder() {
        Orders orderEntity = orderService.findOrdersById(orderIdParam);

        validateOnSubmit(order);
        if (hasFieldErrors()) {
            return INPUT;
        }
        orderService.updateOrder(orderEntity);
        return SUCCESS;
    }

    public String deleteOrder() {
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        if (orderEntity.getOrderStatus().equals("PENDING") || orderEntity.getOrderStatus().equals("CANCELLED") || orderEntity.getOrderStatus().equals("DISAPPROVED")) {
            orderService.deleteOrder(orderEntity);
            return SUCCESS;
        } else {
            String column = getColumnFilter();
            List<Orders> orderEntityList = new ArrayList<Orders>();
            if (StringUtils.isNotBlank(column)) {
                orderEntityList = orderService.findOrdersByCriteria(column, order.getOrderKeyword(), getClientId());
            } else {
                orderEntityList = orderService.findAllOrders();
            }
            for (Orders orderElem : orderEntityList) {
                orders.add(transformToOrderFormBean(orderElem));
            }
            clearErrorsAndMessages();
            addActionMessage("You can not delete a booking with status rather than PENDING and CANCELLED.");
            return INPUT;
        }
    }

    public String viewInfoOrder() {
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToFormBeanOrder(orderEntity);
        return SUCCESS;
    }

    public String loadContactInfoList() {
        shipperList = customerService.findContactByRefIdAndType("SHIPPER", order.getCustomerId());
        consigneeList = customerService.findContactByRefIdAndType("CONSIGNEE", order.getCustomerId());
        return SUCCESS;
    }

    private OrderBean transformToFormBeanOrder(Orders order) {
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
        orderBean.setBookingDate(order.getOrderDate());
        orderBean.setComments(order.getComments());
        orderBean.setRates(order.getRates());
        orderBean.setOrderStatus(order.getOrderStatus());

        //customer info
        List<Customer> customer = customerService.findCustomersByCriteria("customerCode", order.getShipperCode(), getClientId());
        if (customer != null) {
            orderBean.setCustomerName(customer.get(0).getCustomerName());
        } else {
            orderBean.setConsigneeCode(customer.get(0).getCustomerCode());
        }

        //shipper contact info
        Contacts contacts = customerService.findContactById(order.getShipperContactId());
        contact = new ContactBean();
        contact.setName(getFullName(contacts.getLastName(), contacts.getFirstName(), contacts.getMiddleName()));
        contact.setPhone(contacts.getPhone());
        contact.setEmail(contacts.getEmail());
        contact.setFax(contacts.getFax());
        contact.setMobile(contacts.getMobile());
        orderBean.setShipperInfoContact(contact);

        Address addresss = customerService.findAddressById(order.getShipperAddressId());
        address = new AddressBean();
        address.setAddress(getAddress(addresss));
        orderBean.setShipperInfoAddress(address);

        //consignee Info
        Contacts consigneeContact = customerService.findContactById(order.getConsigneeContactId());
        contact = new ContactBean();
        contact.setName(getFullName(consigneeContact.getLastName(), consigneeContact.getFirstName(), consigneeContact.getMiddleName()));
        contact.setPhone(consigneeContact.getPhone());
        contact.setEmail(consigneeContact.getEmail());
        contact.setFax(consigneeContact.getFax());
        contact.setMobile(consigneeContact.getMobile());
        orderBean.setConsigneeInfoContact(contact);

        Address consigneeAddress = customerService.findAddressById(order.getConsigneeAddressId());
        address = new AddressBean();
        address.setAddress(getAddress(consigneeAddress));
        System.out.println(address);
        orderBean.setConsigneeInfoAddress(address);

        //Order Items Bean
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(order.getOrderId());

        for (OrderItems orderItemElem : orderItemEntityList) {
            System.out.println(orderItemElem);
            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }
        orderBean.setOrderItemsBean(orderItems);

        return orderBean;
    }

    private OrderBean transformToOrderFormBean(Orders order) {
        OrderBean orderBean = new OrderBean();

        orderBean.setOrderId(order.getOrderId());
        orderBean.setOrderNumber(order.getOrderNumber());
        orderBean.setServiceType(order.getServiceType());
        orderBean.setModeOfService(order.getServiceMode());
        orderBean.setNotifyBy(order.getNotificationType());
        orderBean.setOrderDate(order.getOrderDate());
        orderBean.setModeOfPayment(order.getPaymentMode());
        orderBean.setComments(order.getComments());
        orderBean.setOrderStatus(order.getOrderStatus());
        orderBean.setShipperCode(order.getVendorCode());
        orderBean.setTruckCode(order.getTruckCode());
        orderBean.setTrailerCode(order.getTrailerCode());
        orderBean.setDriverCode(order.getDriverCode());
        orderBean.setVesselNumber(order.getVesselNumber());
        orderBean.setShipperCode(order.getShipperCode());
        orderBean.setShipperAddressId(order.getShipperAddressId());
        orderBean.setShipperContactId(order.getShipperContactId());
        orderBean.setConsigneeCode(order.getConsigneeCode());
        orderBean.setConsigneeAddressId(order.getConsigneeAddressId());
        orderBean.setConsigneeContactId(order.getConsigneeContactId());
        orderBean.setAccountRep(order.getAccountRep());
        orderBean.setCreatedTimestamp(order.getCreatedTimestamp());
        orderBean.setCreatedBy(order.getCreatedBy());
        orderBean.setModifiedTimestamp(order.getModifiedTimestamp());
        orderBean.setModifiedBy(order.getModifiedBy());
        orderBean.setPickupDate(order.getPickupDate());
        orderBean.setOriginationPort(order.getOriginationPort());
        orderBean.setPickupTime(order.getPickupTime());
        orderBean.setDeliveryDate(order.getDeliveryDate());
        orderBean.setDestinationPort(order.getDestinationPort());
        orderBean.setDeliveryTime(order.getDeliveryTime());
        orderBean.setRates(order.getRates());
        orderBean.setServiceRequirement(order.getServiceRequirement());
        orderBean.setModeOfService(order.getServiceMode());

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
        return orderItemBean;
    }

    public static String getOrderNum(int compcode) {
        StringBuilder sb = new StringBuilder(compcode);
        String comp = COMPANY_CODE + "-";

        for (int i = 0; i < compcode; i++) {
            int ndx = (int) (Math.random() * ALPHA_NUM.length());
            sb.append(ALPHA_NUM.charAt(ndx));
        }


        return comp.concat(sb.toString().toUpperCase());
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
        if (StringUtils.isBlank(orderBean.getBookedBy())) { //A NULL Booked By field means, the Order is NEW and not an edit
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
        List<OrderItems> orderItems = new ArrayList<OrderItems>();
        for (OrderItemsBean orderItemBean : orderBean.getOrderItemsBean()) {
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

    private String getFullName(String lastName, String firstName, String middleName) {
        StringBuilder fullName = new StringBuilder("");
        if (StringUtils.isNotBlank(lastName)) {
            fullName.append(lastName + ", ");
        }
        if (StringUtils.isNotBlank(firstName)) {
            fullName.append(firstName + " ");
        }
        if (StringUtils.isNotBlank(middleName)) {
            fullName.append(middleName);
        }
        return fullName.toString();
    }

    private String getAddress(Address address) {
        StringBuilder fullAddress = new StringBuilder("");
        if (StringUtils.isNotBlank(address.getAddressLine1()))
            fullAddress.append(address.getAddressLine1() + " ");
        if (StringUtils.isNotBlank(address.getAddressLine2()))
            fullAddress.append(address.getAddressLine2() + " ");
        if (StringUtils.isNotBlank(address.getCity()))
            fullAddress.append(address.getCity() + " ");
        if (StringUtils.isNotBlank(address.getState()))
            fullAddress.append(address.getState() + " ");
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

    public List<OrderBean> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderBean> orders) {
        this.orders = orders;
    }

    public OrderBean getOrder() {
        return order;
    }

    public void setOrderBean(OrderBean order) {
        this.order = order;
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

    public ContactBean getContact() {
        return contact;
    }

    public void setContact(ContactBean contact) {
        this.contact = contact;
    }
}
