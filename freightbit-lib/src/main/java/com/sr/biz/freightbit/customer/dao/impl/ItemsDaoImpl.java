package com.sr.biz.freightbit.customer.dao.impl;

import java.util.List;

import com.sr.biz.freightbit.customer.dao.ItemsDao;
import com.sr.biz.freightbit.customer.entity.Items;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Solutions Resource on 5/26/14.
 */


@Transactional
public class ItemsDaoImpl extends HibernateDaoSupport implements ItemsDao {
    private static final Logger log = Logger.getLogger(ItemsDaoImpl.class);

    @Override
    public void addItems(Items items) {
        log.debug("adding a new item");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.save(items);
            log.debug("add successful");
        } catch (RuntimeException re) {
            log.error("add failed", re);
            throw re;
        }
    }

    @Override
    public void deleteItems(Items items) {
        log.debug("deleting a item");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.delete(items);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }

    @Override
    public Items findItemByCustomerItemsId(Integer customerItemsId) {
        log.debug("getting Items instance with id: " + customerItemsId);
        try {
            Items instance = (Items) getSessionFactory().getCurrentSession().get(
                    Items.class, customerItemsId);
            if (instance == null) {
                log.debug("get successful, no instance found");
            } else {
                log.debug("get successful, instance found");
            }
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }

    @Override
    public List<Items> findAllItems(Integer customerItemsId) {
        log.debug("finding all Items");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Items where customerItemsId = :customerItemsId");
            query.setParameter("customerItemsId", customerItemsId);
            return query.list();
        } catch (RuntimeException re) {
            log.error("find all failed", re);
            throw re;
        }
    }

    @Override
    public List<Items> findAllItemsByClientId(Integer clientId) {
        log.debug("finding all Items");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from User where clientId = :clientId");
            query.setParameter("clientId", clientId);
            return query.list();
        } catch (RuntimeException re) {
            log.error("find all failed", re);
            throw re;
        }
    }

    @Override
    public List<Items> findUserByItemName(String itemName) {
        log.debug("finding User instance by example");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Items u where u.itemName = :itemName");
            query.setParameter("itemName", itemName);
            List<Items> results = (List<Items>) query.list();
            log.debug("find by itemName successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by itemName failed", re);
            throw re;
        }
    }

    @Override
    public void updateItems(Items items) {
        log.debug("updating a new items");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(items);
            log.debug("update successful");
        } catch (RuntimeException re) {
            log.error("update failed", re);
            throw re;
        }
    }


    public List<Items> findItemByCustomerId(Integer customerId) {
        log.debug("find item by customer id");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Items i where i.customerId = :customerId");
            query.setParameter("customerId", customerId);
            List<Items> result = (List<Items>) query.list();
            log.debug("find by itemName successful, result size :" + result.size());
            return result;
        } catch (RuntimeException re) {
            log.error("finding failed", re);
            throw re;
        }

    }
}
