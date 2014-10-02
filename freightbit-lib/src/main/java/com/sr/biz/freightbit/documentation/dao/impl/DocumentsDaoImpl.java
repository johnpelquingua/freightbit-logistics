package com.sr.biz.freightbit.documentation.dao.impl;

import com.sr.biz.freightbit.documentation.dao.DocumentsDao;
import com.sr.biz.freightbit.documentation.entity.Documents;
import com.sr.biz.freightbit.order.entity.Orders;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Clarence C. Victoria on 8/8/14.
 */
@Transactional
public class DocumentsDaoImpl extends HibernateDaoSupport implements DocumentsDao {
    private static final Logger log = Logger.getLogger(DocumentsDaoImpl.class);

    @Override
    public List<Documents> findDocumentationByCriteria(String column, String value) {
        log.debug("Find documentation by criteria started");
        Session session = getSessionFactory().getCurrentSession();
        List<Documents> documents = session.createCriteria(Documents.class)
                .add(Restrictions.like(column, value))
                .list();
        return documents;
    }

    @Override
    public List<Orders> findAllOrdersDocuments() {

        List<String> statusList = new ArrayList<>();

        statusList.add("PENDING");
        statusList.add("DISAPPROVED");
        /*statusList.add("APPROVED");
        statusList.add("PLANNING 1");
        statusList.add("PLANNING 2");
        statusList.add("PLANNING 3");
        statusList.add("SERVICE ACCOMPLISHED");*/

        log.debug("Finding orders with filter");
        try {
            log.debug("Finding orders succeeded");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.orderStatus not in(:statusList) order by createdTimestamp desc");
            query.setParameterList("statusList", statusList);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Finding orders failed");
            throw e;
        }

    }

    @Override
    public void addDocuments(Documents documents) {
        log.debug("Add Documents");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.save(documents);
            log.debug("Booking added successfully");
        }catch(RuntimeException re){
            log.error("add booking failed", re);
            throw re;
        }
    }

    @Override
    public List<Documents> findOrderDocumentations() {

        log.debug("Finding all documents in order");
        try{
            log.debug("Finding order documents succeeded");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Documents order by createdDate desc");
            List<Documents> results = (List<Documents>) query.list();
            return results;
        }catch(Exception e){
            log.error("Finding documents failed");
            throw e;
        }
    }

    @Override
    public List<Documents> findDocumentsByOrderId(Integer orderId) {
        log.debug("getting Documents instance by order id:"  + orderId);
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery("from Documents d where d.referenceId = :orderId");
            query.setParameter("orderId", orderId);
            List<Documents> results = (List<Documents>) query.list();
            log.debug("find by order id successful, result size:" + results.size());
            return results;
        }catch (RuntimeException re){
            log.error("get failed", re);
            throw re;
        }
    }

    @Override
    public Documents findDocumentById(Integer documentId) {
        log.debug("getting Documents instance by document id:"  + documentId);
        try{
            Documents instance = (Documents) getSessionFactory().getCurrentSession().get(Documents.class, documentId);
            if(instance == null) {
                log.debug("get successful, no instance found");
            }else {
                log.debug("get successful, instance found");
            }
            return instance;
        }catch (RuntimeException re){
            log.error("get failed", re);
            throw re;
        }
    }


}
