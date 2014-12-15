package com.sr.biz.freightbit.operations.service;

import com.sr.biz.freightbit.operations.entity.OrderStatusLogs;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.List;

public interface OrderStatusLogsService {

    public void addStatus(OrderStatusLogs orderStatusLogs);

    public void updateOrderStatus(Orders orders);

    public void updateStatusOrderItem(OrderItems orderItems);

    public List<Orders> findAllOrders();

    public List<OrderStatusLogs> findAllShipmentLogs(Integer orderItemId);

    public List<OrderItems> findAllItemsByOrderId(Integer orderId);

    public OrderItems findOrderItemById(Integer orderItemId);

    public OrderStatusLogs findOrderStatusLogsById(Integer orderItemId);

}
