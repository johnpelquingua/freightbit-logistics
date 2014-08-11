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
import com.sr.biz.freightbit.vendor.entity.Vendor;
import com.sr.biz.freightbit.vendor.service.VendorService;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ParameterAware;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Clarence C. Victoria on 8/4/14.
 */
public class OperationsAction extends ActionSupport implements Preparable {
    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(OperationsAction.class);

    private Integer orderIdParam;
    private Integer orderItemIdParam;
    private Integer nameSizeParam;

    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private List<OrderItemsBean> orderItems = new ArrayList<OrderItemsBean>();
    private List<VesselScheduleBean> vesselSchedules = new ArrayList<VesselScheduleBean>();

    private List<Vendor> vendorShippingList = new ArrayList<Vendor>();
    private List<Vendor> vendorTruckingList = new ArrayList<Vendor>();

    private OrderItemsBean orderItem = new OrderItemsBean();
    private OperationsBean operationsBean = new OperationsBean();

    private OperationsService operationsService;
    private VendorService vendorService;

    Map paramMap = new HashMap();

    @Override
    public void prepare() {
        vendorShippingList = vendorService.findVendorsByCriteria("vendorType", "SHIPPING", 1);
        vendorTruckingList = vendorService.findVendorsByCriteria("vendorType", "TRUCKING", 1);
    }

    public String findVesselSchedule() {

        List<VesselSchedules> vesselSchedulesList = new ArrayList<VesselSchedules>();

        vesselSchedulesList = operationsService.findVesselScheduleByVendorId(operationsBean.getVendorList());

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderItemIdParam", operationsBean.getOrderItemParam());
        sessionAttributes.put("nameSizeParam", operationsBean.getNameSizeParam());

        System.out.println("<-------------------orderItemIdParam: " + sessionAttributes.get("orderItemIdParam") + "------------------->");
        System.out.println("<-------------------nameSizeParam: " + sessionAttributes.get("nameSizeParam") + "------------------->");

        for (VesselSchedules vesselScheduleElem : vesselSchedulesList) {
            vesselSchedules.add(transformToFormBeanVesselSchedule(vesselScheduleElem));
        }

        return SUCCESS;
    }

    public String viewFreightPlanning(){
        OrderItems entity = operationsService.findOrderItemById(orderItemIdParam);
        orderItem = transformToOrderItemFormBean(entity);
        return SUCCESS;
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

        for(OrderItems orderItemsElem : orderItemsList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
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
        return formBean;
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
}
