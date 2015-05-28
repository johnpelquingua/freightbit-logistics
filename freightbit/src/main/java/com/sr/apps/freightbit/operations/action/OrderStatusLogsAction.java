package com.sr.apps.freightbit.operations.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.apps.freightbit.operations.formbean.ContainerBean;
import com.sr.apps.freightbit.operations.formbean.OrderStatusLogsBean;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.order.formbean.OrderItemsBean;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.apps.freightbit.util.ParameterConstants;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.common.service.NotificationService;
import com.sr.biz.freightbit.common.service.ParameterService;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.service.UserService;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.operations.entity.Container;
import com.sr.biz.freightbit.operations.entity.OrderStatusLogs;
import com.sr.biz.freightbit.operations.service.ContainerService;
import com.sr.biz.freightbit.operations.service.OperationsService;
import com.sr.biz.freightbit.vendor.entity.Vendor;
import com.sr.biz.freightbit.vendor.service.VendorService;
import com.sr.biz.freightbit.operations.service.OrderStatusLogsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.util.*;

public class OrderStatusLogsAction extends ActionSupport implements Preparable {
    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(OrderStatusLogsAction.class);
    private OrderBean order = new OrderBean();
    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private List<OrderItemsBean> orderItems = new ArrayList<OrderItemsBean>();
    private List<OrderItemsBean> orderItemListings = new ArrayList<OrderItemsBean>();
    private List<OrderStatusLogsBean> orderStatusLogs = new ArrayList<OrderStatusLogsBean>();
    private List<Parameters> orderStatusList = new ArrayList<Parameters>();
    private List<Parameters> updateStatusList = new ArrayList<Parameters>();
    private List<Parameters> inlandFreightList = new ArrayList<Parameters>();
    private List<Parameters> seaFreightLCLList = new ArrayList<Parameters>();
    private List<Parameters> seaFreightList = new ArrayList<Parameters>();
    private List<String> allFreightStatusList = new ArrayList<String>();
    private List<Parameters> containerList = new ArrayList<Parameters>();
    private CommonUtils commonUtils = new CommonUtils();
    private ContainerBean container = new ContainerBean();
    private OrderItemsBean orderItem = new OrderItemsBean();
    private OrderStatusLogsBean orderStatusLogsBean = new OrderStatusLogsBean();
    private OrderStatusLogsService orderStatusLogsService;
    private VendorService vendorService;
    private ParameterService parameterService;
    private NotificationService notificationService;
    private OperationsService operationsService;
    private CustomerService customerService;
    private OrderService orderService;
    private UserService userService;
    private ContainerService containerService;
    private Integer orderIdParam;
    private String orderNoParam;
    private Integer orderItemIdParam;
    private Integer statusIdParam;
    private String bookingNumber;
    private String[] check;
    private List<String> nameSizeList;

    @Override
    public void prepare() {
        orderStatusList = parameterService.getParameterMap(ParameterConstants.ORDER_STATUS);
        updateStatusList = parameterService.getParameterMap(ParameterConstants.UPDATE_STATUS, ParameterConstants.UPDATE_STATUS);
        inlandFreightList = parameterService.getParameterMap(ParameterConstants.INLAND_FREIGHT);
        seaFreightLCLList = parameterService.getParameterMap(ParameterConstants.SEA_FREIGHT_LCL);
        seaFreightList = parameterService.getParameterMap(ParameterConstants.SEA_FREIGHT);
        containerList = parameterService.getParameterMap(ParameterConstants.CONTAINER_SIZE);
    }

