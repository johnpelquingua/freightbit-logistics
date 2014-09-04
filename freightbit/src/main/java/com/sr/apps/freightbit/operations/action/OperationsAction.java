package com.sr.apps.freightbit.operations.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.common.formbean.AddressBean;
import com.sr.apps.freightbit.common.formbean.ContactBean;
import com.sr.apps.freightbit.customer.formbean.CustomerBean;
import com.sr.apps.freightbit.operations.formbean.OperationsBean;
import com.sr.apps.freightbit.operations.formbean.VesselScheduleBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.order.formbean.OrderItemsBean;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.operations.service.OperationsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;
import com.sr.biz.freightbit.vendor.entity.Driver;
import com.sr.biz.freightbit.vendor.entity.Trucks;
import com.sr.biz.freightbit.vendor.entity.Vendor;
import com.sr.biz.freightbit.vendor.service.VendorService;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;
import com.sr.biz.freightbit.vesselSchedule.service.VesselSchedulesService;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.service.CustomerService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.util.*;

/**
 * Created by Clarence C. Victoria on 8/4/14.
 */
public class OperationsAction extends ActionSupport implements Preparable {
    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(OperationsAction.class);

    private Integer orderIdParam;
    private Integer orderItemIdParam;
    private Integer nameSizeParam;
    private Integer vendorId;
    private String vendorCode;
    private String orderNoParam;
    private Integer vesselScheduleIdParam;

    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private List<OrderItemsBean> orderItems = new ArrayList<OrderItemsBean>();
    private List<VesselScheduleBean> vesselSchedules = new ArrayList<VesselScheduleBean>();

    private List<Vendor> vendorShippingList = new ArrayList<Vendor>();
    private List<Vendor> vendorTruckingList = new ArrayList<Vendor>();

    private List<Driver> listDrivers = new ArrayList<Driver>();

    private OrderItemsBean orderItem = new OrderItemsBean();
    private OperationsBean operationsBean = new OperationsBean();
    private OrderBean order = new OrderBean();
    private ContactBean contact = new ContactBean();
    private AddressBean address = new AddressBean();

    private OperationsService operationsService;
    private VendorService vendorService;
    private VesselSchedulesService vesselSchedulesService;
    private OrderService orderService;
    private CustomerService customerService;

    private Map<String, String> driverMap = new LinkedHashMap<String, String>();
    private Map<String, String> trucksMap = new HashMap<String, String>();

    Map paramMap = new HashMap();

    @Override
    public void prepare() {
        vendorShippingList = vendorService.findVendorsByCriteria("vendorType", "SHIPPING", 1);
        vendorTruckingList = vendorService.findVendorsByCriteria("vendorType", "TRUCKING", 1);
    }

