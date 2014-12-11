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

    public List<VesselSchedules> findVesselScheduleByVendorIdOriDesClass(Integer vendorId, String originPort, String destinationPort);

    public List<VesselSchedules> findAllVesselSchedule();

    public void updateOrderItem (OrderItems orderItems);

    public List<OrderItems> findAllOrderItemsByOrderIdSea(Integer orderId);

    public List<OrderItems> findAllOrderItemsByOrderIdLand(Integer orderId);

    public List<Orders> findOrdersByFCL();

    public List<Orders> findOrdersByFCLTrucks();

    public List<Orders> findOrdersByFCLTrucksOrigin(String originationPort);

    public List<Orders> findOrdersByFCLTrucksDestination(String destinationPort);

    public List<Orders> findOrdersByOriginDestinationFCL(String originationPort, String destinationPort);

    public List<Orders> findOrdersByLCL();

    public List<Orders> findOrdersByLCLTrucks();

    public List<Orders> findOrdersByLCLTrucksOrigin(String originationPort);

    public List<Orders> findOrdersByLCLTrucksDestination(String destinationPort);

    public List<Orders> findOrdersByOriginDestinationLCL(String originationPort, String destinationPort);

    public List<Orders> findOrdersByOriginDestinationStatusTypeLCL(String originationPort, String destinationPort);

    public List<Orders> findOrdersByLCU();

    public List<Orders> findOrdersByLCUTrucks();

    public List<Orders> findOrdersByLCUTrucksOrigin(String originationPort);

    public List<Orders> findOrdersByLCUTrucksDestination(String destinationPort);

    public List<Orders> findOrdersByOriginDestinationLCU(String originationPort, String destinationPort);

    public List<Orders> findOrdersByRCU();

    public List<Orders> findOrdersByRCUTrucks();

    public List<Orders> findOrdersByRCUTrucksOrigin(String originationPort);

    public List<Orders> findOrdersByRCUTrucksDestination(String destinationPort);

    public List<Orders> findOrdersByOriginDestinationRCU(String originationPort, String destinationPort);

    public List<Orders> findOrdersByFTL();

    public List<Orders> findOrdersByOriginDestinationFTL(String originationPort, String destinationPort);

    public List<Orders> findOrdersByOriginFTL(String originationPort);

    public List<Orders> findOrdersByLTL();

    public List<Orders> findOrdersByOriginDestinationLTL(String originationPort, String destinationPort);

    public List<Orders> findOrdersByOriginLTL(String originationPort);

}
