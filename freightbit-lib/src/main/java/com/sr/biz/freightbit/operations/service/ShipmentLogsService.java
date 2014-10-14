package com.sr.biz.freightbit.operations.service;

import com.sr.biz.freightbit.operations.entity.ShipmentLogs;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.List;

/**
 * Created by JMXPSX on 10/14/2014.
 */
public interface ShipmentLogsService {

    public void addShipmentLog(ShipmentLogs shipmentLogs);

    public List<Orders> findAllOrders();
}
