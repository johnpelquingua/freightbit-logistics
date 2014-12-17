package com.sr.biz.freightbit.operations.dao;

import com.sr.biz.freightbit.operations.entity.OrderStatusLogs;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.List;

public interface OrderStatusLogsDao {

    public void addOrderStatus(OrderStatusLogs orderStatusLogs);

    public void updateStatusOrders(Orders orders);

    public List<Orders> findAllOrders();

    /*public List<OrderItems> findAllItemsByOrderId(Integer orderId);*/

    public List<OrderStatusLogs> findAllShipmentLogs(Integer orderItemId);

    public List<OrderItems> findAllItemsByOrderId(Integer orderId);

    public OrderItems findOrderItemById(Integer orderItemId);

    public OrderStatusLogs findOrderStatusLogsById(Integer orderItemId);

    public void updateStatusOrderItem(OrderItems orderItems);
}
