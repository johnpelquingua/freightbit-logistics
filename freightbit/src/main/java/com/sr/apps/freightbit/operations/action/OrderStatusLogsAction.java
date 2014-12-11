package com.sr.apps.freightbit.operations.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.operations.formbean.OrderStatusLogsBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.order.formbean.OrderItemsBean;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.common.entity.Notification;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.NotificationService;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.operations.entity.OrderStatusLogs;
import com.sr.biz.freightbit.operations.service.OrderStatusLogsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.util.*;

/**
 * Created by Clarence C. Victoria on 7/31/14.
 */
public class OrderStatusLogsAction extends ActionSupport implements Preparable {
    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(OrderStatusLogsAction.class);
    private OrderBean order = new OrderBean();
    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private List<OrderItemsBean> orderItems = new ArrayList<OrderItemsBean>();
    private List<OrderStatusLogsBean> orderStatusLogs = new ArrayList<OrderStatusLogsBean>();
    private List<Parameters> orderStatusList = new ArrayList<Parameters>();
    private List<Parameters> updateStatusList = new ArrayList<Parameters>();
    private List<Parameters> inlandFreightList = new ArrayList<Parameters>();
    private List<Parameters> seaFreightList = new ArrayList<Parameters>();
    private CommonUtils commonUtils = new CommonUtils();
    private OrderItemsBean orderItem = new OrderItemsBean();
    private OrderStatusLogsBean orderStatusLogsBean = new OrderStatusLogsBean();
    private OrderStatusLogsService orderStatusLogsService;
    private ParameterService parameterService;
    private NotificationService notificationService;
    private CustomerService customerService;
    private OrderService orderService;
    private Integer orderIdParam;
    private String orderNoParam;
    private Integer orderItemIdParam;
    private String bookingNumber;
    private String[] check;

    @Override
    public void prepare() {
        orderStatusList = parameterService.getParameterMap(ParameterConstants.ORDER_STATUS);
        updateStatusList = parameterService.getParameterMap(ParameterConstants.UPDATE_STATUS, ParameterConstants.UPDATE_STATUS);
        inlandFreightList = parameterService.getParameterMap(ParameterConstants.INLAND_FREIGHT);
        seaFreightList = parameterService.getParameterMap(ParameterConstants.SEA_FREIGHT);
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

        /*List<OrderStatusLogs> orderStatusLogsEntityList = new ArrayList<OrderStatusLogs>();

        orderStatusLogsEntityList = orderStatusLogsService.findAllItemsByOrderId(orderIdParam);*/

        /*Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderNoParam", orderNoParam);*/

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        bookingNumber = orderEntity.getOrderNumber();
        order = transformToOrderFormBean(orderEntity);

        /*for (OrderItems orderItemsElem : orderItemEntityList) {
            orderItems.add(v(orderItemsElem));
        }*/

        for (OrderItems orderItemsElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }
        return SUCCESS;
    }

    public String setItemStatus() {
        /*System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" + orderItem.getEditItem());
        for (int i =0; i<check.length; i++) {
            System.out.println("--------------------------------------" + check[i]);
        }*/ //For Checking of Checked Items//

        /*validateOnSubmit(orderItem);
        if (hasFieldErrors())
            return INPUT;*/

        try {
            OrderStatusLogs orderStatusLogsEntity = transformToOrderStatusLogsEntity(orderStatusLogsBean);
            Map sessionAttributes = ActionContext.getContext().getSession();
            /*sessionAttributes.put("orderItemIdParam", orderItemIdParam);*/
            orderStatusLogsEntity.setCreatedBy(commonUtils.getUserNameFromSession());
/*
            orderStatusLogsEntity.setCreatedTimestamp(new Date());
*/
            /*orderStatusLogsEntity.setStatus(orderItem.getStatus());
            orderStatusLogsEntity.setOrderId((Integer) sessionAttributes.get("orderIdParam"));
            orderStatusLogsEntity.setOrderItemId((Integer) sessionAttributes.get("orderItemIdParam"));*/
            orderStatusLogsService.addStatus(orderStatusLogsEntity);

            /*Notification notificationEntity = new Notification();
            notificationEntity.setDescription("SHIPMENT_LOGS");
            notificationEntity.setNotificationId(1);
            notificationEntity.setNotificationType("Email");
            notificationEntity.setReferenceId(1);
            notificationEntity.setReferenceTable("Shipment_Logs");
            notificationEntity.setUserId(1);

            notificationService.addNotification(notificationEntity);*/

        }catch (Exception e) {
            addActionError("Update Failed");
            return INPUT;
        }

        return SUCCESS;
    }

