package com.sr.biz.freightbit.order.service;

import java.util.List;

import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.exceptions.OrderAlreadyExistsException;
import com.sr.biz.freightbit.order.entity.Orders;
/**
 * Created by JMXPSX on 5/27/14.
 */
public interface OrderService {

    public void addOrder(Orders orders);

    public void deleteOrder(Orders orders);

    public void updateOrder(Orders orders);

    public List<Orders> findAllOrders ();

    public List<Orders> findAllOrdersByClientId (Integer clientId);

    public Orders findOrdersById(Integer orderId);

    public  Orders findOrdersByOrderNumber (Integer orderNumber);

    public void updateOrderDate(Orders orders);
    
    public List<Orders> findOrdersByCriteria(String column, String value, Integer clientId);
}
