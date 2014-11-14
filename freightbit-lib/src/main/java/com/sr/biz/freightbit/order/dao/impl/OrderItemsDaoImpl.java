package com.sr.biz.freightbit.order.dao.impl;

import com.sr.biz.freightbit.order.dao.OrderItemsDao;
import com.sr.biz.freightbit.order.entity.OrderItems;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
public class OrderItemsDaoImpl extends HibernateDaoSupport implements OrderItemsDao {

    private static final Logger Log = Logger.getLogger(OrderDaoImpl.class);

    @Override
    public List<OrderItems> findAllItemByOrderId(Integer orderId) {
        Log.debug("finding Items by orderId");
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery("from OrderItems o where o.orderId = :orderId");
            query.setParameter("orderId", orderId);
            List<OrderItems> results = (List<OrderItems>) query.list();
            Log.debug("find by items successful, result size:" + results.size());
            return results;
        }catch(RuntimeException re){
            Log.error("find by client id failed",re);
            throw re;
        }
    }

    @Override
    public void addItems(OrderItems orderItems) {
        Log.debug("adding a new item");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.save(orderItems);
            Log.debug("add successful");
        } catch (RuntimeException re) {
            Log.error("add failed", re);
            throw re;
        }
    }

    @Override
    public void deleteItem(OrderItems orderItems){
        Log.debug("deleting a item");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.delete(orderItems);
            Log.debug("delete successful");
        }catch(RuntimeException re){
            Log.error("delete failed", re);
            throw re;
        }
    }

    @Override
    public OrderItems findOrderItemByOrderItemId(Integer orderItemId){
        Log.debug("getting Item instance with id: " + orderItemId);

        try{
            OrderItems instance = (OrderItems) getSessionFactory().getCurrentSession().get(
                    OrderItems.class, orderItemId);
            if (instance == null) {
                Log.debug("get successful, no instance found");
            } else {
                Log.debug("get successful, instance found");
            }
            return instance;

        }catch(RuntimeException re){
            Log.error("get failed", re);
            throw re;
        }

    }

    @Override
    public List<OrderItems> findAllOrderItemLCL() {
        Log.debug("Finding all orderItems");
        try {
            return getSessionFactory().getCurrentSession()
                    .createQuery("from OrderItems where serviceRequirement = 'LESS CONTAINER LOAD'").list();
        } catch (RuntimeException re) {
            Log.error("Find all failed", re);
            throw re;
        }
    }
}