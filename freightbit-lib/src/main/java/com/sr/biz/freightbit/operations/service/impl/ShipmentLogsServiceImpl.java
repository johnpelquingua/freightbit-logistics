package com.sr.biz.freightbit.operations.service.impl;

import com.sr.biz.freightbit.operations.dao.ShipmentLogsDao;
import com.sr.biz.freightbit.operations.entity.ShipmentLogs;
import com.sr.biz.freightbit.operations.service.ShipmentLogsService;
import com.sr.biz.freightbit.order.entity.Orders;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by JMXPSX on 10/14/2014.
 */
public class ShipmentLogsServiceImpl implements ShipmentLogsService {

    private ShipmentLogsDao shipmentLogsDao;

    public void setShipmentLogsDao(ShipmentLogsDao shipmentLogsDao) {
        this.shipmentLogsDao = shipmentLogsDao;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addShipmentLog(ShipmentLogs shipmentLogs) {
        shipmentLogsDao.addShipmentLog(shipmentLogs);
    }

    @Override
    public List<Orders> findAllOrders() {
        return shipmentLogsDao.findAllOrders();
    }
}