    public String updateCompleteInlandPlanning() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer orderId = (Integer) sessionAttributes.get("orderIdParam");

        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderId);

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Items has been updated.");

        return SUCCESS;
    }

    public String updateCompleteSeaPlanning() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer orderId = (Integer) sessionAttributes.get("orderIdParam");

        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderId);

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Items has been updated and moved to Inland Freight Planning.");

        return SUCCESS;
    }

    public String editOrderItemsSea() {
        try {
            OrderItems entity = transformOrderItemToEntityBeanSea(operationsBean);
            entity.setVesselScheduleId(vesselScheduleIdParam.toString());
            operationsService.updateOrderItem(entity);
        } catch (Exception e) {
            log.error("Update Orderitem failed", e);
            return INPUT;
        }

        return SUCCESS;
    }

    public String editOrderItemsOrigin() {
        try {
            OrderItems entity = transformOrderItemToEntityBeanOrigin(operationsBean);
            operationsService.updateOrderItem(entity);
        } catch (Exception e) {
            log.error("Update Orderitem failed", e);
            return INPUT;
        }

        return SUCCESS;
    }

    public String editOrderItemsDestination() {
        try {
            OrderItems entity = transformOrderItemToEntityBeanDestination(operationsBean);
            operationsService.updateOrderItem(entity);
        } catch (Exception e) {
            log.error("Update Orderitem failed", e);
            return INPUT;
        }

        return SUCCESS;
    }

    public String findVesselSchedule() {

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderItemId", operationsBean.getOrderItemId());
        sessionAttributes.put("clientId", operationsBean.getClientId());
        sessionAttributes.put("nameSize", operationsBean.getNameSize());
        sessionAttributes.put("orderId", operationsBean.getOrderId());
        sessionAttributes.put("quantity", operationsBean.getQuantity());
        sessionAttributes.put("classification", operationsBean.getClassification());
        sessionAttributes.put("commodity", operationsBean.getCommodity());
        sessionAttributes.put("declaredValue", operationsBean.getDeclaredValue());
        sessionAttributes.put("comments", operationsBean.getComments());
        sessionAttributes.put("rate", operationsBean.getRate());
        sessionAttributes.put("createdBy", operationsBean.getCreatedBy());
        sessionAttributes.put("modifiedBy", operationsBean.getModifiedBy());
        sessionAttributes.put("createdTimestamp", operationsBean.getCreatedTimestamp());
        sessionAttributes.put("modifiedTimestamp", operationsBean.getModifiedTimestamp());
        sessionAttributes.put("weight", operationsBean.getWeight());
        sessionAttributes.put("status", "PLANNING 2");
        sessionAttributes.put("vendorSea", operationsBean.getVendorList());

        System.out.println("<------------------Client ID: " + sessionAttributes.get("clientId") + "-----> \n \n");
        System.out.println("<------------------Client ID: " + operationsBean.getClientId() + "-----> \n \n");
        System.out.println("<------------------VendorList: " + operationsBean.getVendorList() + "-----> \n \n");
        System.out.println("<------------------Commodity: " + operationsBean.getCommodity() + "-----> \n \n");
        System.out.println("<------------------VendorSea: " + operationsBean.getVendorList() + "-----> \n \n");

        List<VesselSchedules> vesselSchedulesList = new ArrayList<VesselSchedules>();

        vesselSchedulesList = operationsService.findVesselScheduleByVendorId(operationsBean.getVendorList());

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        return SUCCESS;
    }

    public String viewInfo() {

        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById(orderItemIdParam);
        orderItem = transformToOrderItemFormBean(entity);
        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
        order = transformToOrderFormBean(orderEntity);

        return SUCCESS;
    }

    public String viewFreightPlanning(){

        Map sessionAttributes = ActionContext.getContext().getSession();

        OrderItems entity = operationsService.findOrderItemById(orderItemIdParam);
        orderItem = transformToOrderItemFormBean(entity);
        Orders orderEntity = orderService.findOrdersById((Integer) sessionAttributes.get("orderIdParam"));
        order = transformToOrderFormBean(orderEntity);

        sessionAttributes.put("orderItemIdParam", entity.getOrderId());
        sessionAttributes.put("nameSizeParam", entity.getNameSize());

        if ("PLANNING 1".equals(entity.getStatus())) {
            return "PLANNING1";
        } else if ("PLANNING 2".equals(entity.getStatus())) {
            return "PLANNING2";
        } else {
            return "PLANNING3";
        }
    }

    public String viewFreightList() {
        List<Orders> ordersList = new ArrayList<Orders>();

        ordersList = operationsService.findAllOrders();

        for (Orders orderElem : ordersList) {
            orders.add(transformToOrderFormBean(orderElem));
        }
        return SUCCESS;
    }

    public String viewFreightItemList() {

        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);

        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParam);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", orderIdParam);

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }
        return SUCCESS;
    }

    public String viewFreightItemListLand( ) {
        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        orderItemsList = operationsService.findAllOrderItemsByOrderIdLand(orderIdParam);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", orderIdParam);

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }
        return SUCCESS;
    }

    public String viewFreightItemListSea() {
        List<OrderItems> orderItemsList = new ArrayList<OrderItems>();

        orderItemsList = operationsService.findAllOrderItemsByOrderIdSea(orderIdParam);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", orderIdParam);

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }
        return SUCCESS;
    }

    public String viewInfoOrderInland() {

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(orderIdParam);
        // display item listing in table
        for (OrderItems orderItemElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }
        return SUCCESS;
    }

    public String viewInfoOrderSea() {

        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        order = transformToOrderFormBean(orderEntity);
        List<OrderItems> orderItemEntityList = orderService.findAllItemByOrderId(orderIdParam);
        // display item listing in table
        for (OrderItems orderItemElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemsFormBean(orderItemElem));
        }
        return SUCCESS;
    }

    private OrderItemsBean transformToOrderItemsFormBean(OrderItems orderItem) {

        OrderItemsBean orderItemBean = new OrderItemsBean();

        orderItemBean.setOrderItemId(orderItem.getOrderItemId());
        orderItemBean.setQuantity(orderItem.getQuantity());
        orderItemBean.setNameSize(orderItem.getNameSize());
        orderItemBean.setWeight(orderItem.getWeight());
        orderItemBean.setVolume(orderItem.getVolume());
        orderItemBean.setClassification(orderItem.getClassification());
        orderItemBean.setDescription(orderItem.getCommodity());
        orderItemBean.setRate(orderItem.getRate());
        orderItemBean.setDeclaredValue(orderItem.getDeclaredValue());
        orderItemBean.setRemarks(orderItem.getComments());

        return orderItemBean;
    }

    public String listVendorDriverAndTrucks() {
        List<Driver> driverList = vendorService.findDriverByVendorId(vendorId);
        List<Trucks> trucksList = vendorService.findTrucksByVendorId(vendorId);

        for(int i = 0; i < driverList.size(); i++) {
            driverMap.put(driverList.get(i).getFirstName() + " " + driverList.get(i).getLastName(), driverList.get(i).getFirstName() + " " + driverList.get(i).getLastName());
        }

        for(int i = 0; i <trucksList.size(); i++) {
            trucksMap.put(trucksList.get(i).getTruckCode(), trucksList.get(i).getTruckCode());
        }

        return SUCCESS;
    }

    public OrderBean transformToOrderFormBean(Orders entity) {

        OrderBean formBean = new OrderBean();
        formBean.setOrderNumber(entity.getOrderNumber());
        //get shipper's name
        Contacts shipperContactName = customerService.findContactById(entity.getShipperContactId());
        Customer customerName = customerService.findCustomerById(shipperContactName.getReferenceId());
        formBean.setCustomerName((customerName.getCustomerName()));
        //formBean.setCustomerName(entity.getShipperCode());
        formBean.setServiceRequirement(entity.getServiceRequirement());
        formBean.setModeOfService(entity.getServiceMode());
        //get consignee name
        Contacts consigneeName = customerService.findContactById(entity.getConsigneeContactId());
        formBean.setConsigneeCode(getFullName(consigneeName.getLastName(), consigneeName.getFirstName(), consigneeName.getMiddleName()));
        //formBean.setConsigneeCode(entity.getConsigneeCode());
        formBean.setOrderId(entity.getOrderId());
        formBean.setOrderStatus(entity.getOrderStatus());
        formBean.setFreightType(entity.getServiceType());
        formBean.setOriginationPort(entity.getOriginationPort());
        formBean.setModeOfPayment(entity.getPaymentMode());
        formBean.setNotifyBy(entity.getNotificationType());
        formBean.setOrderDate(entity.getOrderDate());
        formBean.setDestinationPort(entity.getDestinationPort());
        formBean.setRates(entity.getRates());
        formBean.setComments(entity.getComments());
        formBean.setPickupDate(entity.getPickupDate());
        formBean.setDeliveryDate(entity.getDeliveryDate());

        Contacts contactShipperName = customerService.findContactById(entity.getShipperContactId());

        Customer shipperName = customerService.findCustomerById(contactShipperName.getReferenceId());

        if (shipperName!=null) {
            formBean.setCustomerId(shipperName.getCustomerId());
            formBean.setCustomerName(shipperName.getCustomerName());
        }else{
            formBean.setCustomerId(0);
            formBean.setCustomerName("NINJA TURTLES !!!");
        }

        //shipper contact info
        Contacts contacts = customerService.findContactById(entity.getShipperContactId());
            contact = new ContactBean();
            contact.setName(getFullName(contacts.getLastName(), contacts.getFirstName(), contacts.getMiddleName()));
            contact.setPhone(contacts.getPhone());
            contact.setEmail(contacts.getEmail());
            contact.setFax(contacts.getFax());
            contact.setMobile(contacts.getMobile());
            formBean.setShipperInfoContact(contact);

        //get shipper address
        if (order.getShipperAddressId()!=null) {
            Address addresses = customerService.findAddressById(entity.getShipperAddressId());
            address = new AddressBean();
            address.setAddress(getAddress(addresses));
            formBean.setShipperInfoAddress(address);
        }else{
            address = new AddressBean();
            address.setAddress("NONE");
            formBean.setShipperInfoAddress(address);
        }

        //consignee Info
        Contacts consigneeContact = customerService.findContactById(entity.getConsigneeContactId());

            contact = new ContactBean();
            contact.setName(getFullName(consigneeContact.getLastName(), consigneeContact.getFirstName(), consigneeContact.getMiddleName()));
            contact.setPhone(consigneeContact.getPhone());
            contact.setEmail(consigneeContact.getEmail());
            contact.setFax(consigneeContact.getFax());
            contact.setMobile(consigneeContact.getMobile());
            formBean.setConsigneeInfoContact(contact);

        // consignee address
        if (order.getConsigneeAddressId()!=null) {
            Address consigneeAddress = customerService.findAddressById(entity.getConsigneeAddressId());
            address = new AddressBean();
            address.setAddress(getAddress(consigneeAddress));
            formBean.setConsigneeInfoAddress(address);
        }else{
            address = new AddressBean();
            address.setAddress("NONE");
            formBean.setConsigneeInfoAddress(address);
        }

        return formBean;
    }

    public OrderItemsBean transformToOrderItemFormBean(OrderItems entity) {
        OrderItemsBean formBean = new OrderItemsBean();
        formBean.setNameSize(entity.getNameSize());
        formBean.setStatus(entity.getStatus());
        formBean.setOrderItemId(entity.getOrderItemId());
        formBean.setClientId(entity.getClientId());
        formBean.setNameSize(entity.getNameSize());
        formBean.setOrderId(entity.getOrderId());
        formBean.setQuantity(entity.getQuantity());
        formBean.setClassification(entity.getClassification());
        formBean.setCommodity(entity.getCommodity());
        formBean.setDeclaredValue(entity.getDeclaredValue());
        formBean.setComments(entity.getComments());
        formBean.setRate(entity.getRate());
        formBean.setCreatedTimeStamp(entity.getCreatedTimestamp());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setModifiedBy(entity.getModifiedBy());
        formBean.setModifiedTimeStamp(entity.getModifiedTimestamp());
        formBean.setStatus(entity.getStatus());
        formBean.setWeight(entity.getWeight());
        formBean.setVendorSea(entity.getVendorSea());

        if (entity.getVendorOrigin() == null || "".equals(entity.getVendorOrigin())) {
            formBean.setVendorDestination("");
        } else {
            formBean.setVendorOrigin(vendorService.findVendorById(Integer.parseInt(entity.getVendorOrigin())).getVendorCode());
        }

        if (entity.getVendorDestination() == null || "".equals(entity.getVendorDestination())) {
            formBean.setVendorDestination("");
        } else {
            formBean.setVendorDestination(vendorService.findVendorById(Integer.parseInt(entity.getVendorDestination())).getVendorCode());
        }

        if (entity.getVendorSea() == null || "".equals(entity.getVendorSea())) {
            formBean.setVendorSea("");
        } else {
            formBean.setVendorSea(vendorService.findVendorById(Integer.parseInt(entity.getVendorSea())).getVendorCode());
        }

        if (entity.getVesselScheduleId() == null || "".equals(entity.getVesselScheduleId())) {
            formBean.setVesselScheduleId("");
        } else {
            formBean.setVesselScheduleId(vesselSchedulesService.findVesselSchedulesById(Integer.parseInt(entity.getVesselScheduleId())).getVoyageNumber());
        }

        formBean.setFinalPickupDate(entity.getFinalPickupDate());
        formBean.setDriverOrigin(entity.getDriverOrigin());
        formBean.setDriverDestination(entity.getDriverDestination());
        formBean.setTruckOrigin(entity.getTruckOrigin());
        formBean.setTruckDestination(entity.getTruckDestination());

        return formBean;
    }

    public OrderItems transformOrderItemToEntityBeanSea (OperationsBean formBean) {
        OrderItems entity = new OrderItems();

        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer orderItemId = (Integer) sessionAttributes.get("orderItemId");
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        Integer orderId = (Integer) sessionAttributes.get("orderId");
        String nameSize = (String) sessionAttributes.get("nameSize");
        Integer quantity = (Integer) sessionAttributes.get("quantity");
        String classification = (String) sessionAttributes.get("classification");
        String commodity = (String) sessionAttributes.get("commodity");
        Double declaredValue = (Double) sessionAttributes.get("declaredValue");
        String comments = (String) sessionAttributes.get("comments");
        Float rate = (Float) sessionAttributes.get("rate");
        String createdBy = (String) sessionAttributes.get("createdBy");
        String modifiedBy = (String) sessionAttributes.get("modifiedBy");
        Date createdTimestamp = (Date) sessionAttributes.get("createdTimestamp");
        Date modifiedTimestamp = (Date) sessionAttributes.get("modifiedTimestamp");
        Double weight = (Double) sessionAttributes.get("weight");
        String status = (String) sessionAttributes.get("status");
        String vendorSea = sessionAttributes.get("vendorSea").toString();

        System.out.println("<---------VendorSea: " + vendorSea + "------------------->");
        System.out.println("<---------VendorSea: " + sessionAttributes.get("vendorSea").toString() + "------------------->");

        entity.setOrderItemId(orderItemId);
        entity.setClientId(clientId);
        entity.setNameSize(nameSize);
        entity.setOrderId(orderId);
        entity.setQuantity(quantity);
        entity.setClassification(classification);
        entity.setCommodity(commodity);
        entity.setDeclaredValue(declaredValue);
        entity.setComments(comments);
        entity.setRate(rate);
        entity.setCreatedBy(createdBy);
        entity.setModifiedBy(modifiedBy);
        entity.setCreatedTimestamp(createdTimestamp);
        entity.setModifiedTimestamp(modifiedTimestamp);
        entity.setWeight(weight);
        entity.setStatus(status);
        entity.setVendorSea(vendorSea);
        return entity;
    }

    public OrderItems transformOrderItemToEntityBeanOrigin (OperationsBean formBean) {
        OrderItems entity = new OrderItems();
        entity.setVendorOrigin(formBean.getVendorListOrigin().toString());
        entity.setFinalPickupDate(formBean.getPickupDate());
        entity.setOrderItemId(formBean.getOrderItemId());
        entity.setClientId(formBean.getClientId());
        entity.setNameSize(formBean.getNameSize());
        entity.setOrderId(formBean.getOrderId());
        entity.setQuantity(formBean.getQuantity());
        entity.setClassification(formBean.getClassification());
        entity.setCommodity(formBean.getCommodity());
        entity.setDeclaredValue(formBean.getDeclaredValue());
        entity.setComments(formBean.getComments());
        entity.setRate(formBean.getRate());
        entity.setCreatedBy(formBean.getCreatedBy());
        entity.setModifiedBy(formBean.getModifiedBy());
        entity.setCreatedTimestamp(formBean.getCreatedTimestamp());
        entity.setModifiedTimestamp(formBean.getModifiedTimestamp());
        entity.setWeight(formBean.getWeight());
        entity.setStatus("PLANNING 3");
        entity.setDriverOrigin(formBean.getDriverOrigin());
        entity.setTruckOrigin(formBean.getTruckOrigin());
        return entity;
    }

    public OrderItems transformOrderItemToEntityBeanDestination (OperationsBean formBean) {
        OrderItems entity = new OrderItems();
        entity.setVendorDestination(formBean.getVendorListDestination().toString());
        entity.setFinalDeliveryDate(formBean.getDeliveryDate());
        entity.setOrderItemId(formBean.getOrderItemId());
        entity.setClientId(formBean.getClientId());
        entity.setNameSize(formBean.getNameSize());
        entity.setOrderId(formBean.getOrderId());
        entity.setQuantity(formBean.getQuantity());
        entity.setClassification(formBean.getClassification());
        entity.setCommodity(formBean.getCommodity());
        entity.setDeclaredValue(formBean.getDeclaredValue());
        entity.setComments(formBean.getComments());
        entity.setRate(formBean.getRate());
        entity.setCreatedBy(formBean.getCreatedBy());
        entity.setModifiedBy(formBean.getModifiedBy());
        entity.setCreatedTimestamp(formBean.getCreatedTimestamp());
        entity.setModifiedTimestamp(formBean.getModifiedTimestamp());
        entity.setWeight(formBean.getWeight());
        entity.setStatus(formBean.getStatus());
        entity.setVendorOrigin(formBean.getVendorOrigin());
        entity.setFinalPickupDate(formBean.getPickupDate());
        entity.setVendorSea(formBean.getVendorSea());
        entity.setDriverDestination(formBean.getDriverDestination());
        entity.setTruckDestination(formBean.getTruckDestination());
        return entity;
    }

    public VesselScheduleBean transformToFormBeanVesselSchedule(VesselSchedules entity) {
        VesselScheduleBean formBean = new VesselScheduleBean();
        formBean.setVesselScheduleId(entity.getVesselScheduleId());
        formBean.setVendorId(entity.getVendorId());
        formBean.setOriginPort(entity.getOriginPort());
        formBean.setDestinationPort(entity.getDestinationPort());
        formBean.setArrivalDate(entity.getArrivalDate());
        formBean.setArrivalTime(entity.getArrivalTime());
        formBean.setDepartureDate(entity.getDepartureDate());
        formBean.setDepartureTime(entity.getDepartureTime());
        formBean.setClientId(entity.getClientId());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        formBean.setModifiedBy(entity.getModifiedBy());
        formBean.setModifiedTimestamp(entity.getModifiedTimestamp());
        formBean.setVoyageNumber(entity.getVoyageNumber());
        return formBean;
    }

    public Orders transformOrderToEntityBean (OrderBean formBean) {
        Orders entity = new Orders();
        entity.setVendorCode(formBean.getVendorCode());
        return  entity;
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

    public Integer getOrderIdParam() {
        return orderIdParam;
    }

    public void setOrderIdParam(Integer orderIdParam) {
        this.orderIdParam = orderIdParam;
    }

    public Integer getOrderItemIdParam() {
        return orderItemIdParam;
    }

    public void setOrderItemIdParam(Integer orderItemIdParam) {
        this.orderItemIdParam = orderItemIdParam;
    }

    public OperationsService getOperationsService() {
        return operationsService;
    }

    public void setOperationsService(OperationsService operationsService) {
        this.operationsService = operationsService;
    }

    public List<OrderBean> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderBean> orders) {
        this.orders = orders;
    }

    public List<OrderItemsBean> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItemsBean> orderItems) {
        this.orderItems = orderItems;
    }

    public OrderItemsBean getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(OrderItemsBean orderItem) {
        this.orderItem = orderItem;
    }

    public List<Vendor> getVendorShippingList() {
        return vendorShippingList;
    }

    public void setVendorShippingList(List<Vendor> vendorShippingList) {
        this.vendorShippingList = vendorShippingList;
    }

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    public Integer getNameSizeParam() {
        return nameSizeParam;
    }

    public void setNameSizeParam(Integer nameSizeParam) {
        this.nameSizeParam = nameSizeParam;
    }

    public VendorService getVendorService() {
        return vendorService;
    }

    public List<VesselScheduleBean> getVesselSchedules() {
        return vesselSchedules;
    }

    public void setVesselSchedules(List<VesselScheduleBean> vesselSchedules) {
        this.vesselSchedules = vesselSchedules;
    }

    public OperationsBean getOperationsBean() {
        return operationsBean;
    }

    public void setOperationsBean(OperationsBean operationsBean) {
        this.operationsBean = operationsBean;
    }

    public List<Vendor> getVendorTruckingList() {
        return vendorTruckingList;
    }

    public void setVendorTruckingList(List<Vendor> vendorTruckingList) {
        this.vendorTruckingList = vendorTruckingList;
    }

    public Map getParamMap() {
        return paramMap;
    }

    public void setParamMap(Map paramMap) {
        this.paramMap = paramMap;
    }

    public Integer getVendorId() {
        return vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }

    public Map<String, String> getDriverMap() {
        return driverMap;
    }

    public void setDriverMap(Map<String, String> driverMap) {
        this.driverMap = driverMap;
    }

    public Map<String, String> getTrucksMap() {
        return trucksMap;
    }

    public void setTrucksMap(Map<String, String> trucksMap) {
        this.trucksMap = trucksMap;
    }

    public List<Driver> getListDrivers() {
        return listDrivers;
    }

    public void setListDrivers(List<Driver> listDrivers) {
        this.listDrivers = listDrivers;
    }

    public String getOrderNoParam() {
        return orderNoParam;
    }

    public void setOrderNoParam(String orderNoParam) {
        this.orderNoParam = orderNoParam;
    }

    public Integer getVesselScheduleIdParam() {
        return vesselScheduleIdParam;
    }

    public void setVesselScheduleIdParam(Integer vesselScheduleIdParam) {
        this.vesselScheduleIdParam = vesselScheduleIdParam;
    }

    public String getVendorCode() {
        return vendorCode;
    }

    public void setVendorCode(String vendorCode) {
        this.vendorCode = vendorCode;
    }

    public VesselSchedulesService getVesselSchedulesService() {
        return vesselSchedulesService;
    }

    public void setVesselSchedulesService(VesselSchedulesService vesselSchedulesService) {
        this.vesselSchedulesService = vesselSchedulesService;
    }

    public OrderBean getOrder() {
        return order;
    }

    public void setOrder(OrderBean order) {
        this.order = order;
    }

    public OrderService getOrderService() {
        return orderService;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public CustomerService getCustomerService() {
        return customerService;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public ContactBean getContact() {
        return contact;
    }

    public void setContact(ContactBean contact) {
        this.contact = contact;
    }

    public AddressBean getAddress() {
        return address;
    }

    public void setAddress(AddressBean address) {
        this.address = address;
    }
}
