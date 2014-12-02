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
    public List<Orders> findOrdersByCityFCL(String originationPort) {
        return operationsDao.findOrdersByCityFCL(originationPort);
    }

    @Override
    public List<Orders> findOrdersByLCL() {
        return operationsDao.findOrdersByLCL();
    }

    @Override
    public List<Orders> findOrdersByCityLCL(String originationPort) {
        return operationsDao.findOrdersByCityLCL(originationPort);
    }

    @Override
    public List<Orders> findOrdersByLCU() {
        return operationsDao.findOrdersByLCU();
    }

    @Override
    public List<Orders> findOrdersByCityLCU(String originationPort) {
        return operationsDao.findOrdersByCityLCU(originationPort);
    }

    @Override
    public List<Orders> findOrdersByRCU() {
        return operationsDao.findOrdersByRCU();
    }

    @Override
    public List<Orders> findOrdersByCityRCU(String originationPort) {
        return operationsDao.findOrdersByCityRCU(originationPort);
    }

}
