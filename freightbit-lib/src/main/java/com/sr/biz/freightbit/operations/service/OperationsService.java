package com.sr.biz.freightbit.operations.service;

import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 8/4/14.
 */
public interface OperationsService {

    public List<Orders> findAllOrders();

    public List<OrderItems> findAllOrderItemsByOrderId(Integer orderId);

    public OrderItems findOrderItemById(Integer orderItemId);

    public List<VesselSchedules> findVesselScheduleByVendorId(Integer vendorId);

    public List<VesselSchedules> findAllVesselSchedule();

    public void updateOrderItem (OrderItems orderItems);

}
