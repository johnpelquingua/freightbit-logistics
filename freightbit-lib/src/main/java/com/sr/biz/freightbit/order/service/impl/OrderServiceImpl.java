package com.sr.biz.freightbit.order.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.order.dao.OrderDao;
import com.sr.biz.freightbit.order.dao.OrderItemsDao;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;
/**
 * Created by JMXPSX on 5/27/14.
 */

public class OrderServiceImpl implements OrderService{

    private OrderDao orderDao;
    private OrderItemsDao orderItemsDao;

	public void setOrderItemsDao(OrderItemsDao orderItemsDao) {
		this.orderItemsDao = orderItemsDao;
	}

	public void setOrderDao(OrderDao orderDao) {this.orderDao = orderDao;}

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addOrder(Orders orders) {
/*        if (orderDao.findOrdersByOrderNumber(orders.getOrderNumber())!=null)
            throw new OrderAlreadyExistsException(orders.getOrderNumber());
        else*/
            orderDao.addOrder(orders);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteOrder(Orders orders){
        orderDao.deleteOrder(orders);
    }


    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateOrder(Orders orders) {
        orderDao.updateOrder(orders);
    }

    @Override
    public List<Orders> findAllOrders () {
        List <Orders> orders = orderDao.findAllOrders();
        return orders;
    }

    @Override
    public List<Orders> findAllOrdersByClientId (Integer clientId) {
        return orderDao.findAllOrdersByClientId(clientId);
    }


    @Override
    public Orders findOrdersById(Integer orderId) {
        return orderDao.findOrdersById(orderId);
    }


    @Override
    public  Orders findOrdersByOrderNumber (Integer orderNumber) {
        List<Orders> result = orderDao.findOrdersByOrderNumber(orderNumber);
        if (result != null && !result.isEmpty())
            return result.get(0);
        return null;
    }


    @Override
    public void updateOrderDate(Orders orders){
        orders.setOrderDate(new Date());
        orderDao.updateOrder(orders);
    }
}
