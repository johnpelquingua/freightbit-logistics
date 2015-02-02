package com.sr.biz.freightbit.order.dao.impl;

import com.sr.biz.freightbit.order.dao.OrderDao;
import com.sr.biz.freightbit.order.entity.Counter;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
    public void updateOrderItems(OrderItems orderItems) {
        Log.debug("Update Booking items");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(orderItems);
            Log.debug("update booking items successful");
        }catch (RuntimeException re) {
            Log.error("update failed", re);
            throw re;
        }
    }

    @Override
    public List<Orders> findDuplicateOrderByOrderCode(String orderNumber, Integer orderId){
        Log.debug("Finding duplicate order by order number");
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Orders o where o.orderNumber= :orderNumber and o.orderId != :orderId");
            query.setParameter("orderNumber", orderNumber);
            query.setParameter("orderId", orderId);
            List<Orders> results = (List<Orders>) query.list();
            Log.debug("Find Order by OrderNumber successful, result size " + results.size());
            return results;

        } catch (RuntimeException re){
            Log.error("Find Order by OrderNumber failed", re);
            throw re;
        }
    }

    @Override
    public List<Orders> findAllOrders(){
        Log.debug("finding all drivers");
        try{
            return getSessionFactory().getCurrentSession().createQuery("from Orders order by createdTimestamp desc").list();
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
    public List<Orders> findAllOrdersByAging(Integer aging) {
        Log.debug("finding Orders by aging");
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.aging = :aging");
            query.setParameter("aging", aging);
            List<Orders> results = (List<Orders>) query.list();
            Log.debug("find by aging successful, result size:" + results.size());
            return results;
        }catch(RuntimeException re){
            Log.error("find by aging failed",re);
            throw re;
        }
    }

    @Override
    public List<OrderItems> findAllOrdersByOrderIdAndDestination(Integer orderId, String destinationPort) {
        Log.debug("finding Orders");
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.orderId = :orderId and o.destinationPort = :destinationPort");
            query.setParameter("orderId", orderId);
            query.setParameter("destinationPort", destinationPort);
            List<OrderItems> results = (List<OrderItems>) query.list();
            Log.debug("find by order successful, result size:" + results.size());
            return results;
        }catch(RuntimeException re){
            Log.error("find by aging failed",re);
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
    public OrderItems findOrderItemByOrderItemId(Integer orderItemId) {
        Log.debug("getting OrderItem instance by id:"  + orderItemId);
        try{
            OrderItems instance = (OrderItems) getSessionFactory().getCurrentSession().get(OrderItems.class, orderItemId);
            if (instance == null) {
                Log.debug("get successful, no instance found");
            }else {
                Log.debug("get successful, instance found");
            }
            return instance;
        }catch(RuntimeException re){
            Log.error("get failed", re);
            throw re;
        }    }

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
                .add(Restrictions.like(column, value, MatchMode.ANYWHERE))
                //.add(Restrictions.eq("clientId", clientId))
                .list();
        return orders;
    }

    /**
     * @param clientId
     * @param companyCode 3-character companyCode (eg., NTY, MTY)
     */
    @Override
    public Integer findNextBookingNo(Integer clientId, String companyCode) {
     Log.debug("Getting latest booking no for companyCode [" + companyCode +"]");
     String sql = "SELECT MAX(bookingNo)+1 as nextBookingNo"
       + " FROM (SELECT orderNumber, SUBSTRING(orderNumber, 5) AS bookingNo"
       + " FROM freightbit.orders"
       + " where clientId= :clientId"
          + " and orderNumber like :companyCode) as o";
     Query query = getSessionFactory().getCurrentSession().createSQLQuery(sql);
     query.setParameter("clientId", clientId);
     query.setParameter("companyCode", companyCode+"%");
     List<Double> results = query.list();
     System.out.println("results: " + results);
     if (results != null && results.size() > 0 && results.get(0) != null) {
      System.out.println("results size: " + results.size());
      System.out.println("results.get(o): " + results.get(0));
      return results.get(0).intValue();
     }
     return 0;
    }

    @Override
    public void addCounterType(Counter counter) {
        Log.debug("Add type");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.save(counter);
            Log.debug("Type added successfully");
        }catch(RuntimeException re){
            Log.error("add type failed", re);
            throw re;
        }
    }

    @Override
    public List<Orders> findCustomerWithBooking(Integer customerId) {
        Log.debug("Find customer with Booking.");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Orders d where d.customerId = :customerId");
            query.setParameter("customerId", customerId);
            List<Orders> results = (List<Orders>) query.list();
            Log.debug("Find by driverCode successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            Log.error("Find by customer Failed", re);
            throw re;
        }
    }

}
