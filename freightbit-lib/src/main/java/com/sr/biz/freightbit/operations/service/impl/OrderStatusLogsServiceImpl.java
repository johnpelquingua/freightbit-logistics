package com.sr.biz.freightbit.operations.service.impl;

import com.sr.biz.freightbit.operations.dao.OrderStatusLogsDao;
import com.sr.biz.freightbit.operations.entity.OrderStatusLogs;
import com.sr.biz.freightbit.operations.service.OrderStatusLogsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class OrderStatusLogsServiceImpl implements OrderStatusLogsService {

    private OrderStatusLogsDao orderStatusLogsDao;

    public void setOrderStatusLogsDao(OrderStatusLogsDao orderStatusLogsDao){
        this.orderStatusLogsDao = orderStatusLogsDao;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addStatus(OrderStatusLogs orderStatusLogs) {
        orderStatusLogsDao.addOrderStatus(orderStatusLogs);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateOrderStatusLogs(OrderStatusLogs orderStatusLogs) {
        orderStatusLogsDao.updateOrderStatusLogsItems(orderStatusLogs);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateOrderStatus(Orders orders) {
        orderStatusLogsDao.updateStatusOrders(orders);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateStatusOrderItem(OrderItems orderItems) {
        orderStatusLogsDao.updateStatusOrderItem(orderItems);
    }

    @Override
    public List<Orders> findAllOrders() {
        return orderStatusLogsDao.findAllOrders();
    }

    @Override
    public List<OrderStatusLogs> findAllShipmentLogs(Integer orderItemId) {
        return orderStatusLogsDao.findAllShipmentLogs(orderItemId);
    }

    public List<OrderItems> findAllItemsByOrderId(Integer orderId) {
        return orderStatusLogsDao.findAllItemsByOrderId(orderId);
    }

    @Override
    public OrderItems findOrderItemById(Integer orderItemId) {
        return orderStatusLogsDao.findOrderItemById(orderItemId);
    }

    @Override
    public OrderStatusLogs findOrderStatusLogsById(Integer orderItemId) {
        return orderStatusLogsDao.findOrderStatusLogsById(orderItemId);
    }

    @Override
    public OrderStatusLogs findOrderStatusLogsStatusById(Integer statusId) {
        return orderStatusLogsDao.findOrderStatusLogsStatusById(statusId);
    }
}
