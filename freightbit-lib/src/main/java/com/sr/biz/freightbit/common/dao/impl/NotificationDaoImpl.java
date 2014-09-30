package com.sr.biz.freightbit.common.dao.impl;

import com.sr.biz.freightbit.common.entity.Notification;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;
import org.apache.log4j.Logger;

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
}
