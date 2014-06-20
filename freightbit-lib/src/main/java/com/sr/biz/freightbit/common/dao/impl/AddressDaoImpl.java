package com.sr.biz.freightbit.common.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sr.biz.freightbit.common.dao.AddressDao;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Solutions Resource on 5/28/14.
 */

@Transactional
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
            Query query = getSessionFactory().getCurrentSession().createQuery("from Address where addressId = :addressId");
            query.setParameter("addressId", addressId);
            return query.list();
        } catch (RuntimeException re) {
            log.error("find all failed", re);
            throw re;
        }
    }

    @Override
    public List<Address> findAllAddressByClientId(Integer clientId) {
        log.debug("Finding address instance by Client");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Address a where a.clientId = :clientId");
            query.setParameter("clientId", clientId);
            List<Address> results = (List<Address>) query.list();
            log.debug("find address by client id successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find address by client id failed", re);
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
    
    /**
     * @param addressType: SHIPPER, CONSIGNEE, BILLER TO
     */
    @Override
    public List <Address> findAddressByRefTableAndIdAndType(String referenceTable, Integer referenceId, String addressType){
        Query query = getSessionFactory().getCurrentSession().createQuery(" from Address where referenceTable = :referenceTable and referenceId = :referenceId and addressType = :addressType");
        query.setParameter("referenceTable", referenceTable);
        query.setParameter("referenceId", referenceId);
        query.setParameter("addressType", addressType);
        return query.list();
    }  


    @Override
    public List<Address> findAllAddressByRefId(Integer referenceId) {
        log.debug("finding customer by client");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Address a where a.referenceId = :referenceId");
            query.setParameter("referenceId", referenceId);
            List<Address> results = (List<Address>) query.list();
            log.debug("find by client id successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("finding customer failed", re);
            throw re;
        }
    }
}
