package com.sr.biz.freightbit.operations.dao.impl;

import com.sr.biz.freightbit.operations.dao.OperationsDao;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 8/4/14.
 */
@Transactional
public class OperationsDaoImpl extends HibernateDaoSupport implements OperationsDao {

    private static final Logger log = Logger.getLogger(OrderStatusLogsDaoImpl.class);

    @Override
    public List<Orders> findAllOrders() {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.orderStatus = 'APPROVED'");
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<OrderItems> findAllOrderItemsByOrderId(Integer orderId) {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from OrderItems o where o.orderId = :orderId");
            query.setParameter("orderId", orderId);
            List<OrderItems> results = (List<OrderItems>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public OrderItems findOrderItemById(Integer orderItemId) {
        log.debug("Find initiated");
        try {
            log.debug("Find succeeded");
            OrderItems instance = (OrderItems) getSessionFactory().getCurrentSession().get(OrderItems.class, orderItemId);
            if (instance == null) {
                log.debug("get successful, no instance found");
            } else {
                log.debug("get successful, instance found");
            }
            return instance;
        } catch (Exception e) {
            log.error("Find failed", e);
            throw e;
        }
    }

    @Override
    public List<VesselSchedules> findVesselScheduleByVendorId(Integer vendorId){
        log.debug("Find initiated");
        try {
            log.debug("Find succeed");
            Query query = getSessionFactory().getCurrentSession().createQuery("from VesselSchedules v where v.vendorId = :vendorId");
            query.setParameter("vendorId", vendorId);
            List<VesselSchedules> results = (List<VesselSchedules>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Find failed", e);
            throw e;
        }
    }
}
