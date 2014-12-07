package com.sr.biz.freightbit.order.dao;

import com.sr.biz.freightbit.order.entity.OrderItems;

import java.util.List;

public interface OrderItemsDao {

    public List<OrderItems> findAllItemByOrderId(Integer orderId);

    public void addItems(OrderItems orderItems);

    public void deleteItem(OrderItems orderItems);

    public OrderItems findOrderItemByOrderItemId(Integer orderItemId);

    public List<OrderItems> findAllOrderItemLCL();

    public List<OrderItems> findAllOrderItemsByContainerId(Integer containerId);

    /*public List<OrderItems> findAllOrderItemByVesselName(String vesselName);*/

}
