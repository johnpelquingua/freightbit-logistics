package com.sr.biz.freightbit.customer.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.sr.biz.freightbit.customer.dao.RatesDao;
import com.sr.biz.freightbit.customer.entity.Rates;

import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Solutions Resource on 5/27/14.
 */
@Transactional
public class RateDaoImpl extends HibernateDaoSupport implements RatesDao {

    private static final Logger log = Logger.getLogger(RateDaoImpl.class);

    @Override
    public void addRate(Rates rate) {
        log.debug("adding a new rate");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.save(rate);
            log.debug("add successful");
        } catch (RuntimeException re) {
            log.error("add failed", re);
            throw re;
        }
    }

    @Override
    public void deleteRate(Rates rate) {
        log.debug("deleting a Rate");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.delete(rate);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }

    @Override
    public List<Rates> findAllRates(Integer customerRateId) {
        log.debug("finding all Rates");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from User where customerRateId = :customerRateId");
            query.setParameter("customerRateId", customerRateId);
            return query.list();
        } catch (RuntimeException re) {
            log.error("find all failed", re);
            throw re;
        }
    }

    @Override
    public List<Rates> findAllRatesByClientId(Integer clientId) {
        log.debug("finding User instance by Rate");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from User u where u.clientId = :clientId");
            query.setParameter("clientId", clientId);
            List<Rates> results = (List<Rates>) query.list();
            log.debug("find by rate id successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by client id failed", re);
            throw re;
        }
    }

    @Override
    public List<Rates> findAllRatesByRatesId(Integer customerRateId) {
        log.debug("finding User instance by Rate");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from User u where u.customerRateId = :customerRateId");
            query.setParameter("customerRateId", customerRateId);
            List<Rates> results = (List<Rates>) query.list();
            log.debug("find by rate id successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by client id failed", re);
            throw re;
        }
    }

    @Override
    public List<Rates> findAllRatesByCustomerId(Integer customerId) {
        log.debug("finding customer by client");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Rates a where a.customerId = :customerId");
            query.setParameter("customerId", customerId);
            List<Rates> results = (List<Rates>) query.list();
            log.debug("find by client id successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("finding customer failed", re);
            throw re;
        }
    }

    @Override
    public Rates findRateById(Integer customerRateId) {
        log.debug("getting Rate instance with customerRateId: " + customerRateId);
        try {
            Rates instance = (Rates) getSessionFactory().getCurrentSession().get(
                    Rates.class, customerRateId);
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
    public void updateRate(Rates rate) {
        log.debug("updating a new rate");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(rate);
            log.debug("update successful");
        } catch (RuntimeException re) {
            log.error("update failed", re);
            throw re;
        }
    }



}
