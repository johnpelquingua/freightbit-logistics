package com.sr.biz.freightbit.order.dao;

import com.sr.biz.freightbit.order.entity.OrderItems;

import java.util.List;

public interface OrderItemsDao {

    public List<OrderItems> findAllItemByOrderId(Integer orderId);

}
