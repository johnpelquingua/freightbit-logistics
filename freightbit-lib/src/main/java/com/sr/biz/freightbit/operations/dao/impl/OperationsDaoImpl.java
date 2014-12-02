package com.sr.biz.freightbit.operations.dao.impl;

import com.sr.biz.freightbit.operations.dao.OperationsDao;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
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
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders order by createdTimestamp desc");
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
    public List<OrderItems> findAllOrderItemsByOrderIdSea(Integer orderId) {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from OrderItems o where o.orderId = :orderId and o.status='PLANNING 1'");
            query.setParameter("orderId", orderId);
            List<OrderItems> results = (List<OrderItems>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<OrderItems> findAllOrderItemsByOrderIdLand(Integer orderId) {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from OrderItems o where o.orderId = :orderId and (o.status = 'PLANNING 2' or o.status = 'PLANNING 3')");
            query.setParameter("orderId", orderId);
            List<OrderItems> results = (List<OrderItems>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByFCL() {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'FULL CONTAINER LOAD'");
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByCityFCL(String originationPort) {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'FULL CONTAINER LOAD' and o.originationPort = :originationPort");
            query.setParameter("originationPort", originationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }

    }

    @Override
    public List<Orders> findOrdersByLCL() {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LESS CONTAINER LOAD'");
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByCityLCL(String originationPort) {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LESS CONTAINER LOAD' and o.originationPort = :originationPort");
            query.setParameter("originationPort", originationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }

    }

    @Override
    public List<Orders> findOrdersByLCU() {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LOOSE CARGO LOAD'");
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByCityLCU(String originationPort) {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'LOOSE CARGO LOAD' and o.originationPort = :originationPort");
            query.setParameter("originationPort", originationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }

    }

    @Override
    public List<Orders> findOrdersByRCU() {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'ROLLING CARGO LOAD'");
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
            log.error("Find failed.", e);
            throw e;
        }
    }

    @Override
    public List<Orders> findOrdersByCityRCU(String originationPort) {
        log.debug("Find initiated.");
        try {
            log.debug("Find succeeded.");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.serviceRequirement = 'ROLLING CARGO LOAD' and o.originationPort = :originationPort");
            query.setParameter("originationPort", originationPort);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch(Exception e){
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

    @Override
    public List<VesselSchedules> findAllVesselSchedule() {
        log.debug("Find initiated");
        try {
             log.debug("Find succeed");
            Query query = getSessionFactory().getCurrentSession().createQuery("from VesselSchedules");
            List<VesselSchedules> results = (List<VesselSchedules>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Find failed", e);
            throw e;
        }
    }

    @Override
    public void updateOrderItem(OrderItems orderItems) {
        log.debug("Updating orderItems thru Planning Module");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(orderItems);
            log.debug("Update Successful");
        } catch (Exception e) {
            log.error("Update failed", e);
            throw e;
        }
    }
}
