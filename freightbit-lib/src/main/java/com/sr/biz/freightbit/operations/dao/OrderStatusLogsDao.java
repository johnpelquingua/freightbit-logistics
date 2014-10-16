package com.sr.biz.freightbit.operations.dao;

import com.sr.biz.freightbit.operations.entity.OrderStatusLogs;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 7/30/14.
 */
public interface OrderStatusLogsDao {

    public void addOrderStatus(OrderStatusLogs orderStatusLogs);

    public void updateStatusOrders(Orders orders);

    public List<Orders> findAllOrders();

    /*public List<OrderItems> findAllItemsByOrderId(Integer orderId);*/

    public List<OrderStatusLogs> findAllItemsByOrderId(Integer orderId);

    public OrderItems findOrderItemById(Integer orderItemId);

    public void updateStatusOrderItem(OrderItems orderItems);
}