    private Integer getClientId() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer clientId = (Integer) sessionAttributes.get("clientId");
        return clientId;
    }

    public String viewStatusList() {

        List<Orders> orderEntityList = new ArrayList<Orders>();
        String column = getColumnFilter();

        if (StringUtils.isNotBlank(column)) {
            orderEntityList = orderService.findOrdersByCriteriaOnGoing(column, order.getOrderKeyword(), getClientId());
        } else {
            orderEntityList = orderStatusLogsService.findAllOrders();
        }

        for (Orders ordersElem : orderEntityList) {
            orders.add(transformToOrderFormBean(ordersElem));
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
            }
            return column;
        }
    }

    public String viewStatusListItems() {

        List<OrderItems> orderItemEntityList = orderStatusLogsService.findAllItemsByOrderId(orderIdParam);

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        bookingNumber = orderEntity.getOrderNumber();
        order = transformToOrderFormBean(orderEntity);

        for (OrderItems orderItemsElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }
        return SUCCESS;
    }

    public String viewStatusListItemsNullError() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer orderIdParamSession = (Integer) sessionAttributes.get("orderIdParam");
        List<OrderItems> orderItemEntityList = new ArrayList<OrderItems>();

        orderItemEntityList = orderStatusLogsService.findAllItemsByOrderId(orderIdParamSession);

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParamSession);
        bookingNumber = orderEntity.getOrderNumber();
        order = transformToOrderFormBean(orderEntity);

        for (OrderItems orderItemsElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        clearErrorsAndMessages();
        addActionError("No Item(s) selected.");
        return SUCCESS;
    }

    public String viewStatusListItemsErrorInput() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer orderIdParamSession = (Integer) sessionAttributes.get("orderIdParam");

        List<OrderItems> orderItemEntityList = orderStatusLogsService.findAllItemsByOrderId(orderIdParamSession);

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParamSession);
        bookingNumber = orderEntity.getOrderNumber();
        order = transformToOrderFormBean(orderEntity);

        for (OrderItems orderItemsElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        clearErrorsAndMessages();
        addActionError("Statuses must not be Planning 1, Planning 2, and Planning 3.");
        return SUCCESS;
    }

    public String viewStatusListItemsError() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer orderIdParamSession = (Integer) sessionAttributes.get("orderIdParam");
        List<OrderItems> orderItemEntityList = new ArrayList<OrderItems>();

        orderItemEntityList = orderStatusLogsService.findAllItemsByOrderId(orderIdParamSession);

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParamSession);
        bookingNumber = orderEntity.getOrderNumber();
        order = transformToOrderFormBean(orderEntity);

        for (OrderItems orderItemsElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        clearErrorsAndMessages();
        addActionError("Status must be the same.");
        return SUCCESS;
    }

    public String viewStatusListItemsErrorService() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer orderIdParamSession = (Integer) sessionAttributes.get("orderIdParam");

        List<OrderItems> orderItemEntityList = orderStatusLogsService.findAllItemsByOrderId(orderIdParamSession);

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParamSession);
        bookingNumber = orderEntity.getOrderNumber();
        order = transformToOrderFormBean(orderEntity);

        for (OrderItems orderItemsElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        clearErrorsAndMessages();
        addActionError("Statuses of all items must be \"Arrived\"/\"Delivered\", \"Picked-Up\" in Pick-Up Service Mode or \"Returned to Origin.\"");
        return SUCCESS;
    }

    public String serviceAccomplishedStatus() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Orders orderEntity = orderService.findOrdersById(orderIdParam);

        List<OrderItems> orderItemEntityList = orderStatusLogsService.findAllItemsByOrderId(orderIdParam);

        //To check if status is either Arrived or Delivered the counter will increase by 1.
        Integer checkAllStatus = 0;
        for (OrderItems orderItemsElem : orderItemEntityList) {
            List <OrderStatusLogs> orderStatusEntityList = orderStatusLogsService.findAllShipmentLogs(orderItemsElem.getOrderItemId());

                for(OrderStatusLogs orderStatusLogsElem : orderStatusEntityList){

                    if(orderStatusLogsElem.getStatus().equals("ARRIVED") || orderStatusLogsElem.getStatus().equals("DELIVERED")
                    || (orderEntity.getServiceMode().equals("PICKUP") && orderStatusLogsElem.getStatus().equals("PICKED-UP"))){
                        checkAllStatus += 1;
                    }
                    else if(orderStatusLogsElem.getStatus().equals("RETURNED TO ORIGIN")) {
                        orderEntity.setOrderStatus("SERVICE ACCOMPLISHED");
                        orderService.updateOrder(orderEntity);
                        return SUCCESS;
                    }
                }

        }

        //If the order items status is either Arrived or Delivered, the service can be accomplished.
        if(checkAllStatus >= orderItemEntityList.size() && orderItemEntityList.size() >= 1){
            orderEntity.setOrderStatus("SERVICE ACCOMPLISHED");
            orderService.updateOrder(orderEntity);
            return SUCCESS;
        }

        else {
            sessionAttributes.put("orderIdParam", orderIdParam);
            return "errorStatus";
        }
    }

    public String loadServiceAccomplished() {

        List<Orders> orderEntityList = new ArrayList<Orders>();
        String column = getColumnFilter();

        if (StringUtils.isNotBlank(column)) {
            orderEntityList = orderService.findOrdersByCriteria(column, order.getOrderKeyword(), getClientId());
        } else {
            orderEntityList = orderStatusLogsService.findAllOrders();
        }
        for (Orders ordersElem : orderEntityList) {
            orders.add(transformToOrderFormBean(ordersElem));
        }
        addActionMessage("Success! Service Accomplished");
        return SUCCESS;
    }

    public String loadUpdateStatusComplete() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Orders orderEntity = orderService.findOrdersById(orderStatusLogsService.findOrderItemById((Integer) sessionAttributes.get("orderItemIdParam")).getOrderId());
        order = transformToOrderFormBean(orderEntity);
        OrderItems orderItemEntity = orderStatusLogsService.findOrderItemById((Integer) sessionAttributes.get("orderItemIdParam"));
        orderItem = transformToOrderItemFormBean(orderItemEntity);
        List<OrderStatusLogs> orderStatusLogsEntityList = orderStatusLogsService.findAllShipmentLogs((Integer) sessionAttributes.get("orderItemIdParam"));

        for (OrderStatusLogs orderStatusLogsElem : orderStatusLogsEntityList) {
            orderStatusLogs.add(transformToOrderStatusLogsFormBean(orderStatusLogsElem));
        }
        // Will show orderItem on second load without passing orderItemIdParam from table
        orderStatusLogsBean.setOrderItemId(orderItemEntity.getOrderItemId());

        //for filtering order status shipment list
        if(orderEntity.getServiceType().equals("SHIPPING AND TRUCKING") || orderEntity.getServiceType().equals("SHIPPING")){

            if(orderEntity.getServiceMode().equals("DOOR TO DOOR") || orderEntity.getServiceMode().equals("DOOR TO PIER")){
                allFreightStatusList.add("QUEUE FOR PICKUP");
                allFreightStatusList.add("IN-TRANSIT TO PICKUP");
                allFreightStatusList.add("POSITIONED");
                allFreightStatusList.add("PICKED-UP");
            }

            if(orderEntity.getServiceRequirement().equals("LESS CONTAINER LOAD")){
                allFreightStatusList.add("QUEUE FOR CONSOLIDATION");
            }

            allFreightStatusList.add("QUEUE FOR DEPARTURE");
            allFreightStatusList.add("IN-TRANSIT");
            allFreightStatusList.add("RETURNED TO ORIGIN");
            allFreightStatusList.add("ARRIVED");

            if(orderEntity.getServiceMode().equals("DOOR TO DOOR") || orderEntity.getServiceMode().equals("PIER TO DOOR")){
                allFreightStatusList.add("QUEUE FOR DELIVERY");
                allFreightStatusList.add("IN-TRANSIT TO DELIVERY");
                allFreightStatusList.add("DELIVERED");
            }

        }else{
            if(orderEntity.getServiceMode().equals("PICKUP") || orderEntity.getServiceMode().equals("INTER-WAREHOUSE")){
                allFreightStatusList.add("QUEUE FOR PICKUP");
                allFreightStatusList.add("IN-TRANSIT TO PICKUP");
                allFreightStatusList.add("POSITIONED");
                allFreightStatusList.add("PICKED-UP");
            }else{
                allFreightStatusList.add("QUEUE FOR DELIVERY");
                allFreightStatusList.add("IN-TRANSIT TO DELIVERY");
                allFreightStatusList.add("DELIVERED");
            }
        }

        OrderItems orderItemsListing = orderService.findOrderItemByOrderItemId(orderItem.getOrderItemId());
        orderItemListings.add(transformToOrderItemFormBean(orderItemsListing));

        clearErrorsAndMessages();
        addActionMessage("Success! Shipment Logs has been updated.");
        nameSizeList = (List) sessionAttributes.get("nameSizeList");
        sessionAttributes.put("orderIdParam", orderEntity.getOrderId());
        sessionAttributes.put("orderItemIdParam", orderItemIdParam);

        return SUCCESS;
    }

    public String setBulkItemStatus() {
        List<Integer> ongoingBulkItems = new ArrayList();
        List<Integer> planning1BulkItems = new ArrayList();
        List<Integer> planning2BulkItems = new ArrayList();
        List<Integer> planning3BulkItems = new ArrayList();
        List<Integer> deliveredBulkItems = new ArrayList();
        List<Integer> pickupBulkItems = new ArrayList();
        List<Integer> positionedBulkItems = new ArrayList();
        List<Integer> departureBulkItems = new ArrayList();
        List<Integer> transitBulkItems = new ArrayList();
        List<Integer> arrivedBulkItems = new ArrayList();
        List<Integer> returnedBulkItems = new ArrayList();
        List<Integer> consolidationBulkItems = new ArrayList();

        Map sessionAttributes = ActionContext.getContext().getSession();
        if("".equals(orderItem.getEditItem())) {
            if (check == null) {
                sessionAttributes.put("orderIdParam", orderStatusLogsBean.getOrderId());
                return "NULL_INPUT";
            } else {
                for (int i = 0; i < check.length; i++) {

                    if (check[i].equals("false") || check[i].equals("null") || "".equals(check[i])) { // catches error when no values inside check
                        sessionAttributes.put("orderIdParam", orderStatusLogsBean.getOrderId());
                        return "NULL_INPUT";
                    }
                    Integer orderStatusItemId = Integer.parseInt(check[i]);
                    Orders orderEntity = orderService.findOrdersById(orderStatusLogsService.findOrderItemById(orderStatusItemId).getOrderId());
                    order = transformToOrderFormBean(orderEntity);
                    OrderItems orderItemEntity = orderStatusLogsService.findOrderItemById(orderStatusItemId);

                    //To Display the listed statuses under the items selected.
                    List<OrderStatusLogs> orderStatusLogsEntityList = orderStatusLogsService.findAllShipmentLogs(orderStatusItemId);
                    orderItem = transformToOrderItemFormBean(orderItemEntity);

                    for (OrderStatusLogs orderStatusLogsElem : orderStatusLogsEntityList) {
                        orderStatusLogs.add(transformToOrderStatusLogsFormBean(orderStatusLogsElem));
                    }

                    sessionAttributes.put("orderItemIdParam", orderItemEntity.getOrderItemId());

                    //Use to check if the statuses being checked matched then it will store it to a variable called "check".
                    if ("ON GOING".equals(orderItemEntity.getStatus())) {
                        ongoingBulkItems.add(orderStatusItemId);
                        if(planning1BulkItems.size() > 0 || planning2BulkItems.size() > 0 ||
                            planning3BulkItems.size() > 0 || deliveredBulkItems.size() > 0 ||
                            pickupBulkItems.size() > 0 || positionedBulkItems.size() > 0 ||
                            departureBulkItems.size() > 0 || transitBulkItems.size() > 0 ||
                            arrivedBulkItems.size() > 0 || returnedBulkItems.size() > 0 ||
                            consolidationBulkItems.size() > 0) {
                            return "input";
                        }
                    }
                    else if("PLANNING 1".equals(orderItemEntity.getStatus())) {
                        planning1BulkItems.add(orderStatusItemId);
                        if(ongoingBulkItems.size() > 0 || planning2BulkItems.size() > 0 ||
                            planning3BulkItems.size() > 0 || deliveredBulkItems.size() > 0 ||
                            pickupBulkItems.size() > 0 || positionedBulkItems.size() > 0 ||
                            departureBulkItems.size() > 0 || transitBulkItems.size() > 0 ||
                            arrivedBulkItems.size() > 0 || returnedBulkItems.size() > 0 ||
                            consolidationBulkItems.size() > 0) {
                            return "input";
                        }
                    }
                    else if("PLANNING 2".equals(orderItemEntity.getStatus())) {
                        planning2BulkItems.add(orderStatusItemId);
                        if(planning1BulkItems.size() > 0 || ongoingBulkItems.size() > 0 ||
                            planning3BulkItems.size() > 0 || deliveredBulkItems.size() > 0 ||
                            pickupBulkItems.size() > 0 || positionedBulkItems.size() > 0 ||
                            departureBulkItems.size() > 0 || transitBulkItems.size() > 0 ||
                            arrivedBulkItems.size() > 0 || returnedBulkItems.size() > 0 ||
                            consolidationBulkItems.size() > 0) {
                            return "input";
                        }
                    }
                    else if("PLANNING 3".equals(orderItemEntity.getStatus())) {
                        planning3BulkItems.add(orderStatusItemId);
                        if(planning1BulkItems.size() > 0 || planning2BulkItems.size() > 0 ||
                            ongoingBulkItems.size() > 0 || deliveredBulkItems.size() > 0 ||
                            pickupBulkItems.size() > 0 || positionedBulkItems.size() > 0 ||
                            departureBulkItems.size() > 0 || transitBulkItems.size() > 0 ||
                            arrivedBulkItems.size() > 0 || returnedBulkItems.size() > 0 ||
                            consolidationBulkItems.size() > 0) {
                            return "input";
                        }
                    }
                    else if("DELIVERED".equals(orderItemEntity.getStatus())) {
                        deliveredBulkItems.add(orderStatusItemId);
                        if(planning1BulkItems.size() > 0 || planning2BulkItems.size() > 0 ||
                            planning3BulkItems.size() > 0 || ongoingBulkItems.size() > 0 ||
                            pickupBulkItems.size() > 0 || positionedBulkItems.size() > 0 ||
                            departureBulkItems.size() > 0 || transitBulkItems.size() > 0 ||
                            arrivedBulkItems.size() > 0 || returnedBulkItems.size() > 0 ||
                            consolidationBulkItems.size() > 0) {
                            return "input";
                        }
                    }
                    else if("PICKUP".equals(orderItemEntity.getStatus())) {
                        pickupBulkItems.add(orderStatusItemId);
                        if(planning1BulkItems.size() > 0 || planning2BulkItems.size() > 0 ||
                            planning3BulkItems.size() > 0 || deliveredBulkItems.size() > 0 ||
                            ongoingBulkItems.size() > 0 || positionedBulkItems.size() > 0 ||
                            departureBulkItems.size() > 0 || transitBulkItems.size() > 0 ||
                            arrivedBulkItems.size() > 0 || returnedBulkItems.size() > 0 ||
                            consolidationBulkItems.size() > 0) {
                            return "input";
                        }
                    }
                    else if("POSITIONED".equals(orderItemEntity.getStatus())) {
                        positionedBulkItems.add(orderStatusItemId);
                        if(planning1BulkItems.size() > 0 || planning2BulkItems.size() > 0 ||
                            planning3BulkItems.size() > 0 || deliveredBulkItems.size() > 0 ||
                            pickupBulkItems.size() > 0 || ongoingBulkItems.size() > 0 ||
                            departureBulkItems.size() > 0 || transitBulkItems.size() > 0 ||
                            arrivedBulkItems.size() > 0 || returnedBulkItems.size() > 0 ||
                            consolidationBulkItems.size() > 0) {
                            return "input";
                        }
                    }
                    else if("QUEUE FOR DEPARTURE".equals(orderItemEntity.getStatus())) {
                        departureBulkItems.add(orderStatusItemId);
                        if(planning1BulkItems.size() > 0 || planning2BulkItems.size() > 0 ||
                            planning3BulkItems.size() > 0 || deliveredBulkItems.size() > 0 ||
                            pickupBulkItems.size() > 0 || positionedBulkItems.size() > 0 ||
                            ongoingBulkItems.size() > 0 || transitBulkItems.size() > 0 ||
                            arrivedBulkItems.size() > 0 || returnedBulkItems.size() > 0 ||
                            consolidationBulkItems.size() > 0) {
                            return "input";
                        }
                    }
                    else if("IN-TRANSIT".equals(orderItemEntity.getStatus())) {
                        transitBulkItems.add(orderStatusItemId);
                        if(planning1BulkItems.size() > 0 || planning2BulkItems.size() > 0 ||
                            planning3BulkItems.size() > 0 || deliveredBulkItems.size() > 0 ||
                            pickupBulkItems.size() > 0 || positionedBulkItems.size() > 0 ||
                            departureBulkItems.size() > 0 || ongoingBulkItems.size() > 0 ||
                            arrivedBulkItems.size() > 0 || returnedBulkItems.size() > 0 ||
                            consolidationBulkItems.size() > 0) {
                            return "input";
                        }
                    }
                    else if("ARRIVED".equals(orderItemEntity.getStatus())) {
                        arrivedBulkItems.add(orderStatusItemId);
                        if(planning1BulkItems.size() > 0 || planning2BulkItems.size() > 0 ||
                            planning3BulkItems.size() > 0 || deliveredBulkItems.size() > 0 ||
                            pickupBulkItems.size() > 0 || positionedBulkItems.size() > 0 ||
                            departureBulkItems.size() > 0 || transitBulkItems.size() > 0 ||
                            ongoingBulkItems.size() > 0 || returnedBulkItems.size() > 0 ||
                            consolidationBulkItems.size() > 0) {
                            return "input";
                        }
                    }
                    else if("RETURNED TO ORIGIN".equals(orderItemEntity.getStatus())) {
                        returnedBulkItems.add(orderStatusItemId);
                        if(planning1BulkItems.size() > 0 || planning2BulkItems.size() > 0 ||
                            planning3BulkItems.size() > 0 || deliveredBulkItems.size() > 0 ||
                            pickupBulkItems.size() > 0 || positionedBulkItems.size() > 0 ||
                            departureBulkItems.size() > 0 || transitBulkItems.size() > 0 ||
                            arrivedBulkItems.size() > 0 || ongoingBulkItems.size() > 0 ||
                            consolidationBulkItems.size() > 0) {
                            return "input";
                        }
                    }

                    else if("QUEUE FOR CONSOLIDATION".equals(orderItemEntity.getStatus())) {
                        consolidationBulkItems.add(orderStatusItemId);
                        if(planning1BulkItems.size() > 0 || planning2BulkItems.size() > 0 ||
                            planning3BulkItems.size() > 0 || deliveredBulkItems.size() > 0 ||
                            pickupBulkItems.size() > 0 || positionedBulkItems.size() > 0 ||
                            departureBulkItems.size() > 0 || transitBulkItems.size() > 0 ||
                            arrivedBulkItems.size() > 0 || returnedBulkItems.size() > 0 ||
                            ongoingBulkItems.size() > 0) {
                            return "input";
                        }
                    }
                }

                //The code below functions as a list for the OrderItems being selected, so if the user set a status for the bulk items, it will display it on the page.
                Orders orderEntity = orderService.findOrdersById(orderStatusLogsService.findOrderItemById((Integer) sessionAttributes.get("orderItemIdParam")).getOrderId());
                sessionAttributes.put("checkedItemsInSession", check);
                order = transformToOrderFormBean(orderEntity);

                nameSizeList = new ArrayList<String>();

                for(int x = 0; x < check.length; x++){
                    OrderItems orderItemEntity = orderStatusLogsService.findOrderItemById(Integer.parseInt(check[x]));
                    nameSizeList.add(orderItemEntity.getNameSize());
                }

                //for filtering order status shipment list
                if(orderEntity.getServiceType().equals("SHIPPING AND TRUCKING") || orderEntity.getServiceType().equals("SHIPPING")){

                    if(orderEntity.getServiceMode().equals("DOOR TO DOOR") || orderEntity.getServiceMode().equals("DOOR TO PIER")){
                        allFreightStatusList.add("QUEUE FOR PICKUP");
                        allFreightStatusList.add("IN-TRANSIT TO PICKUP");
                        allFreightStatusList.add("POSITIONED");
                        allFreightStatusList.add("PICKED-UP");
                    }

                    if(orderEntity.getServiceRequirement().equals("LESS CONTAINER LOAD")){
                        allFreightStatusList.add("QUEUE FOR CONSOLIDATION");
                    }

                    allFreightStatusList.add("QUEUE FOR DEPARTURE");
                    allFreightStatusList.add("IN-TRANSIT");
                    allFreightStatusList.add("RETURNED TO ORIGIN");
                    allFreightStatusList.add("ARRIVED");

                    if(orderEntity.getServiceMode().equals("DOOR TO DOOR") || orderEntity.getServiceMode().equals("PIER TO DOOR")){
                        allFreightStatusList.add("QUEUE FOR DELIVERY");
                        allFreightStatusList.add("IN-TRANSIT TO DELIVERY");
                        allFreightStatusList.add("DELIVERED");
                    }

                }else{
                    if(orderEntity.getServiceMode().equals("PICKUP") || orderEntity.getServiceMode().equals("INTER-WAREHOUSE")){
                        allFreightStatusList.add("QUEUE FOR PICKUP");
                        allFreightStatusList.add("IN-TRANSIT TO PICKUP");
                        allFreightStatusList.add("POSITIONED");
                        allFreightStatusList.add("PICKED-UP");
                    }else{
                        allFreightStatusList.add("QUEUE FOR DELIVERY");
                        allFreightStatusList.add("IN-TRANSIT TO DELIVERY");
                        allFreightStatusList.add("DELIVERED");
                    }
                }

                for(int x = 0; x < check.length; x++) {
                    OrderItems orderItemsListing = orderService.findOrderItemByOrderItemId(Integer.parseInt(check[x]));
                    orderItemListings.add(transformToOrderItemFormBean(orderItemsListing));
                }
                sessionAttributes.put("nameSizeList", nameSizeList);
            }
        }

        return "SET";
    }

    public String updateBulkStatus() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        try {
            //checkedItemsInSession stores the value of the checkedItems from SetBulkItemStatus.
            //Stored in string array checkedItemsInSession since it is an object, I also parsed it into an integer.
            String[] checkedItemsInSession = (String[]) sessionAttributes.get("checkedItemsInSession");
            for (String checkValue : checkedItemsInSession) {
                Integer bulkId = Integer.parseInt(checkValue);
                OrderItems orderItemEntity = orderStatusLogsService.findOrderItemById(bulkId);
                orderStatusLogsBean.setOrderItemId(orderItemEntity.getOrderItemId());

                //Add both item's status' values in OrderStatusLogs table
                OrderStatusLogs orderStatusLogsEntity = transformToOrderStatusLogsEntity(orderStatusLogsBean);
                sessionAttributes.put("orderItemIdParam", orderStatusLogsEntity.getOrderItemId());
                orderStatusLogsEntity.setCreatedTimestamp(new Date());
                orderStatusLogsEntity.setCreatedBy(commonUtils.getUserNameFromSession());
                orderStatusLogsService.addStatus(orderStatusLogsEntity);

                /*//Status in OrderStatusLogs will be passed into OrderItems table
                orderItemEntity.setStatus(orderStatusLogsBean.getStatus());
                orderStatusLogsService.updateStatusOrderItem(orderItemEntity);*/
            }
        } catch (Exception e) {
            addActionError("Update Failed");
            return INPUT;
        }
        return SUCCESS;
    }

    public String loadSuccessSetStatus() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Orders orderEntity = orderService.findOrdersById(orderStatusLogsService.findOrderItemById((Integer) sessionAttributes.get("orderItemIdParam")).getOrderId());
        order = transformToOrderFormBean(orderEntity);
        OrderItems orderItemEntity = orderStatusLogsService.findOrderItemById((Integer) sessionAttributes.get("orderItemIdParam"));
        orderItem = transformToOrderItemFormBean(orderItemEntity);
        List<OrderStatusLogs> orderStatusLogsEntityList = orderStatusLogsService.findAllShipmentLogs((Integer) sessionAttributes.get("orderItemIdParam"));
        for (OrderStatusLogs orderStatusLogsElem : orderStatusLogsEntityList) {
            orderStatusLogs.add(transformToOrderStatusLogsFormBean(orderStatusLogsElem));
        }
        // Will show orderItem on second load without passing orderItemIdParam from table
        orderStatusLogsBean.setOrderItemId(orderItemEntity.getOrderItemId());
        //for filtering order status shipment list

        if (orderEntity.getServiceType().equals("SHIPPING AND TRUCKING") || orderEntity.getServiceType().equals("SHIPPING")) {

            if(orderEntity.getServiceMode().equals("DOOR TO DOOR") || orderEntity.getServiceMode().equals("DOOR TO PIER")){
                allFreightStatusList.add("QUEUE FOR PICKUP");
                allFreightStatusList.add("IN-TRANSIT TO PICKUP");
                allFreightStatusList.add("POSITIONED");
                allFreightStatusList.add("PICKED-UP");
            }

            if(orderEntity.getServiceRequirement().equals("LESS CONTAINER LOAD")){
                allFreightStatusList.add("QUEUE FOR CONSOLIDATION");
            }

            allFreightStatusList.add("QUEUE FOR DEPARTURE");
            allFreightStatusList.add("IN-TRANSIT");
            allFreightStatusList.add("RETURNED TO ORIGIN");
            allFreightStatusList.add("ARRIVED");

            if(orderEntity.getServiceMode().equals("DOOR TO DOOR") || orderEntity.getServiceMode().equals("PIER TO DOOR")){
                allFreightStatusList.add("QUEUE FOR DELIVERY");
                allFreightStatusList.add("IN-TRANSIT TO DELIVERY");
                allFreightStatusList.add("DELIVERED");
            }

        }else{
            if(orderEntity.getServiceMode().equals("PICKUP") /*|| orderEntity.getServiceMode().equals("INTER-WAREHOUSE")*/){
                allFreightStatusList.add("QUEUE FOR PICKUP");
                allFreightStatusList.add("IN-TRANSIT TO PICKUP");
                allFreightStatusList.add("POSITIONED");
                allFreightStatusList.add("PICKED-UP");
            }else if (orderEntity.getServiceMode().equals("DELIVERY")){
                allFreightStatusList.add("QUEUE FOR DELIVERY");
                allFreightStatusList.add("IN-TRANSIT TO DELIVERY");
                allFreightStatusList.add("DELIVERED");
            }else{
                allFreightStatusList.add("QUEUE FOR PICKUP");
                allFreightStatusList.add("IN-TRANSIT TO PICKUP");
                allFreightStatusList.add("POSITIONED");
                allFreightStatusList.add("PICKED-UP");
                allFreightStatusList.add("QUEUE FOR DELIVERY");
                allFreightStatusList.add("IN-TRANSIT TO DELIVERY");
                allFreightStatusList.add("DELIVERED");
            }
        }

        String[] checkedItemsInSession = (String[]) sessionAttributes.get("checkedItemsInSession");
        for(int x = 0; x < checkedItemsInSession.length; x++) {
            OrderItems orderItemsListing = orderService.findOrderItemByOrderItemId(Integer.parseInt(checkedItemsInSession[x]));
            orderItemListings.add(transformToOrderItemFormBean(orderItemsListing));
        }


        clearErrorsAndMessages();
        addActionMessage("Success! Shipment Logs has been updated.");
        nameSizeList = (List) sessionAttributes.get("nameSizeList");
        sessionAttributes.put("orderIdParam", orderEntity.getOrderId());
        sessionAttributes.put("orderItemIdParam", orderItemIdParam);
        return SUCCESS;
    }

    public String loadItemShipmentHistory() {
        Orders orderEntity = orderService.findOrdersById(orderStatusLogsService.findOrderItemById(orderItemIdParam).getOrderId());
        order = transformToOrderFormBean(orderEntity);

        OrderItems orderItemEntity = orderStatusLogsService.findOrderItemById(orderItemIdParam);
        orderItem = transformToOrderItemFormBean(orderItemEntity);

        List<OrderStatusLogs> orderStatusLogsEntityList = orderStatusLogsService.findAllShipmentLogs(orderItemIdParam);

        for (OrderStatusLogs orderStatusLogsElem : orderStatusLogsEntityList) {
            orderStatusLogs.add(transformToOrderStatusLogsFormBean(orderStatusLogsElem));
        }

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderItemIdParam", orderItemIdParam);

        return SUCCESS;
    }

    public String loadUpdateStatus() {
        Orders orderEntity = orderService.findOrdersById(orderStatusLogsService.findOrderItemById(orderItemIdParam).getOrderId());
        order = transformToOrderFormBean(orderEntity);

        OrderItems orderItemEntity = orderStatusLogsService.findOrderItemById(orderItemIdParam);
        orderItem = transformToOrderItemFormBean(orderItemEntity);

        List<OrderStatusLogs> orderStatusLogsEntityList = orderStatusLogsService.findAllShipmentLogs(orderItemIdParam);

        for (OrderStatusLogs orderStatusLogsElem : orderStatusLogsEntityList) {
            orderStatusLogs.add(transformToOrderStatusLogsFormBean(orderStatusLogsElem));
        }

        //for filtering order status shipment list
        if(orderEntity.getServiceType().equals("SHIPPING AND TRUCKING") || orderEntity.getServiceType().equals("SHIPPING")){

            if(orderEntity.getServiceMode().equals("DOOR TO DOOR") || orderEntity.getServiceMode().equals("DOOR TO PIER")){
                allFreightStatusList.add("QUEUE FOR PICKUP");
                allFreightStatusList.add("IN-TRANSIT TO PICKUP");
                allFreightStatusList.add("POSITIONED");
                allFreightStatusList.add("PICKED-UP");
            }

            if(orderEntity.getServiceRequirement().equals("LESS CONTAINER LOAD")){
                allFreightStatusList.add("QUEUE FOR CONSOLIDATION");
            }

            allFreightStatusList.add("QUEUE FOR DEPARTURE");
            allFreightStatusList.add("IN-TRANSIT");
            allFreightStatusList.add("RETURNED TO ORIGIN");
            allFreightStatusList.add("ARRIVED");

            if(orderEntity.getServiceMode().equals("DOOR TO DOOR") || orderEntity.getServiceMode().equals("PIER TO DOOR")){
                allFreightStatusList.add("QUEUE FOR DELIVERY");
                allFreightStatusList.add("IN-TRANSIT TO DELIVERY");
                allFreightStatusList.add("DELIVERED");
            }

        }else{
            if(orderEntity.getServiceMode().equals("PICKUP")/* || orderEntity.getServiceMode().equals("INTER-WAREHOUSE")*/){
                allFreightStatusList.add("QUEUE FOR PICKUP");
                allFreightStatusList.add("IN-TRANSIT TO PICKUP");
                allFreightStatusList.add("POSITIONED");
                allFreightStatusList.add("PICKED-UP");
            }else if (orderEntity.getServiceMode().equals("DELIVERY")){
                allFreightStatusList.add("QUEUE FOR DELIVERY");
                allFreightStatusList.add("IN-TRANSIT TO DELIVERY");
                allFreightStatusList.add("DELIVERED");
            }else{
                allFreightStatusList.add("QUEUE FOR PICKUP");
                allFreightStatusList.add("IN-TRANSIT TO PICKUP");
                allFreightStatusList.add("POSITIONED");
                allFreightStatusList.add("PICKED-UP");
                allFreightStatusList.add("QUEUE FOR DELIVERY");
                allFreightStatusList.add("IN-TRANSIT TO DELIVERY");
                allFreightStatusList.add("DELIVERED");
            }
        }

        OrderItems orderItemsListing = orderService.findOrderItemByOrderItemId(orderItem.getOrderItemId());
        orderItemListings.add(transformToOrderItemFormBean(orderItemsListing));

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderItemIdParam", orderItemIdParam);
        return SUCCESS;
    }



    public String updateStatus() {
        Map sessionAttributes = ActionContext.getContext().getSession();

        try {

            if(orderStatusLogsBean.getStatus().equals("")){

                sessionAttributes.put("orderItemIdParam", orderStatusLogsBean.getOrderItemId());
                return "INPUT_NULL";

            }else{

                OrderStatusLogs orderStatusLogsEntity = transformToOrderStatusLogsEntity(orderStatusLogsBean);
                sessionAttributes.put("orderItemIdParam", orderStatusLogsEntity.getOrderItemId());
                orderStatusLogsEntity.setCreatedTimestamp(new Date());
                orderStatusLogsEntity.setCreatedBy(commonUtils.getUserNameFromSession());
                orderStatusLogsService.addStatus(orderStatusLogsEntity);

            }

                /*//Status in OrderStatusLogs will be passed into OrderItems table
                OrderItems orderItemEntity = orderStatusLogsService.findOrderItemById((Integer) sessionAttributes.get("orderItemIdParam"));
                orderItemEntity.setStatus(orderStatusLogsBean.getStatus());
                orderStatusLogsService.updateStatusOrderItem(orderItemEntity);*/

        } catch (Exception e) {

            addActionError("Update Failed");
            sessionAttributes.put("orderItemIdParam", orderItemIdParam);

            return INPUT;
        }
        return SUCCESS;
    }

    public String loadActualDateForm() {
        OrderStatusLogs orderStatusLogsEntity = orderStatusLogsService.findOrderStatusLogsStatusById(statusIdParam);
        orderStatusLogsBean = transformToOrderStatusLogsFormBean(orderStatusLogsEntity);

        return SUCCESS;
    }

    public String actualDateInput() throws Exception {

        OrderStatusLogs orderStatusLogsEntity = orderStatusLogsService.findOrderStatusLogsStatusById(orderStatusLogsBean.getStatusId());
        OrderStatusLogs entity = new OrderStatusLogs();

        entity.setStatusId(orderStatusLogsEntity.getStatusId());
        entity.setStatus(orderStatusLogsEntity.getStatus());
        entity.setOrderItemId(orderStatusLogsEntity.getOrderItemId());
        entity.setOrderId(orderStatusLogsEntity.getOrderId());
        entity.setCreatedBy(orderStatusLogsEntity.getCreatedBy());
        entity.setCreatedTimestamp(orderStatusLogsEntity.getCreatedTimestamp());
        entity.setActualDate(orderStatusLogsBean.getActualDate());

        orderStatusLogsService.updateOrderStatusLogs(entity);

        Map sessionAttributes = ActionContext.getContext().getSession();
        sessionAttributes.put("orderItemIdParam", orderStatusLogsEntity.getOrderItemId());

        return SUCCESS;
    }

    public String loadContainerDetails() {
        OrderItems orderItemEntity = operationsService.findOrderItemById(orderItemIdParam);
        orderItem = transformToOrderItemFormBean(orderItemEntity);
        order.setServiceRequirement(orderService.findOrdersById(orderItemEntity.getOrderId()).getServiceRequirement());

        if(orderItemEntity.getContainerId() != null){
            container.setContainerId(orderItemEntity.getContainerId());
        }

        return SUCCESS;
    }

    public String updateContainerDetails() throws Exception {
        Map sessionAttributes = ActionContext.getContext().getSession();
        OrderItems orderItemEntity = operationsService.findOrderItemById(orderItemIdParam);
        Orders orderEntity = orderService.findOrdersById(orderItemEntity.getOrderId());
        order.setServiceRequirement(orderEntity.getServiceRequirement());

        Container containerEntity = transformContainerToEntityBean(container);
        if(orderItemEntity.getNameSize().equals("10 FT") || orderItemEntity.getNameSize().equals("20 FT") || orderItemEntity.getNameSize().equals("40 STD FT") || orderItemEntity.getNameSize().equals("40 HC FT")){
            containerEntity.setContainerSize(orderItemEntity.getNameSize());
        }else{
            containerEntity.setContainerSize(container.getContainerSize());
        }

        containerEntity.setContainerStatus("FROM SHIPMENT MONITORING");
        /*containerEntity.setShipping(vendorService.findVendorByVendorCode(orderItemEntity.getVendorSea()).getVendorName());*/
        containerEntity.setShipping(orderItemEntity.getVesselScheduleId()); // vessel schedule will be saved here
        containerEntity.setEirType("NONE");
        containerEntity.setPortCode(orderEntity.getDestinationPort());
        containerService.updateContainer(containerEntity);

        orderItemEntity.setContainerId(containerEntity.getContainerId());
        operationsService.updateOrderItem(orderItemEntity);

        sessionAttributes.put("orderItemIdParam", orderItemIdParam);
        sessionAttributes.put("orderIdParam", orderEntity.getOrderId());

        return SUCCESS;
    }

    public String loadUpdateContainerSuccess() {
        Map sessionAttributes = ActionContext.getContext().getSession();
        Integer orderIdParam = (Integer) sessionAttributes.get("orderIdParam");

        List<OrderItems> orderItemEntityList = orderStatusLogsService.findAllItemsByOrderId(orderIdParam);

        // Display correct Order Number in breadcrumb
        Orders orderEntity = orderService.findOrdersById(orderIdParam);
        bookingNumber = orderEntity.getOrderNumber();
        order = transformToOrderFormBean(orderEntity);

        for (OrderItems orderItemsElem : orderItemEntityList) {
            orderItems.add(transformToOrderItemFormBean(orderItemsElem));
        }

        addActionMessage("Container details has been updated.");
        return SUCCESS;
    }

    private Container transformContainerToEntityBean(ContainerBean formBean){

        Container entity = new Container();
        if(formBean.getContainerId() != null) {
            entity.setContainerId(new Integer(formBean.getContainerId()));
        }

        entity.setEirType(formBean.getEirType());
        entity.setEirNumber(formBean.getEirNumber());
        entity.setReceiptNumber(formBean.getReceiptNumber());
        entity.setGateInTime(formBean.getGateInTime());
        entity.setGateOutTime(formBean.getGateOutTime());
        entity.setVanNumber(formBean.getVanNumber());
        entity.setVanLocation(formBean.getVanLocation());
        entity.setTrucking(formBean.getTrucking());
        entity.setPlateNumber(formBean.getPlateNumber());
        entity.setDriver(formBean.getDriver());
        entity.setSealNumber(formBean.getSealNumber());
        entity.setOrderNumber(formBean.getOrderNumber());
        entity.setRemarks(formBean.getRemarks());
        entity.setLadenEmpty(formBean.getLadenEmpty());
        entity.setVanTo(formBean.getVanTo());
        entity.setVanFrom(formBean.getVanFrom());
        entity.setForkliftOperator(formBean.getForkliftOperator());
        entity.setOperationsDept(formBean.getOperationsDept());
        entity.setContainerNumber(formBean.getContainerNumber());
        entity.setSealNumber(formBean.getSealNumber());
        entity.setBulletSeal(formBean.getBulletSeal());
        entity.setShippingSeal(formBean.getShippingSeal());
        entity.setContainerType(formBean.getContainerType());
        entity.setSealNumber(formBean.getSealNumber());
        entity.setLadenEmpty(formBean.getLadenEmpty());
        entity.setSealNumber(formBean.getSealNumber());
        entity.setCreatedBy(commonUtils.getUserNameFromSession());
        entity.setModifiedBy(commonUtils.getUserNameFromSession());
        entity.setCreatedTimestamp(new Date());
        entity.setModifiedTimestamp(new Date());

        return entity;
    }

    /*public ContainerBean transformContainerToFormBean(Container entity) {

        ContainerBean formBean = new ContainerBean();
        formBean.setContainerId(entity.getContainerId());
        formBean.setEirNumber(entity.getEirNumber());
        formBean.setGateInTime(entity.getGateInTime());
        formBean.setGateOutTime(entity.getGateOutTime());
        formBean.setShipping(entity.getShipping());
        formBean.setTrucking(entity.getTrucking());
        formBean.setPlateNumber(entity.getPlateNumber());
        formBean.setVanNumber(entity.getVanNumber());
        formBean.setDriver(entity.getDriver());
        formBean.setOrderNumber(entity.getOrderNumber());
        formBean.setRemarks(entity.getRemarks());
        formBean.setVanTo(entity.getVanTo());
        formBean.setVanFrom(entity.getVanFrom());
        formBean.setContainerNumber(entity.getContainerNumber());
        formBean.setContainerSize(entity.getContainerSize());
        formBean.setContainerType(entity.getContainerType());
        formBean.setEirType(entity.getEirType());
        formBean.setSealNumber(entity.getSealNumber());
        formBean.setBulletSeal(entity.getBulletSeal());
        formBean.setShippingSeal(entity.getShippingSeal());
        formBean.setVanLocation(entity.getVanLocation());
        formBean.setLadenEmpty(entity.getLadenEmpty());
        formBean.setReceiptNumber(entity.getReceiptNumber());
        formBean.setLadenEmpty(entity.getLadenEmpty());
        formBean.setForkliftOperator(entity.getForkliftOperator());
        formBean.setOperationsDept(entity.getOperationsDept());
        formBean.setContainerStatus(entity.getContainerStatus());
        formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        formBean.setCreatedBy(entity.getCreatedBy());
        formBean.setModifiedTimestamp(entity.getModifiedTimestamp());
        formBean.setModifiedBy(entity.getModifiedBy());

        return formBean;
    }*/

    /*public OrderItems transformToOrderItemEntity (OrderItemsBean formBean) {
        OrderItems entity = orderStatusLogsService.findOrderItemById(orderItemIdParam);
        entity.setStatus(formBean.getStatus());
        entity.setCreatedTimestamp(formBean.getCreatedTimestamp());
        return entity;
    }*/

    public OrderStatusLogs transformToOrderStatusLogsEntity (OrderStatusLogsBean formBean) {

        OrderStatusLogs entity = new OrderStatusLogs();
        entity.setOrderItemId(formBean.getOrderItemId());
        entity.setOrderId(operationsService.findOrderItemById(formBean.getOrderItemId()).getOrderId());
        entity.setStatus(formBean.getStatus());
        entity.setCreatedBy(formBean.getCreatedBy());
        entity.setCreatedTimestamp(formBean.getCreatedTimestamp());
        entity.setActualDate(formBean.getActualDate());
//        entity.setContainerNumber(formBean.getContainerNumber());
        return entity;
    }

    public OrderBean transformToOrderFormBean(Orders entity) {

        OrderBean formBean = new OrderBean();
        formBean.setOrderId(entity.getOrderId());
        formBean.setOrderDate(entity.getOrderDate());
        formBean.setOrderNumber(entity.getOrderNumber());
        formBean.setOrderStatus(entity.getOrderStatus());
        //get shipper's name
        Contacts shipperContactName = customerService.findContactById(entity.getShipperContactId());
        Customer customerName = customerService.findCustomerById(shipperContactName.getReferenceId());
        formBean.setCustomerName((customerName.getCustomerName()));
        //get consignee name
        Contacts consigneeName = customerService.findContactById(entity.getConsigneeContactId());
        formBean.setConsigneeName(consigneeName.getCompanyName());
        formBean.setConsigneeCode(getFullName(consigneeName.getLastName(), consigneeName.getFirstName(), consigneeName.getMiddleName()));

        formBean.setOrderStatus(entity.getOrderStatus());
        formBean.setFreightType(entity.getServiceType());
        formBean.setModeOfService(entity.getServiceMode());
        formBean.setServiceRequirement(entity.getServiceRequirement());

        if(entity.getOriginationPort() != null){
            formBean.setOriginationPort(entity.getOriginationPort());
        }else if(entity.getServiceMode().equals("DELIVERY")){
            formBean.setOriginationPort("NOT APPLICABLE");
        }else{
            formBean.setOriginationPort("NONE");
        }

        if(entity.getDestinationPort() != null){
            formBean.setDestinationPort(entity.getDestinationPort());
        }else if(entity.getServiceMode().equals("PICKUP")){
            formBean.setDestinationPort("NOT APPLICABLE");
        }else{
            formBean.setDestinationPort("NONE");
        }

        List<OrderItems> orderStatusEntity = operationsService.findAllOrderItemsByOrderId(entity.getOrderId());
        if(orderStatusEntity.size() >= 1) {
            if (orderStatusEntity.get(0).getOrderItemId() == null || orderStatusEntity.get(0).getOrderItemId().equals("")) {
                formBean.setOrderItemStatus("NONE");
            } else {
                formBean.setOrderItemStatus(orderStatusEntity.get(0).getStatus());
            }
        }
        return formBean;
    }

    public OrderItemsBean transformToOrderItemFormBean(OrderItems entity) {

        OrderStatusLogs statusLogsEntity = orderStatusLogsService.findOrderStatusLogsById(entity.getOrderItemId());
        OrderStatusLogs timeLogsEntity = orderStatusLogsService.findOrderStatusLogsById(entity.getOrderItemId());

        OrderItemsBean formBean = new OrderItemsBean();
        formBean.setOrderItemId(entity.getOrderItemId());

        if(timeLogsEntity == null || timeLogsEntity.equals("")) {
            formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        }
        else {
            formBean.setCreatedTimestamp(orderStatusLogsService.findOrderStatusLogsById(entity.getOrderItemId()).getActualDate());
        }
        formBean.setNameSize(entity.getNameSize());
        Vendor vendorEntity = vendorService.findVendorByVendorCode(entity.getVendorSea());
        if(vendorEntity == null || vendorEntity.equals("")) {
            formBean.setVendorName("NONE");
        }
        else{
            formBean.setVendorName(vendorEntity.getVendorName());
        }
        formBean.setVendorOriginName(entity.getVendorOrigin());
        formBean.setVendorDestinationName(entity.getVendorDestination());
        if(statusLogsEntity == null || statusLogsEntity.equals("")) {
                formBean.setStatus(entity.getStatus());
        }
        else {
                formBean.setStatus(orderStatusLogsService.findOrderStatusLogsById(entity.getOrderItemId()).getStatus());
        }
        formBean.setOrderItemId(entity.getOrderItemId());

        User userEntity = userService.findUserByUserName(entity.getCreatedBy());
        formBean.setCreatedBy(userEntity.getFirstName() + " " + userEntity.getLastName());

        if(entity.getContainerId() != null){
            Container containerNumEntity = containerService.findContainerById(entity.getContainerId());
            formBean.setContainerNumber(containerNumEntity.getContainerNumber());
            formBean.setSealNumber(containerNumEntity.getSealNumber());
            formBean.setBulletSeal(containerNumEntity.getBulletSeal());
            formBean.setShippingSeal(containerNumEntity.getShippingSeal());
            formBean.setContainerSize(containerNumEntity.getContainerSize());
        }
        else{
            Orders orderEntity = orderService.findOrdersById(operationsService.findOrderItemById(entity.getOrderItemId()).getOrderId());

            if(orderEntity.getServiceRequirement().equals("FULL CONTAINER LOAD")){
                formBean.setContainerSize(operationsService.findOrderItemById(entity.getOrderItemId()).getNameSize());
            }

        }
        return formBean;
    }

    public OrderStatusLogsBean transformToOrderStatusLogsFormBean (OrderStatusLogs entity) {

        OrderStatusLogsBean formBean = new OrderStatusLogsBean();
        formBean.setStatusId(entity.getStatusId());
        formBean.setCreatedTimestamp(entity.getCreatedTimestamp());
        formBean.setActualDate(entity.getActualDate());
        formBean.setStatus(entity.getStatus());
        User userEntity = userService.findUserByUserName(entity.getCreatedBy());
        formBean.setCreatedBy(userEntity.getFirstName() + " " + userEntity.getLastName());
        formBean.setNameSize(orderService.findOrderItemByOrderItemId(entity.getOrderItemId()).getNameSize());
        formBean.setOrderItemId(entity.getOrderItemId());
        formBean.setOrderId(operationsService.findOrderItemById(entity.getOrderItemId()).getOrderId());

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

    public void setOperationsService(OperationsService operationsService) {
        this.operationsService = operationsService;
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

    public List<Parameters> getSeaFreightLCLList() {
        return seaFreightLCLList;
    }

    public void setSeaFreightLCLList(List<Parameters> seaFreightLCLList) {
        this.seaFreightLCLList = seaFreightLCLList;
    }

    public String[] getCheck() {
        return check;
    }

    public void setCheck(String[] check) {
        this.check = check;
    }

    public List<String> getNameSizeList() {
        return nameSizeList;
    }

    public void setNameSizeList(List<String> nameSizeList) {
        this.nameSizeList = nameSizeList;
    }

    public Integer getStatusIdParam() {
        return statusIdParam;
    }

    public void setStatusIdParam(Integer statusIdParam) {
        this.statusIdParam = statusIdParam;
    }

    public List<String> getAllFreightStatusList() {
        return allFreightStatusList;
    }

    public void setAllFreightStatusList(List<String> allFreightStatusList) {
        this.allFreightStatusList = allFreightStatusList;
    }

    public ContainerBean getContainer() {
        return container;
    }

    public void setContainer(ContainerBean container) {
        this.container = container;
    }

    public ContainerService getContainerService() {
        return containerService;
    }

    public void setContainerService(ContainerService containerService) {
        this.containerService = containerService;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setNotificationService(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    public void setVendorService(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    public List<Parameters> getContainerList() {
        return containerList;
    }

    public void setContainerList(List<Parameters> containerList) {
        this.containerList = containerList;
    }

    public List<OrderItemsBean> getOrderItemListings() {
        return orderItemListings;
    }

    public void setOrderItemListings(List<OrderItemsBean> orderItemListings) {
        this.orderItemListings = orderItemListings;
    }
}