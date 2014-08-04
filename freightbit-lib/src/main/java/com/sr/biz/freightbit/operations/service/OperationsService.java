package com.sr.biz.freightbit.operations.service;

import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 8/4/14.
 */
public interface OperationsService {

    public List<Orders> findAllOrders();

    public List<OrderItems> findAllOrderItemsByOrderId(Integer orderId);

    public OrderItems findOrderItemById(Integer orderItemId);

}
