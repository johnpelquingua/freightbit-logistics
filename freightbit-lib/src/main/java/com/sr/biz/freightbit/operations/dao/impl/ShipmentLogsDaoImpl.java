package com.sr.biz.freightbit.operations.dao.impl;

import com.sr.biz.freightbit.operations.dao.ShipmentLogsDao;
import com.sr.biz.freightbit.operations.entity.ShipmentLogs;
import com.sr.biz.freightbit.order.entity.Orders;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by JMXPSX on 10/14/2014.
 */
@Transactional
public class ShipmentLogsDaoImpl extends HibernateDaoSupport implements ShipmentLogsDao {
    private static final Logger log = Logger.getLogger(ShipmentLogsDaoImpl.class);

    @Override
    public void addShipmentLog(ShipmentLogs shipmentLogs) {
        log.debug("Adding shipment log to table");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.save(shipmentLogs);
        }catch (Exception e) {
            log.error("Adding new shipment log failed", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findAllOrders() {

        List<String> statusList = new ArrayList<>();

        statusList.add("APPROVED");

        log.debug("Finding orders with filter");
        try{
            log.debug("Finding orders succeeded");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.orderStatus in(:statusList) order by createdTimestamp desc");
            query.setParameterList("statusList", statusList);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        }catch (Exception e) {
            log.error("Finding orders failed");
            throw e;
        }
    }

    @Override
    public List<ShipmentLogs> findAllShipmentLogs() {
        log.debug("Finding all Shipment Logs");
        try{
            return getSessionFactory().getCurrentSession().createQuery("from ShipmentLogs shipmentLogs order by createdDate desc").list();
        }catch(RuntimeException re) {
            log.error("find all Shipment Logs failed", re);
            throw re;
        }

    }

}
