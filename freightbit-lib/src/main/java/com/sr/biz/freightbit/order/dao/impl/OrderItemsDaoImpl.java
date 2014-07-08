package com.sr.biz.freightbit.order.dao.impl;

import com.sr.biz.freightbit.order.dao.OrderItemsDao;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.apache.log4j.Logger;
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
}

