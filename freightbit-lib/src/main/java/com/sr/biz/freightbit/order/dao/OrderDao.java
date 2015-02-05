package com.sr.biz.freightbit.order.dao;

import com.sr.biz.freightbit.operations.entity.OrderStatusLogs;
import com.sr.biz.freightbit.order.entity.Counter;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.List;

/**
 * Created by JMXPSX on 5/27/14.
 */
public interface OrderDao {

    public void addOrder(Orders order);

    public void deleteOrder(Orders order);

    public void updateOrder(Orders order);

    public void updateOrderItems(OrderItems orderItems);

    public List<Orders> findAllOrders();

    public List<Orders> findAllOrdersByClientId (Integer clientId);

    public Orders findOrdersById (Integer orderId);

    public OrderItems findOrderItemByOrderItemId (Integer orderItemId);

    public List<Orders> findOrdersByOrderNumber (String orderNumber);

    public List<Orders> findOrdersByCriteria(String column, String value, Integer clientId);

    public Integer findNextBookingNo(Integer clientId, String companyCode);

    List <Orders> findDuplicateOrderByOrderCode(String orderNumber, Integer orderId);

    public void addCounterType(Counter counter);

    public List<Orders> findCustomerWithBooking(Integer customerId);

    public List<Orders> findAllOrdersByAging (Integer aging);

    public List<OrderItems> findAllOrdersByOrderIdAndDestination(Integer orderId, String destinationPort);

}
