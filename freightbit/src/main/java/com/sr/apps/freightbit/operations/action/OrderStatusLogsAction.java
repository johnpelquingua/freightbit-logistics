package com.sr.apps.freightbit.operations.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.operations.formbean.OrderStatusLogsBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.order.formbean.OrderItemsBean;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.operations.entity.OrderStatusLogs;
import com.sr.biz.freightbit.operations.service.OrderStatusLogsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Clarence C. Victoria on 7/31/14.
 */
public class OrderStatusLogsAction extends ActionSupport implements Preparable {
    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(OrderStatusLogsAction.class);

    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private List<OrderItemsBean> orderItems = new ArrayList<OrderItemsBean>();
    private List<Parameters> orderStatusList = new ArrayList<Parameters>();

    private CommonUtils commonUtils = new CommonUtils();

    private OrderItemsBean orderItem = new OrderItemsBean();
    private OrderStatusLogsBean orderStatusLogsBean = new OrderStatusLogsBean();

    private OrderStatusLogsService orderStatusLogsService;
    private ParameterService parameterService;

    private Integer orderIdParam;
    private String orderNoParam;
    private Integer orderItemIdParam;

    @Override
    public void prepare() {
        orderStatusList = parameterService.getParameterMap(ParameterConstants.ORDER_STATUS);
    }

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

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderNoParam", orderNoParam);

        for (OrderItems orderItemsElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        return SUCCESS;
    }

    public String loadUpdateStatus() {
        OrderItems entity = orderStatusLogsService.findOrderItemById(orderItemIdParam);
        orderItem = transformToOrderItemFormBean(entity);
        Map sessionAttributes = ActionContext.getContext().getSession();
       sessionAttributes.put("orderItemIdParam", orderItemIdParam);
        return SUCCESS;
    }

    public String loadUpdateStatusComplete() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer orderIdParamSession = (Integer) sessionAttributes.get("orderIdParam");

        List<OrderItems> orderItemEntityList = new ArrayList<OrderItems>();

        orderItemEntityList = orderStatusLogsService.findAllItemsByOrderId(orderIdParamSession);

        for (OrderItems orderItemsElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Status has been updated.");
        return SUCCESS;
    }

    public String updateStatus() {
        try {
            OrderItems entity = transformToOrderItemEntity(orderItem);
            orderStatusLogsService.updateStatusOrderItem(entity);

            OrderStatusLogs orderStatusLogs = new OrderStatusLogs();
            Map sessionAttributes = ActionContext.getContext().getSession();

            orderStatusLogs.setOrderId((Integer) sessionAttributes.get("orderIdParam"));
            orderStatusLogs.setOrderItemId((Integer) sessionAttributes.get("orderItemIdParam"));
            orderStatusLogs.setCreatedTimestamp(new Date());
            orderStatusLogs.setCreatedBy(commonUtils.getUserNameFromSession());
            orderStatusLogs.setStatus(orderItem.getStatus());

            orderStatusLogsService.addStatus(orderStatusLogs);
        } catch (Exception e) {
            addActionError("Update Failed");
            return INPUT;
        }
        return SUCCESS;

    }

    public OrderItems transformToOrderItemEntity (OrderItemsBean formBean) {
        OrderItems entity = orderStatusLogsService.findOrderItemById(formBean.getOrderItemId());
        entity.setStatus(formBean.getStatus());
        return entity;
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

    public String getOrderNoParam() {
        return orderNoParam;
    }

    public void setOrderNoParam(String orderNoParam) {
        this.orderNoParam = orderNoParam;
    }

    public Integer getOrderItemIdParam() {
        return orderItemIdParam;
    }

    public void setOrderItemIdParam(Integer orderItemIdParam) {
        this.orderItemIdParam = orderItemIdParam;
    }

    public OrderItemsBean getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(OrderItemsBean orderItem) {
        this.orderItem = orderItem;
    }

    public List<Parameters> getOrderStatusList() {
        return orderStatusList;
    }

    public void setOrderStatusList(List<Parameters> orderStatusList) {
        this.orderStatusList = orderStatusList;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

    public OrderStatusLogsBean getOrderStatusLogsBean() {
        return orderStatusLogsBean;
    }

    public void setOrderStatusLogsBean(OrderStatusLogsBean orderStatusLogsBean) {
        this.orderStatusLogsBean = orderStatusLogsBean;
    }

    public CommonUtils getCommonUtils() {
        return commonUtils;
    }

    public void setCommonUtils(CommonUtils commonUtils) {
        this.commonUtils = commonUtils;
    }

    public ParameterService getParameterService() {
        return parameterService;
    }
}
