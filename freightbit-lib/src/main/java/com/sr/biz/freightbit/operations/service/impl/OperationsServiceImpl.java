package com.sr.biz.freightbit.operations.service.impl;

import com.sr.biz.freightbit.operations.dao.OperationsDao;
import com.sr.biz.freightbit.operations.service.OperationsService;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 8/4/14.
 */
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
    public OrderItems findOrderItemById(Integer orderItemId) {
        return operationsDao.findOrderItemById(orderItemId);
    }

    @Override
    public List<VesselSchedules> findVesselScheduleByVendorId(Integer vendorId) {
        return operationsDao.findVesselScheduleByVendorId(vendorId);
    }

}
