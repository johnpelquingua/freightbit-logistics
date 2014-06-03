package com.sr.biz.freightbit.core.service;

import java.util.List;

import com.sr.biz.freightbit.core.entity.Orders;
import com.sr.biz.freightbit.core.exceptions.OrderAlreadyExistsException;
/**
 * Created by JMXPSX on 5/27/14.
 */
public interface OrderService {

    public void addOrder(Orders orders) throws OrderAlreadyExistsException;

    public void deleteOrder(Orders orders);

    public void updateOrder(Orders orders);

    public List<Orders> findAllOrders ();

    public List<Orders> findAllOrdersByClientId (Integer clientId);

    public Orders findOrdersById(Integer orderId);

    public  Orders findOrdersByOrderNumber (Integer orderNumber);

    public void updateOrderDate(Orders orders);
}
