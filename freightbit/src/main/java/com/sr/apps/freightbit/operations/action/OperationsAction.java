package com.sr.apps.freightbit.operations.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.operations.formbean.OperationsBean;
import com.sr.apps.freightbit.operations.formbean.VesselScheduleBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.order.formbean.OrderItemsBean;
import com.sr.biz.freightbit.operations.service.OperationsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.vendor.entity.Driver;
import com.sr.biz.freightbit.vendor.entity.Trucks;
import com.sr.biz.freightbit.vendor.entity.Vendor;
import com.sr.biz.freightbit.vendor.service.VendorService;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;
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

    private OperationsService operationsService;
    private VendorService vendorService;


    private Map<Integer, String> driverMap = new LinkedHashMap<Integer, String>();
    private Map<Integer, String> trucksMap = new HashMap<Integer, String>();

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

        orderItemsList = operationsService.findAllOrderItemsByOrderIdLand(orderId);

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

        orderItemsList = operationsService.findAllOrderItemsByOrderIdSea(orderId);

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
            entity.setVesselScheduleId(vesselScheduleIdParam);
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
        OperationsBean formBean = new OperationsBean();

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
        sessionAttributes.put("vendorSea", operationsBean.getVendorSea());

        System.out.println("<------------------Client ID: " + sessionAttributes.get("clientId") + "-----> \n \n");
        System.out.println("<------------------Client ID: " + operationsBean.getClientId() + "-----> \n \n");
        System.out.println("<------------------VendorList: " + operationsBean.getVendorList() + "-----> \n \n");
        System.out.println("<------------------Commodity: " + operationsBean.getCommodity() + "-----> \n \n");

        List<VesselSchedules> vesselSchedulesList = new ArrayList<VesselSchedules>();

        vesselSchedulesList = operationsService.findVesselScheduleByVendorId(operationsBean.getVendorList());

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        return SUCCESS;
    }

    public String viewFreightPlanning(){

        OrderItems entity = operationsService.findOrderItemById(orderItemIdParam);
        orderItem = transformToOrderItemFormBean(entity);

        Map sessionAttributes = ActionContext.getContext().getSession();
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

        orderItemsList = operationsService.findAllOrderItemsByOrderId(orderIdParam);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderIdParam", orderIdParam);

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }
        return SUCCESS;
    }

    public String viewFreightItemListLand() {
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

    public String listVendorDriverAndTrucks() {
        List<Driver> driverList = vendorService.findDriverByVendorId(vendorId);
        List<Trucks> trucksList = vendorService.findTrucksByVendorId(vendorId);

        for(int i = 0; i < driverList.size(); i++) {
            driverMap.put(driverList.get(i).getDriverId(), driverList.get(i).getFirstName() + " " + driverList.get(i).getLastName());
        }

        for(int i = 0; i <trucksList.size(); i++) {
            trucksMap.put(trucksList.get(i).getTruckId(), trucksList.get(i).getTruckCode());
        }

        return SUCCESS;
    }

    public OrderBean transformToOrderFormBean(Orders entity) {

        OrderBean formBean = new OrderBean();
        formBean.setOrderNo(entity.getOrderNumber());
        formBean.setCustomerName(entity.getShipperCode());
        formBean.setServiceRequirement(entity.getServiceRequirement());
        formBean.setModeOfService(entity.getServiceMode());
        formBean.setConsigneeCode(entity.getConsigneeCode());
        formBean.setOrderId(entity.getOrderId());
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
        formBean.setVendorOrigin(entity.getVendorOrigin());
        formBean.setFinalPickupDate(entity.getFinalPickupDate());

        System.out.println("<------------- Commodity Entity: " + entity.getCommodity() + "---> \n \n");
        System.out.println("<------------- Commodity Entity: " + formBean.getCommodity() + "---> \n \n");
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
        String vendorSea = (String) sessionAttributes.get("vendorSea");


        System.out.println("<------------------Client ID: " + clientId + "-----> \n \n");
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

    public Map<Integer, String> getDriverMap() {
        return driverMap;
    }

    public void setDriverMap(Map<Integer, String> driverMap) {
        this.driverMap = driverMap;
    }

    public Map<Integer, String> getTrucksMap() {
        return trucksMap;
    }

    public void setTrucksMap(Map<Integer, String> trucksMap) {
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
}
