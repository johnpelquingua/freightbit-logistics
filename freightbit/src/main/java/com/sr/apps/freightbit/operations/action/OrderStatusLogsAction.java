package com.sr.apps.freightbit.operations.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.order.formbean.OrderItemsBean;
import com.sr.biz.freightbit.operations.service.OrderStatusLogsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Clarence C. Victoria on 7/31/14.
 */
public class OrderStatusLogsAction extends ActionSupport implements Preparable {
    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(VesselScheduleAction.class);

    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private List<OrderItemsBean> orderItems = new ArrayList<OrderItemsBean>();

    private OrderStatusLogsService orderStatusLogsService;

    private Integer orderIdParam;

    @Override
    public void prepare() {}

    public String viewStatusList() {
        List<Orders> orderEntityList = new ArrayList<Orders>();

        orderEntityList = orderStatusLogsService.findAllOrders();

        for (Orders ordersElem : orderEntityList) {
            orders.add(transformToOrderFormBean(ordersElem));
        }
        return SUCCESS;
    }

    public String viewStatusListItems() {
        List<OrderItems> orderItemEntityList = new ArrayList<OrderItems>();

        orderItemEntityList = orderStatusLogsService.findAllItemsByOrderId(orderIdParam);

        for (OrderItems orderItemsElem : orderItemEntityList) {
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

    public OrderStatusLogsService getOrderStatusLogsService() {
        return orderStatusLogsService;
    }

    public void setOrderStatusLogsService(OrderStatusLogsService orderStatusLogsService) {
        this.orderStatusLogsService = orderStatusLogsService;
    }

    public List<OrderBean> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderBean> orders) {
        this.orders = orders;
    }

    public Integer getOrderIdParam() {
        return orderIdParam;
    }

    public void setOrderIdParam(Integer orderIdParam) {
        this.orderIdParam = orderIdParam;
    }

    public List<OrderItemsBean> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItemsBean> orderItems) {
        this.orderItems = orderItems;
    }
}
