package com.sr.biz.freightbit.order.dao.impl;

import java.util.List;
import org.hibernate.criterion.Restrictions;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.order.dao.OrderDao;
import com.sr.biz.freightbit.order.entity.Orders;

/**
 * Created by JMXPSX on 5/27/14.
 */
@Transactional
public class OrderDaoImpl extends HibernateDaoSupport implements OrderDao{

    private static final Logger Log = Logger.getLogger(OrderDaoImpl.class);


    @Override
    public void addOrder(Orders order) {
        Log.debug("Add Booking");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.save(order);
            Log.debug("Booking added successfully");
        }catch(RuntimeException re){
            Log.error("add booking failed", re);
            throw re;
        }
    }


    @Override
    public void deleteOrder(Orders order) {
        Log.debug("Delete Booking");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.delete(order);
            Log.debug("delete booking successful");
        }catch(RuntimeException re) {
            Log.error("delete booking failed", re);
            throw re;
        }
    }


    @Override
    public void updateOrder(Orders order) {
        Log.debug("Update Booking");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(order);
            Log.debug("update booking successful");
        }catch (RuntimeException re) {
            Log.error("update failed", re);
            throw re;
        }
    }


    @Override
    public List<Orders> findAllOrders(){
        Log.debug("finding all drivers");
        try{
            return getSessionFactory().getCurrentSession().createQuery("from Orders").list();
        }catch (RuntimeException re){
            Log.error("find all failed", re);
            throw re;
        }
    }


    @Override
    public List<Orders> findAllOrdersByClientId (Integer clientId) {
        Log.debug("finding Orders by client");
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.clientId = :clientId");
            query.setParameter("clientId", clientId);
            List<Orders> results = (List<Orders>) query.list();
            Log.debug("find by client id successful, result size:" + results.size());
            return results;
        }catch(RuntimeException re){
            Log.error("find by client id failed",re);
            throw re;
        }
    }


    @Override
    public Orders findOrdersById (Integer orderId){
        Log.debug("getting Order instance by id:"  + orderId);
        try{
            Orders instance = (Orders) getSessionFactory().getCurrentSession().get(Orders.class, orderId);
            if (instance == null) {
                Log.debug("get successful, no instance found");
            }else {
                Log.debug("get successful, instance found");
            }
            return instance;
        }catch(RuntimeException re){
            Log.error("get failed", re);
            throw re;
        }
    }


    @Override
    public List<Orders> findOrdersByOrderNumber (String orderNumber){
        Log.debug("finding Orders instance by Order Number");
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.orderNumber = :orderNumber");
            query.setParameter("orderNumber", orderNumber);
            List<Orders> results = (List<Orders>) query.list();
            Log.debug("find by Order Name successful, result size: " + results.size());
            return results;
        }catch(RuntimeException re){
            Log.error("find by order name failed", re);
            throw re;
        }
    }

    @Override
    public List<Orders> findOrdersByCriteria(String column, String value, Integer clientId) {
        Log.debug("Find vendor by criteria ");
        Session session = getSessionFactory().getCurrentSession();
        List<Orders> orders = session.createCriteria(Orders.class)
                .add(Restrictions.like(column, value))
                .add(Restrictions.eq("clientId", clientId))
                .list();
        return orders;
    }
}
