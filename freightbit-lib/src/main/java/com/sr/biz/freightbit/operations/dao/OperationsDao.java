package com.sr.biz.freightbit.operations.dao;

import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;

import java.util.List;

public interface OperationsDao {

    public List<Orders> findAllOrders();

    public List<OrderItems> findAllOrderItemsByOrderId(Integer orderId);

    public OrderItems findOrderItemById(Integer orderItemId);

    public List<VesselSchedules> findVesselScheduleByVendorId(Integer vendorId);

    public List<VesselSchedules> findVesselScheduleByVendorIdOriDesClass(Integer vendorId, String originPort, String destinationPort );

    public List<VesselSchedules> findAllVesselSchedule();

    public void updateOrderItem(OrderItems orderItems);

    public List<OrderItems> findAllOrderItemsByOrderIdSea(Integer orderId);

    public List<OrderItems> findAllOrderItemsByOrderIdLand(Integer orderId);

    public List<Orders> findOrdersByFCL();

    public List<Orders> findOrdersByOriginDestinationFCL(String originationPort, String destinationPort);

    public List<Orders> findOrdersByLCL();

    public List<Orders> findOrdersByOriginDestinationLCL(String originationPort, String destinationPort);

    public List<Orders> findOrdersByOriginDestinationStatusTypeLCL(String originationPort , String destinationPort);

    public List<Orders> findOrdersByLCU();

    public List<Orders> findOrdersByOriginDestinationLCU(String originationPort, String destinationPort);

    public List<Orders> findOrdersByRCU();

    public List<Orders> findOrdersByOriginDestinationRCU(String originationPort, String destinationPort);

    public List<Orders> findOrdersByFTL();

    public List<Orders> findOrdersByOriginDestinationFTL(String originationPort, String destinationPort);

    public List<Orders> findOrdersByLTL();

    public List<Orders> findOrdersByOriginDestinationLTL(String originationPort, String destinationPort);

}
