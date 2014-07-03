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
import java.util.Map;
import java.util.Set;

/**
 * Created by Clarence C. Victoria on 5/26/14.
 */

@Transactional
public class ContactsDaoImpl extends HibernateDaoSupport implements ContactsDao {
    //
    private static final Logger log = Logger.getLogger(UserDaoImpl.class);

    @Override
    public Integer addContact(Contacts contacts) {
        log.debug("adding a new contact");
        try {
            Session session = getSessionFactory().getCurrentSession();
            Integer contactId = (Integer) session.save(contacts);
            log.debug("add successful");
            return contactId;
        } catch (RuntimeException re) {
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
    public List<Contacts> findDuplicateContactByLastName(String lastName, Integer contactId) {
        log.debug("Finding duplicate contact by contact lastName");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Contacts c where c.lastName= :lastName and c.contactId != :contactId");
            query.setParameter("contactId", contactId);
            query.setParameter("lastName", lastName);
            List<Contacts> results = (List<Contacts>) query.list();
            log.debug("Find Contact by lastName successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("Find contact by lastName failed", re);
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
    public List<Contacts> findAllContacts() {
        log.debug("finding all contacts");
        try {
            //Query query = getSessionFactory().getCurrentSession().createQuery("from Contacts");

            return getSessionFactory().getCurrentSession().createQuery("from Contacts").list();
        } catch (RuntimeException re) {
            log.error("find all failed", re);
            throw re;
        }
    }

    @Override
    public Contacts findContactById(Integer contactId) {
        log.debug("getting contact instance by id: " + contactId);
        try {
            Contacts instance = (Contacts) getSessionFactory().getCurrentSession().get(Contacts.class, contactId);
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
    public Contacts findContactByReferenceTableAndId(String referenceTable, Integer referenceId) {
        Query query = getSessionFactory().getCurrentSession().createQuery(" from Contacts where referenceTable = :referenceTable and referenceId = :referenceId");
        query.setParameter("referenceTable", referenceTable);
        query.setParameter("referenceId", referenceId);
        List<Contacts> contactsList = query.list();
        if (contactsList != null && contactsList.size() > 0)
            return contactsList.get(0);
        else
            return null;
    }

    @Override
    public List<Contacts> findContactByRefTableAndIdAndType(String referenceTable, Integer referenceId, String contactType) {
        Query query = getSessionFactory().getCurrentSession().createQuery(" from Contacts where referenceTable = :referenceTable and referenceId = :referenceId and contactType = :contactType");
        query.setParameter("referenceTable", referenceTable);
        query.setParameter("referenceId", referenceId);
        query.setParameter("contactType", contactType);
        return query.list();
    }

    @Override
    public List<Contacts> findContactByReferenceId(Integer referenceId) {
        log.debug("Getting Contact instance by vendor id: " + referenceId);

        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Contacts c where c.referenceId = :referenceId ");
            query.setParameter("referenceId", referenceId);
            List<Contacts> results = (List<Contacts>) query.list();
            log.debug("Find by vendorId successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("Get failed", re);
            throw re;
        }
    }

    @Override
    public List<Contacts> findContactByLastName(String lastName) {
        log.debug("finding Contact instance by Last Name");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Contact c where c.lastName = :lastName");
            query.setParameter("lastName", lastName);
            List<Contacts> results = (List<Contacts>) query.list();
            log.debug("find by lastname successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by lastname failed", re);
            throw re;

        }
    }

    @Override
    public List<Contacts> findContactsByParameterMap(Map<String, Object> paramMap, String entity) {
        Query query = getSessionFactory().getCurrentSession().createQuery(buildSearchCriteria(paramMap, entity));
        return query.list();
    }

    private String buildSearchCriteria(Map<String, Object> paramMap, String entity) {
        StringBuilder queryString = new StringBuilder("from " + entity + " where ");
        Set<String> mapKeys = paramMap.keySet();
        int i = 0;
        for (String mapKey : mapKeys) {
            if (i > 0)
                queryString.append(" and ");
            queryString.append(mapKey + " = '" + paramMap.get(mapKey) + "'");
            i++;
        }
        return queryString.toString();
    }

}
