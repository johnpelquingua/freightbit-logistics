package com.sr.biz.freightbit.operations.service;

import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;

import java.util.List;

public interface OperationsService {

    public List<Orders> findAllOrders();

    public List<OrderItems> findAllOrderItemsByOrderId(Integer orderId);

    public OrderItems findOrderItemById(Integer orderItemId);

    public List<VesselSchedules> findVesselScheduleByVendorId(Integer vendorId);

    public List<VesselSchedules> findAllVesselSchedule();

    public void updateOrderItem (OrderItems orderItems);

    public List<OrderItems> findAllOrderItemsByOrderIdSea(Integer orderId);

    public List<OrderItems> findAllOrderItemsByOrderIdLand(Integer orderId);

    public List<Orders> findOrdersByFCL();

    public List<Orders> findOrdersByCityFCL(String originationPort);

    public List<Orders> findOrdersByLCL();

    public List<Orders> findOrdersByCityLCL(String originationPort);

    public List<Orders> findOrdersByLCU();

    public List<Orders> findOrdersByCityLCU(String originationPort);

    public List<Orders> findOrdersByRCU();

    public List<Orders> findOrdersByCityRCU(String originationPort);

}
