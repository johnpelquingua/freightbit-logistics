package com.sr.biz.freightbit.vendor.dao.impl;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 */

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.vendor.dao.VendorDao;
import com.sr.biz.freightbit.vendor.entity.Vendor;

@Transactional
public class VendorDaoImpl extends HibernateDaoSupport implements VendorDao {

    private static final Logger log = Logger.getLogger(VendorDaoImpl.class);

    @Override
    public Integer addVendor(Vendor vendor){
        log.debug("Adding new Vendor");
        try {
            Session session = getSessionFactory().getCurrentSession();
            Integer vendorId = (Integer) session.save(vendor);
            log.debug("Add vendor successful");
            return vendorId;
        } catch (RuntimeException re) {
            log.error("Add vendor failed", re);
            throw re;
        }
    }

    @Override
    public void deleteVendor(Vendor vendor) {
        log.debug("Deleting a Vendor");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.delete(vendor);
            log.debug("Delete successful");
        } catch (RuntimeException re) {
            log.error("Delete failed", re);
            throw re;
        }
    }

    @Override
    public List<Vendor> findAllVendors() {
        log.debug("Finding all Vendors");
        try {
            return getSessionFactory().getCurrentSession()
                    .createQuery("from Vendor").list();
        } catch (RuntimeException re) {
            log.error("Find all failed", re);
            throw re;
        }
    }
    @Override
    public List<Vendor> findAllVendorByClientId(Integer clientId) {
        log.debug("Finding Vendor instance by Client");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Vendor v where v.clientId = :clientId");
            query.setParameter("clientId", clientId);
            List<Vendor> results = (List<Vendor>) query.list();
            log.debug("find vendor by client id successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find vendor by client id failed", re);
            throw re;
        }
    }

    @Override
    public List<Vendor> findVendorsByCriteria(String column, String value, Integer clientId) {
        log.debug("Find vendor by criteria ");
        Session session = getSessionFactory().getCurrentSession();
        List<Vendor> vendors = session.createCriteria(Vendor.class)
                .add(Restrictions.like(column, value))
                .add(Restrictions.eq("client.clientId", clientId))
                .list();
        return vendors;
    }

    @Override
    public Vendor findVendorById(Integer vendorId) {
        log.debug("Getting Vendor instance with vendorId: " + vendorId);
        try {
            Vendor instance = (Vendor) getSessionFactory().getCurrentSession().get(
                    Vendor.class, vendorId);
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
    public List<Vendor> findVendorByVendorCode(String vendorCode) {
        log.debug("Finding Vendor instance by example");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Vendor v where v.vendorCode= :vendorCode");
            query.setParameter("vendorCode", vendorCode);
            List<Vendor> results = (List<Vendor>) query.list();
            log.debug("Find Vendor by vendorName successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("Find Vendor by vendorName failed", re);
            throw re;
        }
    }

    @Override
    public void updateVendor(Vendor vendor) {
        log.debug("Updating a new Vendor");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(vendor);
            log.debug("update successful");
        } catch (RuntimeException re) {
            log.error("update failed", re);
            throw re;
        }
    }
}