    public void validateOnSubmit(OrderItemsBean orderItemsBean) {
        clearErrorsAndMessages();
        if (StringUtils.isBlank(orderItemsBean.getStatus())) {
            addFieldError("orderStatusLogs.status", "Shipment Status is required");
        }

    }

    public String loadSuccessSetStatus() {
        /*Orders orderEntity = orderService.findOrdersById(orderStatusLogsService.findOrderItemById(orderItemIdParam).getOrderId());
        order = transformToOrderFormBean(orderEntity);

        OrderItems orderItemEntity = orderStatusLogsService.findOrderItemById(orderItemIdParam);
        orderItem = transformToOrderItemFormBean(orderItemEntity);*/

        Map sessionAttributes = ActionContext.getContext().getSession();
        List<OrderStatusLogs> orderStatusLogsEntityList = orderStatusLogsService.findAllShipmentLogs((Integer) sessionAttributes.get("orderItemIdParam"));

        for (OrderStatusLogs orderStatusLogsElem : orderStatusLogsEntityList) {
            orderStatusLogs.add(transformToOrderStatusLogsFormBean(orderStatusLogsElem));
        }

        clearErrorsAndMessages();
        addActionMessage("Success! Shipment Logs has been updated.");

        return SUCCESS;
    }

    public String loadItemShipmentHistory() {
        Orders orderEntity = orderService.findOrdersById(orderStatusLogsService.findOrderItemById(orderItemIdParam).getOrderId());
        //bookingNumber = orderEntity.getOrderNumber(); // <- what's the use of this?
        order = transformToOrderFormBean(orderEntity);

        OrderItems orderItemEntity = orderStatusLogsService.findOrderItemById(orderItemIdParam);
        orderItem = transformToOrderItemFormBean(orderItemEntity);

        List<OrderStatusLogs> orderStatusLogsEntityList = new ArrayList<OrderStatusLogs>();

        orderStatusLogsEntityList = orderStatusLogsService.findAllShipmentLogs(orderItemIdParam);

        for (OrderStatusLogs orderStatusLogsElem : orderStatusLogsEntityList) {
            orderStatusLogs.add(transformToOrderStatusLogsFormBean(orderStatusLogsElem));
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

        /*List<OrderStatusLogs> orderStatusLogsEntityList = new ArrayList<OrderStatusLogs>();*/

        orderItemEntityList = orderStatusLogsService.findAllItemsByOrderId(orderIdParamSession);

        /*for (OrderItems orderItemsElem : orderStatusLogsEntityList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }*/

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
            /*orderStatusLogs.setCreatedTimestamp(new Date());*/

            Date date = new Date();
            Date time = new Date();

            Calendar calendarA = Calendar.getInstance();
            calendarA.setTime(date);

            Calendar calendarB = Calendar.getInstance();
            calendarB.setTime(time);

            calendarA.set(Calendar.HOUR_OF_DAY, calendarB.get(Calendar.HOUR_OF_DAY));
            calendarA.set(Calendar.MINUTE, calendarB.get(Calendar.MINUTE));
            calendarA.set(Calendar.SECOND, calendarB.get(Calendar.SECOND));
            calendarA.set(Calendar.MILLISECOND, calendarB.get(Calendar.MILLISECOND));

            Date result = calendarA.getTime();

            orderStatusLogs.setCreatedTimestamp(result);

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
        entity.setCreatedTimestamp(formBean.getCreatedTimestamp());
        return entity;
    }

    public OrderStatusLogs transformToOrderStatusLogsEntity (OrderStatusLogsBean formBean) {
        OrderStatusLogs entity = new OrderStatusLogs();
        entity.setOrderId(formBean.getOrderId());
        entity.setOrderItemId(formBean.getOrderItemId());
        entity.setStatus(formBean.getStatus());
        entity.setCreatedBy(formBean.getCreatedBy());
        entity.setCreatedTimestamp(formBean.getCreatedTimestamp());
        return entity;
    }

    public OrderBean transformToOrderFormBean(Orders entity) {

        OrderBean formBean = new OrderBean();
        formBean.setOrderId(entity.getOrderId());
        formBean.setOrderDate(entity.getOrderDate());
        formBean.setOrderNumber(entity.getOrderNumber());
        formBean.setOriginationPort(entity.getOriginationPort());
        formBean.setDestinationPort(entity.getDestinationPort());
        /*formBean.setCustomerName(entity.getShipperCode());*/
        //get shipper's name
        Contacts shipperContactName = customerService.findContactById(entity.getShipperContactId());
        Customer customerName = customerService.findCustomerById(shipperContactName.getReferenceId());
        formBean.setCustomerName((customerName.getCustomerName()));
        //get consignee name
        Contacts consigneeName = customerService.findContactById(entity.getConsigneeContactId());
        formBean.setConsigneeCode(getFullName(consigneeName.getLastName(), consigneeName.getFirstName(), consigneeName.getMiddleName()));

        formBean.setOrderStatus(entity.getOrderStatus());
        formBean.setFreightType(entity.getServiceType());
        formBean.setModeOfService(entity.getServiceMode());
        formBean.setServiceRequirement(entity.getServiceRequirement());

        return formBean;
    }

    public OrderItemsBean transformToOrderItemFormBean(OrderItems entity) {

        OrderItemsBean formBean = new OrderItemsBean();
        formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        formBean.setNameSize(entity.getNameSize());
        formBean.setStatus(entity.getStatus());
        formBean.setOrderItemId(entity.getOrderItemId());
        formBean.setCreatedBy(entity.getCreatedBy());

        return formBean;
    }

    public OrderStatusLogsBean transformToOrderStatusLogsFormBean (OrderStatusLogs entity) {

        OrderStatusLogsBean formBean = new OrderStatusLogsBean();
        formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        formBean.setStatus(entity.getStatus());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setNameSize(orderService.findOrderItemByOrderItemId(entity.getOrderItemId()).getNameSize());
        formBean.setOrderItemId(entity.getOrderItemId());

        return formBean;

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

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

    public List<Parameters> getUpdateStatusList() {
        return updateStatusList;
    }

    public void setUpdateStatusList(List<Parameters> updateStatusList) {
        this.updateStatusList = updateStatusList;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public String getBookingNumber() {
        return bookingNumber;
    }

    public void setBookingNumber(String bookingNumber) {
        this.bookingNumber = bookingNumber;
    }

    public OrderBean getOrder() {
        return order;
    }

    public void setOrder(OrderBean order) {
        this.order = order;
    }

    public List<OrderStatusLogsBean> getOrderStatusLogs() {
        return orderStatusLogs;
    }

    public void setOrderStatusLogs(List<OrderStatusLogsBean> orderStatusLogs) {
        this.orderStatusLogs = orderStatusLogs;
    }

    public List<Parameters> getInlandFreightList() {
        return inlandFreightList;
    }

    public void setInlandFreightList(List<Parameters> inlandFreightList) {
        this.inlandFreightList = inlandFreightList;
    }

    public List<Parameters> getSeaFreightList() {
        return seaFreightList;
    }

    public void setSeaFreightList(List<Parameters> seaFreightList) {
        this.seaFreightList = seaFreightList;
    }
}