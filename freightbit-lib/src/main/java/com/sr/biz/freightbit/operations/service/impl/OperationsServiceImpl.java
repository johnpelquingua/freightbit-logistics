package com.sr.biz.freightbit.operations.service.impl;

import com.sr.biz.freightbit.operations.dao.OperationsDao;
import com.sr.biz.freightbit.operations.service.OperationsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;

import java.util.List;

public class OperationsServiceImpl implements OperationsService{

    private OperationsDao operationsDao;

    public void setOperationsDao(OperationsDao operationsDao) {
        this.operationsDao = operationsDao;
    }

    @Override
    public List<Orders> findAllOrders() {
        return operationsDao.findAllOrders();
    }

    @Override
    public List<OrderItems> findAllOrderItemsByOrderId(Integer orderId) {
        return operationsDao.findAllOrderItemsByOrderId(orderId);
    }

    @Override
    public List<OrderItems> findAllOrderItemsWithContainer(Integer containerId) {
        return operationsDao.findAllOrderItemsWithContainer(containerId);
    }

    @Override
    public List<OrderItems> findAllOrderItemsByOrderIdSea(Integer orderId) {
        return operationsDao.findAllOrderItemsByOrderIdSea(orderId);
    }

    @Override
    public List<OrderItems> findAllOrderItemsByOrderIdLand(Integer orderId) {
        return operationsDao.findAllOrderItemsByOrderIdLand(orderId);
    }

    @Override
    public OrderItems findOrderItemById(Integer orderItemId) {
        return operationsDao.findOrderItemById(orderItemId);
    }

    @Override
    public List<VesselSchedules> findVesselScheduleByVendorId(Integer vendorId) {
        return operationsDao.findVesselScheduleByVendorId(vendorId);
    }

    @Override
    public List<OrderItems> findAllOrderItemsByVoyageNumber(String vesselScheduleId) {
        return operationsDao.findAllOrderItemsByVoyageNumber(vesselScheduleId);
    }

    @Override
    public List<VesselSchedules> findVesselScheduleByVendorIdOriDesClass(Integer vendorId, String originPort, String destinationPort) {
        return operationsDao.findVesselScheduleByVendorIdOriDesClass(vendorId, originPort, destinationPort );
    }

    @Override
    public List<VesselSchedules> findVesselScheduleByOriDesClass(String originPort, String destinationPort) {
        return operationsDao.findVesselScheduleByOriDesClass(originPort, destinationPort );
    }

    @Override
    public List<VesselSchedules> findAllVesselSchedule() {
        return operationsDao.findAllVesselSchedule();
    }

    @Override
    public void updateOrderItem (OrderItems orderItems) {
        operationsDao.updateOrderItem(orderItems);
    }

    @Override
    public List<Orders> findOrdersByFCL() {
        return operationsDao.findOrdersByFCL();
    }

    @Override
    public List<Orders> findOrdersByFCLTrucks() {
        return operationsDao.findOrdersByFCLTrucks();
    }

    @Override
    public List<Orders> findOrdersByFCLTrucksOrigin(String originationPort) {
        return operationsDao.findOrdersByFCLTrucksOrigin(originationPort);
    }

    @Override
    public List<Orders> findOrdersByFCLTrucksDestination(String destinationPort) {
        return operationsDao.findOrdersByFCLTrucksDestination(destinationPort);
    }

    @Override
    public List<Orders> findOrdersByOriginDestinationFCL(String originationPort, String destinationPort) {
        return operationsDao.findOrdersByOriginDestinationFCL(originationPort,destinationPort);
    }

    @Override
    public List<Orders> findOrdersByLCL() {
        return operationsDao.findOrdersByLCL();
    }

    @Override
    public List<Orders> findOrdersByLCLTrucks() {
        return operationsDao.findOrdersByLCLTrucks();
    }

    @Override
    public List<Orders> findOrdersByLCLTrucksOrigin(String originationPort) {
        return operationsDao.findOrdersByLCLTrucksOrigin(originationPort);
    }

    @Override
    public List<Orders> findOrdersByLCLTrucksDestination(String destinationPort) {
        return operationsDao.findOrdersByLCLTrucksDestination(destinationPort);
    }

    @Override
    public List<Orders> findOrdersByOriginDestinationLCL(String originationPort, String destinationPort) {
        return operationsDao.findOrdersByOriginDestinationLCL(originationPort,destinationPort);
    }

    @Override
    public List<Orders> findOrdersByOriginDestinationStatusTypeLCL(String originationPort, String destinationPort) {
        return operationsDao.findOrdersByOriginDestinationStatusTypeLCL(originationPort, destinationPort);
    }

    @Override
    public List<Orders> findOrdersByLCU() {
        return operationsDao.findOrdersByLCU();
    }

    @Override
    public List<Orders> findOrdersByLCUTrucks() {
        return operationsDao.findOrdersByLCUTrucks();
    }

    @Override
    public List<Orders> findOrdersByLCUTrucksOrigin(String originationPort) {
        return operationsDao.findOrdersByLCUTrucksOrigin(originationPort);
    }

    @Override
    public List<Orders> findOrdersByLCUTrucksDestination(String destinationPort) {
        return operationsDao.findOrdersByLCUTrucksDestination(destinationPort);
    }

    @Override
    public List<Orders> findOrdersByOriginDestinationLCU(String originationPort, String destinationPort) {
        return operationsDao.findOrdersByOriginDestinationLCU(originationPort,destinationPort);
    }

    @Override
    public List<Orders> findOrdersByRCU() {
        return operationsDao.findOrdersByRCU();
    }

    @Override
    public List<Orders> findOrdersByRCUTrucks() {
        return operationsDao.findOrdersByRCUTrucks();
    }

    @Override
    public List<Orders> findOrdersByRCUTrucksOrigin(String originationPort) {
        return operationsDao.findOrdersByRCUTrucksOrigin(originationPort);
    }

    @Override
    public List<Orders> findOrdersByRCUTrucksDestination(String destinationPort) {
        return operationsDao.findOrdersByRCUTrucksDestination(destinationPort);
    }

    @Override
    public List<Orders> findOrdersByOriginDestinationRCU(String originationPort, String destinationPort) {
        return operationsDao.findOrdersByOriginDestinationRCU(originationPort,destinationPort);
    }

    @Override
    public List<Orders> findOrdersByFTL() {
        return operationsDao.findOrdersByFTL();
    }

    @Override
    public List<Orders> findOrdersByOriginDestinationFTL(String originationPort, String destinationPort) {
        return operationsDao.findOrdersByOriginDestinationFTL(originationPort,destinationPort);
    }

    @Override
    public List<Orders> findOrdersByOriginFTL(String originationPort) {
        return operationsDao.findOrdersByOriginFTL(originationPort);
    }

    @Override
    public List<Orders> findOrdersByLTL() {
        return operationsDao.findOrdersByLTL();
    }

    @Override
    public List<Orders> findOrdersByOriginDestinationLTL(String originationPort, String destinationPort) {
        return operationsDao.findOrdersByOriginDestinationLTL(originationPort,destinationPort);
    }

    @Override
    public List<Orders> findOrdersByOriginLTL(String originationPort) {
        return operationsDao.findOrdersByOriginLTL(originationPort);
    }

}
