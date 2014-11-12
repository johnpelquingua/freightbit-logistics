package com.sr.biz.freightbit.operations.dao;

import com.sr.biz.freightbit.order.entity.OrderItems;

import java.util.List;

public interface ConsolidationDao {

	public void addContainer(OrderItems orderItems);

	public void updateContainer(OrderItems orderItems);

	public List<OrderItems> findContainerByOrderItemId(Integer orderItemId);
}