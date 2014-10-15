package com.sr.apps.freightbit.operations.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.apps.freightbit.order.formbean.OrderBean;
import com.sr.apps.freightbit.operations.formbean.ShipmentLogsBean;
import com.sr.biz.freightbit.operations.service.ShipmentLogsService;
import org.apache.commons.lang3.StringUtils;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.operations.entity.ShipmentLogs;
import com.sr.biz.freightbit.common.service.ParameterService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by JMXPSX on 10/14/2014.
 */
public class ShipmentLogsAction extends ActionSupport implements Preparable {

    private OrderBean order = new OrderBean();
    private List<OrderBean> orders = new ArrayList<OrderBean>();
    private List<ShipmentLogsBean> shipmentLogss = new ArrayList<ShipmentLogsBean>();
    private ShipmentLogsService shipmentLogsService;
    private CustomerService customerService;
    private ParameterService parameterService;

    private List<ShipmentLogs> shipmentLogsEntityList = new ArrayList<ShipmentLogs>();

    @Override
    public void prepare() {

    }

    public String viewShipmentMonitoringList() {

        List<Orders> orderEntityList = new ArrayList<Orders>();

        orderEntityList = shipmentLogsService.findAllOrders();

        for (Orders orderElem : orderEntityList) {
            orders.add(transformOrdersToFormBean(orderElem));
        }

        return SUCCESS;
    }

    public String viewShipmentStatus() {

        shipmentLogsEntityList = shipmentLogsService.findAllShipmentLogs();

        for (ShipmentLogs shipmentLogsElem : shipmentLogsEntityList) {
            shipmentLogss.add(transformShipmentLogsToFormBean(shipmentLogsElem));
        }

        /*shipmentActivityList = parameterService.findShipmentActivityParameters("","","");*/

        return SUCCESS;
    }

    public OrderBean transformOrdersToFormBean(Orders entity) {
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

    public ShipmentLogsBean transformShipmentLogsToFormBean(ShipmentLogs entity) {
        ShipmentLogsBean formBean = new ShipmentLogsBean();
        formBean.setShipmentLogId(entity.getShipmentLogId());
        formBean.setActivity(entity.getActivity());
        formBean.setOrderId(entity.getOrderId());
        formBean.setCreatedDate(entity.getCreatedDate());
        formBean.setCreatedBy(entity.getCreatedBy());

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

    public OrderBean getOrder() {
        return order;
    }

    public void setOrder(OrderBean order) {
        this.order = order;
    }

    public List<OrderBean> getOrders() {
        return orders;
    }

    public void setOrders(List<OrderBean> orders) {
        this.orders = orders;
    }

    public void setShipmentLogsService(ShipmentLogsService shipmentLogsService) {
        this.shipmentLogsService = shipmentLogsService;
    }

    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    public List<ShipmentLogsBean> getShipmentLogss() {
        return shipmentLogss;
    }

    public void setShipmentLogss(List<ShipmentLogsBean> shipmentLogss) {
        this.shipmentLogss = shipmentLogss;
    }

    public List<ShipmentLogs> getShipmentLogsEntityList() {
        return shipmentLogsEntityList;
    }

    public void setShipmentLogsEntityList(List<ShipmentLogs> shipmentLogsEntityList) {
        this.shipmentLogsEntityList = shipmentLogsEntityList;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }
}
