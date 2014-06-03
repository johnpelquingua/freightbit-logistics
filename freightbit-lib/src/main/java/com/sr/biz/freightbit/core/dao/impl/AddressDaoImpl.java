package com.sr.biz.freightbit.core.dao.impl;

import java.util.List;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;
import com.sr.biz.freightbit.core.dao.AddressDao;
import com.sr.biz.freightbit.core.entity.Address;

/**
 * Created by Solutions Resource on 5/28/14.
 */
public class AddressDaoImpl extends HibernateDaoSupport implements AddressDao {

    private static final Logger log = Logger.getLogger(AddressDaoImpl.class);

    @Override
    public Address findContactByReferenceTableAndId(String referenceTable, Integer referenceId){
        Query query = getSessionFactory().getCurrentSession().createQuery(" from Address where referenceTable = :referenceTable and referenceId = :referenceId");
        query.setParameter("referenceTable", referenceTable);
        query.setParameter("referenceId", referenceId);
        List <Address> addressList = query.list();
        if (addressList != null && addressList.size() > 0)
            return addressList.get(0);
        else
            return null;
    }

    @Override
    public void addAddress(Address address) {
        log.debug("adding a new Address");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.save(address);
            log.debug("add successful");
        } catch (RuntimeException re) {
            log.error("add failed", re);
            throw re;
        }
    }

    @Override
    public void deleteAddress(Address address) {
        log.debug("deleting a Address");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.delete(address);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }

    @Override
    public List<Address> findAllAddress(Integer addressId) {
        log.debug("finding all Address");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from User where addressId = :addressId");
            query.setParameter("addressId", addressId);
            return query.list();
        } catch (RuntimeException re) {
            log.error("find all failed", re);
            throw re;
        }
    }

    @Override
    public List<Address> findAllAddressByClientId(Integer clientId) {
        log.debug("finding Address instance by client");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Address u where u.clientId = :clientId");
            query.setParameter("clientId", clientId);
            List<Address> results = (List<Address>) query.list();
            log.debug("find by client id successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by client id failed", re);
            throw re;
        }
    }

    @Override
    public Address findAddressById(Integer addressId) {
        log.debug("getting Address instance with id: " + addressId);
        try {
            Address instance = (Address) getSessionFactory().getCurrentSession().get(
                    Address.class, addressId);
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
    public void updateAddress(Address address) {
        log.debug("updating a new Address");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(address);
            log.debug("update successful");
        } catch (RuntimeException re) {
            log.error("update failed", re);
            throw re;
        }
    }

}
