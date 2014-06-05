package com.sr.biz.freightbit.customer.dao.impl;

/**
 * Created by ADMIN on 5/13/14.
 */

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.customer.dao.CustomerDao;
import com.sr.biz.freightbit.customer.entity.Customer;

import java.util.List;


@Transactional
public class CustomerDaoImpl extends HibernateDaoSupport implements CustomerDao{

    private static final Log log = LogFactory.getLog(CustomerDao.class);

    @Override
    public  void addCustomer(Customer customer){
        log.debug("adding a new customer");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.save(customer);
        }catch(RuntimeException re){
            log.error("add failed", re);
            throw re;
        }
    }

    @Override
    public void deleteCustomer(Customer customer){
        log.debug("deleting a customer...");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.delete(customer);
            log.debug("delete successful");
        }catch(RuntimeException re){
            log.error("delete failed", re);
            throw re;
        }

    }

    @Override
    public void updateCustomer(Customer customer){
        log.debug("updated customer");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(customer);
            log.debug("customer updated");
        }catch(RuntimeException re){
            log.error("updating failed", re);
            throw re;
        }

    }

    @Override
    public List<Customer> findAllCustomer(Integer clientId){
        log.debug("finding all Customer");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Customer where clientId = :clientId");
            query.setParameter("clientId", clientId);
            return query.list();
        } catch (RuntimeException re) {
            log.error("find all failed", re);
            throw re;
        }

    }

    @Override
    public Customer findCustomerById(Integer id){
       log.debug("finding customer by id");
        try{
            Customer instance = (Customer) getSessionFactory().getCurrentSession().get(Customer.class, id);
            if(instance == null){
               log.debug("no id exists");
            }else {log.debug("id found");}
            return instance;
        }catch(RuntimeException re){
            log.debug("finding failed", re);
            throw re;
        }
    }

    @Override
    public List<Customer> findCustomerByClientId(Integer clientId){
       log.debug("finding customer by client");
        try{
            Query query =  getSessionFactory().getCurrentSession().createQuery(
                    "from Customer c where c.clientId = :clientId");
            query.setParameter("clientId", clientId);
            List<Customer> results = (List<Customer>) query.list();
            log.debug("find by client id successful, result size: "
                    + results.size());
            return results;
        }catch(RuntimeException re){
          log.error("finding customer failed", re);
            throw re;
        }


    }

    @Override
    public List<Customer> findCustomerByName(String customer){
        log.debug("getting Customer instance by example");
        try{
            Query query= getSessionFactory().getCurrentSession().createQuery(
                    "from Customer c where c.customerName = :customerName" );
            query.setParameter("customerName", customer);
            List<Customer> results = (List<Customer>) query.list();
           log.debug("find by customer name successful, result size: " + results.size());
            return results;
        }catch(RuntimeException re){
            log.error("find by customer name failed", re);
            throw re;
        }

    }

    @Override
    public List<Customer> findCustomerByType(String customer){
        log.debug("getting customer by id");
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Customer c where c.customerType = :customerType");
            query.setParameter("customerType", customer);
            List<Customer> results = (List<Customer>) query.list();
            log.debug("find by customer id successfl, result size: " + results.size());
            return results;
        }catch(RuntimeException re){
            log.error("find by id failed", re);
            throw re;
        }
    }

    @Override
    public Customer findCustomerByEmail(String customer){
        log.debug("getting customer by email");
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Customer c where c.email = :email");
            query.setParameter("email", customer);
            List<Customer> result = (List<Customer>) query.list();
            return result.get(0);
        }catch(RuntimeException re){
            log.error("find by email failed", re);
            throw re;
        }
    }

}