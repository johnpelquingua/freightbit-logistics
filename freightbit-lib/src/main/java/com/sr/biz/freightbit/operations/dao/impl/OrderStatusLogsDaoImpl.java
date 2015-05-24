package com.sr.biz.freightbit.operations.dao.impl;

import com.sr.biz.freightbit.operations.dao.OrderStatusLogsDao;
import com.sr.biz.freightbit.operations.entity.OrderStatusLogs;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

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
    public void updateOrderStatusLogsItems(OrderStatusLogs orderStatusLogs) {
        log.debug("Updating status of orderItem");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(orderStatusLogs);
            log.debug("update succeed");
            System.out.println("<----------------update succeed---------------->");
            System.out.println(orderStatusLogs.getStatus() + ", " + orderStatusLogs.getOrderItemId());
        } catch (Exception e) {
            log.error("Update failed");
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
            System.out.println("<----------------update succeed---------------->");
            System.out.println(orderItems.getStatus() + ", " + orderItems.getOrderItemId());
        } catch (Exception e) {
            log.error("Update failed");
            throw e;
        }
    }

    @Override
    public List<Orders> findAllOrders() {

        List<String> statusList = new ArrayList<>();
        statusList.add("ON GOING");
        statusList.add("SERVICE ACCOMPLISHED");
        statusList.add("SERVICE ACCOMPLISHED - ARCHIVED");

        log.debug("Finding orders with filter");
        try {
            log.debug("Finding orders succeeded");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.orderStatus in(:statusList) order by createdTimestamp desc");
            query.setParameterList("statusList", statusList);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Finding orders failed");
            throw e;
        }
    }

    @Override
    public List<OrderStatusLogs> findAllShipmentLogs(Integer orderItemId) {
        log.debug("Finding all Shipment Logs");
        try{
            /*return getSessionFactory().getCurrentSession().createQuery("from OrderStatusLogs orderStatusLogs order by createdTimestamp desc").list();*/
            Query query = getSessionFactory().getCurrentSession().createQuery("from OrderStatusLogs o where o.orderItemId = :orderItemId order by createdTimestamp desc");
            query.setParameter("orderItemId", orderItemId);
            List<OrderStatusLogs> results = (List<OrderStatusLogs>) query.list();
            log.debug("find by client id successful, result size:" + results.size());
            return results;
        }catch(RuntimeException re) {
            log.error("find all Shipment Logs failed", re);
            throw re;
        }
    }


    @Override
    public List<OrderItems> findAllItemsByOrderId(Integer orderId) {
        log.debug("Finding orderItems via orderId");
        try {
            log.debug("Finding orderItems succeed");
            Query query = getSessionFactory().getCurrentSession().createQuery("from OrderItems o where o.orderId = :orderId order by createdTimestamp desc");
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
            log.error("Finding order item failed");
            throw e;
        }
    }

    @Override
    public OrderStatusLogs findOrderStatusLogsById(Integer orderItemId) {
        log.debug("Finding orderItem via id");
        try {
            /*log.debug("finding order item succeed");
            OrderStatusLogs instance = (OrderStatusLogs) getSessionFactory().getCurrentSession().get(OrderItems.class, orderItemId);
            if (instance == null) {
                log.debug("get successful, no instance found");
            } else {
                log.debug("get successful, instance found");
            }
            return instance;*/
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from OrderStatusLogs o where o.orderItemId = :orderItemId order by createdTimestamp asc");
            query.setParameter("orderItemId", orderItemId);
            List<OrderStatusLogs> results = (List<OrderStatusLogs>) query.list();
            if (results != null && results.size() > 0) {
                return results.get(results.size() - 1);
            }
            return null;

        } catch (Exception e) {
            log.error("Finding order item failed");
            throw e;
        }
    }

    @Override
    public OrderStatusLogs findOrderStatusLogsStatusById(Integer statusId) {
        log.debug("Finding orderStatusLogs via orderItemId");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from OrderStatusLogs osl where osl.statusId = :statusId");
            query.setParameter("statusId", statusId);
            List<OrderStatusLogs> results = (List<OrderStatusLogs>) query.list();
            if (results != null && results.size() > 0)
                return results.get(0);
            else
                return null;
        } catch (Exception e) {
            log.error("Finding orderItems failed");
            throw e;
        }
    }
}
