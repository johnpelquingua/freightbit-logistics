package com.sr.biz.freightbit.operations.dao.impl;

import com.sr.biz.freightbit.operations.dao.OrderStatusLogsDao;
import com.sr.biz.freightbit.operations.entity.OrderStatusLogs;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Clarence C. Victoria on 7/30/14.
 */
@Transactional
public class OrderStatusLogsDaoImpl extends HibernateDaoSupport implements OrderStatusLogsDao {
    private static final Logger log = Logger.getLogger(OrderStatusLogsDaoImpl.class);

    @Override
    public void addOrderStatus(OrderStatusLogs orderStatusLogs) {
        log.debug("Adding entry at table");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.save(orderStatusLogs);
            log.debug("Entry added successfully");
        } catch (Exception e) {
            log.error("Adding new entry failed", e);
            throw e;
        }
    }

    @Override
    public void updateStatusOrders(Orders orders) {
        log.debug("Updating status of orders");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(orders);
            log.debug("Update Succeed");
        } catch (Exception e) {
            log.error("Update failed");
            throw e;
        }
    }

    @Override
    public void updateStatusOrderItem(OrderItems orderItems) {
        log.debug("Updating status of orderItem");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(orderItems);
            log.debug("update succeed");
        } catch (Exception e) {
            log.error("Update failed");
            throw e;
        }
    }

    @Override
    public List<Orders> findAllOrders() {

        List<String> statusList = new ArrayList<>();
        statusList.add("APPROVED");
        statusList.add("PENDING");
        statusList.add("DISAPPROVED");
        statusList.add("BOOKING ON PROCESS");
        statusList.add("PLANNING 1");
        statusList.add("PLANNING 2");
        statusList.add("PLANNING 3");
        statusList.add("SERVICE ACCOMPLISHED");

        log.debug("Finding orders with filter");
        try {
            log.debug("Finding orders succeeded");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.status not in(:statusList)");
            query.setParameter("statusList", statusList);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Finding orders failed");
            throw e;
        }
    }

    @Override
    public List<OrderItems> findAllItemsByOrderId(Integer orderId) {
        log.debug("Finding orderItems via orderId");
        try {
            log.debug("Finding orderItems succeed");
            Query query = getSessionFactory().getCurrentSession().createQuery("from OrderItems o where o.orderId = :orderId");
            query.setParameter("orderId", orderId);
            List<OrderItems> results = (List<OrderItems>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Finding orderItems failed");
            throw e;
        }
    }

    @Override
    public OrderItems findOrderItemById(Integer orderItemId) {
        log.debug("Finding orderItem via id");
        try {
            log.debug("finding order item succeed");
            OrderItems instance = (OrderItems) getSessionFactory().getCurrentSession().get(OrderItems.class, orderItemId);
            if (instance == null) {
                log.debug("get successful, no instance found");
            } else {
                log.debug("get successful, instance found");
            }
            return instance;

        } catch (Exception e) {
            log.error("Finding orderitem failed");
            throw e;
        }
    }
}
