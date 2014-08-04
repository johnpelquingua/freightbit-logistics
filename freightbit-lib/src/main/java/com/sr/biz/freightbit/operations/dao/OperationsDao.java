package com.sr.biz.freightbit.operations.dao;

import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 8/4/14.
 */
public interface OperationsDao {

    public List<Orders> findAllOrders();

    public List<OrderItems> findAllOrderItemsByOrderId(Integer orderId);

    public OrderItems findOrderItemById(Integer orderItemId);

}
