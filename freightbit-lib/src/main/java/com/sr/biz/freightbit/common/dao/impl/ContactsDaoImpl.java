package com.sr.biz.freightbit.common.dao.impl;


import com.sr.biz.freightbit.common.dao.ContactsDao;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.core.dao.impl.UserDaoImpl;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

/**
 * Created by Clarence C. Victoria on 5/26/14.
 */

@Transactional
public class ContactsDaoImpl extends HibernateDaoSupport implements ContactsDao{
//
    private static final Logger log = Logger.getLogger(UserDaoImpl.class);

    @Override
    public void addContact(Contacts contacts) {
        log.debug("adding a new contact");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.save(contacts);
            log.debug("add successful");
        } catch (RuntimeException re){
            log.error("add failed", re);
            throw re;
        }
    }

    @Override
    public void deleteContact(Contacts contacts) {
        log.debug("deleting a Contact");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.delete(contacts);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }

    @Override
   public void updateContact(Contacts contacts) {
        log.debug("updating a contact");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(contacts);
            log.debug("update successful");
        } catch (RuntimeException re) {
            log.error("update failed", re);
            throw re;
        }
    }

    @Override
    public List<Contacts> findAllContacts(long clientId) {
        log.debug("finding all contacts");
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery("from Contacts where clientId = :clientId");
            query.setParameter("clientId", clientId);
            return query.list();
        } catch (RuntimeException re){
            log.error("find all failed", re);
            throw re;
        }
    }

    @Override
    public Contacts findContactById(long id) {
        log.debug("getting contact instance by id: " + id);
        try {
            Contacts instance = (Contacts) getSessionFactory().getCurrentSession().get(Contacts.class, id);
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

//    @Override
//    public List<Contacts> findAllContactsByClientId(long clientId) {
//        log.debug("finding contact instance by client");
//        try {
//            Query query = getSessionFactory().getCurrentSession().createQuery("from Contacts where clientId = :clientId");
//            query.setParameter("clientId", clientId);
//            List<Contacts> results = (List<Contacts>) query.list();
//            log.debug("find by client id successful, result size: " + results.size());
//            return results;
//        } catch (RuntimeException re) {
//            log.error("find by client id failed", re);
//            throw re;
//        }
//    }

    @Override
    public Contacts findContactByReferenceTableAndId(String referenceTable, String referenceId){
        Query query = getSessionFactory().getCurrentSession().createQuery(" from Contacts where referenceTable = :referenceTable and referenceId = :referenceId");
        query.setParameter("referenceTable", referenceTable);
        query.setParameter("referenceId", referenceId);
        List <Contacts> contactsList = query.list();
        if (contactsList != null && contactsList.size() > 0)
            return contactsList.get(0);
        else
            return null;
    }
}
