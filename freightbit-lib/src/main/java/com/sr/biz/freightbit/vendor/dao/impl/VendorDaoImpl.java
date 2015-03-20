package com.sr.biz.freightbit.vendor.dao.impl;

import com.sr.biz.freightbit.vendor.dao.VendorDao;
import com.sr.biz.freightbit.vendor.entity.Vendor;
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
public class VendorDaoImpl extends HibernateDaoSupport implements VendorDao {

    private static final Logger log = Logger.getLogger(VendorDaoImpl.class);

    @Override
    public Integer addVendor(Vendor vendor) {
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
                    .createQuery("from Vendor vendor order by createdTimestamp desc ").list();
        } catch (RuntimeException re) {
            log.error("Find all failed", re);
            throw re;
        }
    }

    @Override
    public List<Vendor> findAllShippingVendor() {

        List<String> vendorTypeList = new ArrayList<>();

        vendorTypeList.add("SHIPPING");

        log.debug("Finding vendors with filter");
        try {
            log.debug("Finding vendors succeeded");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Vendor v where v.vendorType in (:vendorTypeList)");
            query.setParameterList("vendorTypeList", vendorTypeList);
            List<Vendor> results = (List<Vendor>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Finding vendors failed");
            throw e;
        }
    }

    @Override
    public List<Vendor> findShippingVendorClass(String vendorClass) {

        List<String> vendorTypeList = new ArrayList<>();

        vendorTypeList.add("SHIPPING");

        log.debug("Finding vendors with filter");
        try {
            log.debug("Finding vendors succeeded");
            /*Query query = getSessionFactory().getCurrentSession().createQuery("from Vendor v where v.vendorType in (:vendorTypeList) and v.vendorClass = :vendorClass");*/
            Query query = getSessionFactory().getCurrentSession().createQuery("from Vendor v where v.vendorType in (:vendorTypeList)"); // vendor class removed for front end class filtering
            query.setParameterList("vendorTypeList", vendorTypeList);
            /*query.setParameter("vendorClass", vendorClass);*/
            List<Vendor> results = (List<Vendor>) query.list();
            return results;

        }catch (Exception e) {
            log.error("Finding vendors failed");
            throw e;
        }
    }

    @Override
    public List<Vendor> findVendorTruckByLocation(String serviceArea) {

        List<String> vendorTypeList = new ArrayList<>();

        vendorTypeList.add("TRUCKING");

        log.debug("Finding Vendor instance by example");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Vendor v where v.vendorType in (:vendorTypeList) and v.serviceArea = :serviceArea");
            query.setParameterList("vendorTypeList", vendorTypeList);
            query.setParameter("serviceArea", serviceArea);
            List<Vendor> results = (List<Vendor>) query.list();
            log.debug("Find Vendor by serviceArea successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("Find Vendor by serviceArea failed", re);
            throw re;
        }
    }

    @Override
    public List<Vendor> findAllVendorByClientId(Integer clientId) {
        log.debug("Finding Vendor instance by Client");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Vendor where clientId = :clientId order by createdTimestamp desc");
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
                .add(Restrictions.like(column, value, MatchMode.ANYWHERE))
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
    public List<Vendor> findErnestRecipient(String vendorCode, String serviceArea) {
        log.debug("Finding Ernest Recipient instance");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Vendor v where v.vendorCode = :vendorCode and v.serviceArea = :serviceArea");
            query.setParameter("vendorCode", vendorCode);
            query.setParameter("serviceArea", serviceArea);
            List<Vendor> results = (List<Vendor>) query.list();
            log.debug("Find Ernest Recipient successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("Find Ernest Recipient failed", re);
            throw re;
        }
    }

    @Override
    public List<Vendor> findDuplicateVendorByVendorCode(String vendorCode, Integer vendorId) {
        log.debug("Finding duplicate vendor by vendor Code");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Vendor v where v.vendorCode= :vendorCode and v.vendorId != :vendorId");
            query.setParameter("vendorCode", vendorCode);
            query.setParameter("vendorId", vendorId);
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
