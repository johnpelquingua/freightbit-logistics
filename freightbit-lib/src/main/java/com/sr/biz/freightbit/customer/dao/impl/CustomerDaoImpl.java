package com.sr.biz.freightbit.customer.dao.impl;

/**
 * Created by ADMIN on 5/13/14.
 */

import com.sr.biz.freightbit.customer.dao.CustomerDao;
import com.sr.biz.freightbit.customer.entity.Customer;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Transactional
public class CustomerDaoImpl extends HibernateDaoSupport implements CustomerDao {

    private static final Log log = LogFactory.getLog(CustomerDao.class);

    @Override
    public Integer addCustomer(Customer customer) {

        log.debug("adding a new customer");
        try {

            Session session = getSessionFactory().getCurrentSession();
            Integer customerId = (Integer) session.save(customer);
            return customerId;
        } catch (RuntimeException re) {
            log.error("add failed", re);
            throw re;
        }
    }

    @Override
    public void deleteCustomer(Customer customer) {
        log.debug("deleting a customer...");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.delete(customer);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }

    }

    @Override
    public void updateCustomer(Customer customer) {
        log.debug("updated customer");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(customer);
            log.debug("customer updated");
        } catch (RuntimeException re) {
            log.error("updating failed", re);
            throw re;
        }

    }

    @Override
    public List<Customer> findAllCustomer() {
        log.debug("finding all Customer");
        try {
            /*Query query = getSessionFactory().getCurrentSession().createQuery("from Customer where clientId = :clientId");
            query.setParameter("clientId", clientId);
            return query.list();*/
            return getSessionFactory().getCurrentSession().createQuery("from Customer").list();
        } catch (RuntimeException re) {
            log.error("find all failed", re);
            throw re;
        }

    }

    @Override
    public List<Customer> findCustomerByCustomerCode(String customerCode) {
        log.debug("Finding customer instance by code");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Customer v where v.customerCode= :customerCode");
            query.setParameter("customerCode", customerCode);
            List<Customer> results = (List<Customer>) query.list();
            log.debug("Find Customer by customerCode successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("Find Customer by customerCode failed", re);
            throw re;
        }
    }

    @Override
    public Customer findCustomerById(Integer id) {
        log.debug("finding customer by id");
        try {
            Customer instance = (Customer) getSessionFactory().getCurrentSession().get(Customer.class, id);
            if (instance == null) {
                log.debug("no id exists");
            } else {
                log.debug("id found");
            }
            return instance;
        } catch (RuntimeException re) {
            log.debug("finding failed", re);
            throw re;
        }
    }

    @Override
    public List<Customer> findCustomerByClientId(Integer clientId) {
        log.debug("finding customer by client");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Customer c where c.clientId = :clientId");
            query.setParameter("clientId", clientId);
            List<Customer> results = (List<Customer>) query.list();
            log.debug("find by client id successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("finding customer failed", re);
            throw re;
        }


    }

    @Override
    public List<Customer> findCustomerByName(String customer) {
        log.debug("getting Customer instance by example");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Customer c where c.customerName = :customerName");
            query.setParameter("customerName", customer);
            List<Customer> results = (List<Customer>) query.list();
            log.debug("find by customer name successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by customer name failed", re);
            throw re;
        }

    }

    @Override
    public List<Customer> findCustomerByType(String customer) {
        log.debug("getting customer by id");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Customer c where c.customerType = :customerType");
            query.setParameter("customerType", customer);
            List<Customer> results = (List<Customer>) query.list();
            log.debug("find by customer id successfl, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by id failed", re);
            throw re;
        }
    }

    @Override
    public Customer findCustomerByEmail(String customer) {
        log.debug("getting customer by email");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Customer c where c.email = :email");
            query.setParameter("email", customer);
            List<Customer> result = (List<Customer>) query.list();
            return result.get(0);
        } catch (RuntimeException re) {
            log.error("find by email failed", re);
            throw re;
        }
    }

    @Override
    public List<Customer> findCustomersByCriteria(String column, String value, Integer clientId) {
        log.debug("Find customers by criteria ");
        Session session = getSessionFactory().getCurrentSession();
        List<Customer> customers = session.createCriteria(Customer.class)
                .add(Restrictions.like(column, value))
                .add(Restrictions.eq("client.clientId", clientId))
                .list();
        return customers;
    }

    @Override
    public List<Customer> findDuplicateCustomerByCodeAndId(String customerCode, Integer customerId) {
        log.debug("Find duplicate customer.");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Customer d where d.customerCode = :customerCode and d.customerId != :customerId");
            query.setParameter("customerCode", customerCode);
            query.setParameter("customerId", customerId);
            List<Customer> results = (List<Customer>) query.list();
            log.debug("Find by driverCode successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("Find by driverCode failed", re);
            throw re;
        }
    }

}