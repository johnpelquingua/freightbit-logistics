package com.sr.biz.freightbit.vendor.dao.impl;

/**
 * Created with IntelliJ IDEA.
 * User: johnpelquingua.com
 */

import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.vendor.dao.TrucksDao;
import com.sr.biz.freightbit.vendor.entity.Trucks;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class TrucksDaoImpl extends HibernateDaoSupport implements TrucksDao {

    private static final Logger log = Logger.getLogger(TrucksDaoImpl.class);

    @Override
    public void addTrucks(Trucks trucks) {
        log.debug("Adding Trucks");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.save(trucks);
            log.debug("Trucks added successfully");
        } catch (RuntimeException e) {
            log.error("Trucks added failed", e);
            throw e;
        }
    }

    @Override
    public void deleteTrucks(Trucks trucks) {
        log.debug("Deleting Trucks");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.delete(trucks);
            log.debug("Trucks deleted successfully");
        } catch (RuntimeException e) {
            log.error("Trucks delete failed", e);
            throw e;
        }
    }

    @Override
    public List<Trucks> findAllTrucks() {
        log.debug("Finding all trucks");
        try {
            return getSessionFactory().getCurrentSession()
                    .createQuery("from Trucks").list();
        } catch (RuntimeException e) {
            log.error("Find all failed", e);
            throw e;
        }
    }


    public List<User> findAllUsersByClientId(Long clientId) {
        log.debug("finding User instance by client");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from User u where u.clientId = :clientId");
            query.setParameter("clientId", clientId);
            List<User> results = (List<User>) query.list();
            log.debug("find by client id successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by client id failed", re);
            throw re;
        }
    }

    @Override
    public Trucks findTrucksById(Long truckId) {
        log.debug("Getting Trucks instance with id: " + truckId);
        try {
            Trucks instance = (Trucks) getSessionFactory().getCurrentSession().get(
                    Trucks.class, truckId);
            if (instance == null) {
                log.debug("Get successful, no instance found");
            } else {
                log.debug("Get successful, instance found");
            }
            return instance;
        } catch (RuntimeException e) {
            log.error("Get failed", e);
            throw e;
        }
    }

    @Override
    public List<Trucks> findTrucksByVendorId(Integer vendorId) {
        log.debug("Getting Trucks instance by vendor id: " + vendorId);
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Trucks t where t.vendorId = :vendorId");
            query.setParameter("vendorId", vendorId);
            List<Trucks> results = (List<Trucks>) query.list();
            log.debug("Find by vendorId successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("Get failed", re);
            throw re;
        }
    }

    @Override
    public List<Trucks> findTrucksByTruckCode(String truckCode) {
        log.debug("Finding Trucks instance");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Trucks t where t.truckCode = :truckCode");
            query.setParameter("truckCode", truckCode);
            List<Trucks> results = (List<Trucks>) query.list();
            log.debug("Find by truckCode successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException e) {
            log.error("Find by truckCode failed", e);
            throw e;
        }
    }

    @Override
    public void updateTrucks(Trucks trucks) {
        log.debug("Updating Trucks");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(trucks);
            log.debug("Update successful");
        } catch (RuntimeException e) {
            log.error("update failed", e);
            throw e;
        }
    }
}
