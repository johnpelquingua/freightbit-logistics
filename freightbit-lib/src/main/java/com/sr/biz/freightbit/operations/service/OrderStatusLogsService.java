package com.sr.biz.freightbit.operations.service;

import com.sr.biz.freightbit.operations.entity.OrderStatusLogs;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 7/30/14.
 */
public interface OrderStatusLogsService {

    public void addStatus(OrderStatusLogs orderStatusLogs);

    public void updateOrderStatus(Orders orders);

    public void updateStatusOrderItem(OrderItems orderItems);

    public List<Orders> findAllOrders();

    /*public List<OrderItems> findAllItemsByOrderId(Integer orderId);*/

    public List<OrderStatusLogs> findAllItemsByOrderId(Integer orderId);

    public OrderItems findOrderItemById(Integer orderItemId);
}
