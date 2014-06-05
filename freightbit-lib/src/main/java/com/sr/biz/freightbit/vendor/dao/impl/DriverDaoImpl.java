package com.sr.biz.freightbit.vendor.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sr.biz.freightbit.vendor.dao.DriverDao;
import com.sr.biz.freightbit.vendor.entity.Driver;

import org.springframework.transaction.annotation.Transactional;

/**
 * Created by JMXPSX on 5/16/14.
 */

@Transactional
public class DriverDaoImpl extends HibernateDaoSupport implements DriverDao{

    private static final Logger Log = Logger.getLogger(DriverDaoImpl.class);


    @Override
    public void addDriver(Driver driver) {
        Log.debug("adding a new Driver");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.save(driver);
            Log.debug("Driver added successfully");
        } catch (RuntimeException re){
            Log.error("add failed", re);
            throw re;
        }
    }


    @Override
    public void deleteDriver(Driver driver){
        Log.debug("Deleting a Driver");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.delete(driver);
            Log.debug("delete successful");
        } catch (RuntimeException re){
            Log.error("delete failed", re);
            throw re;
        }
    }


    @Override
    public void updateDriver(Driver driver) {
        Log.debug("updating a new driver");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(driver);
            Log.debug("update successful");
        }catch (RuntimeException re) {
            Log.error("update failed", re);
            throw re;
        }
    }


    @Override
    public List<Driver> findAllDrivers() {
        Log.debug("finding all drivers");
        try{
            return getSessionFactory().getCurrentSession().createQuery("from Driver").list();

        }catch (RuntimeException re){
            Log.error("find all failed", re);
            throw re;
        }
    }


    @Override
    public List<Driver> findAllDriversByClientId (Integer clientId){
        Log.debug("finding Driver instance by client");
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery("from Driver d where d.clientId = :clientId");
            query.setParameter("clientId", clientId);
            List<Driver> results = (List<Driver>) query.list();
            Log.debug("find by client id successful, result size:" + results.size());
            return results;
        }catch(RuntimeException re){
            Log.error("find by client id failed",re);
            throw re;
        }
    }


    @Override
    public Driver findDriverById(Integer driverId) {
        Log.debug("getting Driver instance with id:"  + driverId);
        try{
            Driver instance = (Driver) getSessionFactory().getCurrentSession().get(Driver.class, driverId);
            if (instance == null) {
                Log.debug("get successful, no instance found");
            }else {
                Log.debug("get successful, instance found");
            }
            return instance;
        }catch (RuntimeException re){
            Log.error("get failed", re);
            throw re;
        }
    }


    @Override
    public List<Driver> findDriverByLastName (String lastName){
        Log.debug("finding Driver instance by Last Name");
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery("from Driver d where d.lastName = :lastName");
            query.setParameter("lastName", lastName);
            List<Driver> results = (List<Driver>) query.list();
            Log.debug("find by lastname successful, result size: " + results.size());
            return results;
        }catch(RuntimeException re) {
            Log.error("find by lastname failed", re);
            throw re;

        }
    }

    @Override
    public List<Driver> findDriverByVendorId(Integer vendorId) {
        Log.debug("Getting Driver instance by vendor id: " + vendorId);
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Driver d where d.vendorId = :vendorId ");
            query.setParameter("vendorId", vendorId);
            List<Driver> results = (List<Driver>) query.list();
            Log.debug("Find by vendorId successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            Log.error("Get failed", re);
            throw re;
        }
    }

    @Override
    public List<Driver> findDriverByDriverCode(String driverCode) {
        Log.debug("Finding Driver instance");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Driver d where d.driverCode = :driverCode ");
            query.setParameter("driverCode", driverCode);
            List<Driver> results = (List<Driver>) query.list();
            Log.debug("Find by driverCode successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            Log.error("Find by driverCode failed", re);
            throw re;
        }
    }

}
