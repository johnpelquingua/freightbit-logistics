package com.sr.biz.freightbit.common.dao.impl;

import com.sr.biz.freightbit.common.entity.Notification;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;
import org.apache.log4j.Logger;

import java.math.BigInteger;

/**
 * Created by user on 9/29/2014.
 *
 */
@Transactional
public class NotificationDaoImpl extends HibernateDaoSupport implements NotificationDao {

    private static final Logger Log = Logger.getLogger(NotificationDaoImpl.class);
    @Override
    public void addNotification(Notification notification) {
        Log.debug("Add notification");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.save(notification);
            Log.debug("Notification added successfully");
        }catch(RuntimeException re){
            Log.error("add Notification Failed", re);
            throw re;
        }

    }

    @Override
    public void addNotificationCustomer(Notification notification){
        Log.debug("Add notificationCustomer");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.save(notification);
            Log.debug("NotificationCustomer added successfully");
        }catch(RuntimeException re){
            Log.error("add NotificationCustomer Failed", re);
            throw re;
        }

    }

    @Override
    public void addNotificationUser(Notification notification){
        Log.debug("Add notificationUser");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.save(notification);
            Log.debug("NotificationUser added successfully");
        }catch(RuntimeException re){
            Log.error("add NotificationUser Failed", re);
            throw re;
        }

    }

    @Override
    public void addNotificationVendor(Notification notification){
        Log.debug("Add notificationVendor");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.save(notification);
            Log.debug("NotificationVendor added successfully");
        }catch(RuntimeException re){
            Log.error("add NotificationVendor Failed", re);
            throw re;
        }

    }

    @Override
    public BigInteger CountAll(){
        String sql = "SELECT count(description) from freightbit.notification where description = 'BOOKING' ";
        Query query = getSessionFactory().getCurrentSession().createSQLQuery(sql);
        BigInteger temp = (BigInteger)query.uniqueResult();
        System.out.println("Dadaodadoadoaod "+temp);
        return temp;

    }

    @Override
    public BigInteger CountAllCustomer(){
        String sql = "SELECT count(description) from freightbit.notification where description = 'CUSTOMER' ";
        Query query = getSessionFactory().getCurrentSession().createSQLQuery(sql);
        BigInteger AllCust = (BigInteger)query.uniqueResult();
        System.out.println("Dadaodadoadoaod "+AllCust);
        return AllCust;

    }

    @Override
    public BigInteger CountAllUser(){
        String sql = "SELECT count(description) from freightbit.notification where description = 'USER' ";
        Query query = getSessionFactory().getCurrentSession().createSQLQuery(sql);
        BigInteger AllUser = (BigInteger)query.uniqueResult();
        System.out.println("Dadaodadoadoaod "+AllUser);
        return AllUser;

    }

    @Override
    public BigInteger CountAllVendor(){
        String sql = "SELECT count(description) from freightbit.notification where description = 'VENDOR' ";
        Query query = getSessionFactory().getCurrentSession().createSQLQuery(sql);
        BigInteger AllVendor = (BigInteger)query.uniqueResult();
        System.out.println("Dadaodadoadoaod "+AllVendor);
        return AllVendor;

    }


    @Override
    public Integer clearNewBooking(){
        String sql = "DELETE from freightbit.notification where description = 'BOOKING' ";
        Query query = getSessionFactory().getCurrentSession().createSQLQuery(sql);
       query.executeUpdate();
        return 0;
    }

    @Override
    public Integer clearNewCustomer(){
        String sql = "DELETE from freightbit.notification where description = 'CUSTOMER' ";
        Query query = getSessionFactory().getCurrentSession().createSQLQuery(sql);
        query.executeUpdate();
        return 0;
    }

    @Override
    public Integer clearNewUser(){
        String sql = "DELETE from freightbit.notification where description = 'USER' ";
        Query query = getSessionFactory().getCurrentSession().createSQLQuery(sql);
        query.executeUpdate();
        return 0;

    }

    @Override
    public Integer clearNewVendor(){
        String sql = "DELETE from freightbit.notification where description = 'VENDOR' ";
        Query query = getSessionFactory().getCurrentSession().createSQLQuery(sql);
        query.executeUpdate();
        return 0;
    }
}
