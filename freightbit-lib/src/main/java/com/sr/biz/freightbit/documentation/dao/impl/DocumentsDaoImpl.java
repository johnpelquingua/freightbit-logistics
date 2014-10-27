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

import com.sr.biz.freightbit.documentation.entity.Documents;

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

        /*statusList.add("PENDING");
        statusList.add("DISAPPROVED");*/
        statusList.add("ON GOING");
        /*statusList.add("PLANNING 1");
        statusList.add("PLANNING 2");
        statusList.add("PLANNING 3");
        statusList.add("SERVICE ACCOMPLISHED");*/

        log.debug("Finding orders with filter");
        try {
            log.debug("Finding orders succeeded");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.orderStatus in(:statusList) order by createdTimestamp desc");
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

    @Override
    public List <Documents> findDuplicateDocumentByDocumentName(String documentName, Integer documentId){
        log.debug("Finding duplicate document by document Name");
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Documents d where d.documentName= :documentName and d.documentId != :documentId");
            query.setParameter("documentName", documentName);
            query.setParameter("documentId", documentId);
            List<Documents> results = (List<Documents>) query.list();
            log.debug("Find Document by Document Name successful, result size " + results.size());
            return results;
        }catch(RuntimeException re) {
            log.error("Find Document by Document Name failed", re);
            throw re;
        }

    }

    @Override
    public void updateDocument(Documents documents) {
        log.debug("Update Documents");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(documents);
            log.debug("update Document successful");

        }catch(RuntimeException re){
            log.error("update failed", re);
            throw re;
        }

    }

    @Override
    public List<Documents> findDocumentByOutboundStageAndID(Integer outboundStage, Integer referenceId) {

        log.debug("Finding Documents with filter");
        try{
            log.debug("Finding documents succeeded");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Documents d where d.outboundStage = :outboundStage and d.referenceId = :referenceId");
            query.setParameter("outboundStage", outboundStage);
            query.setParameter("referenceId", referenceId);
            List<Documents> results = (List<Documents>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Finding documents failed");
            throw e;
        }
    }

    @Override
    public List<Documents> findDocumentByInboundStageAndID(Integer inboundStage, Integer referenceId) {

        log.debug("Finding Documents with filter");
        try{
            log.debug("Finding documents succeeded");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Documents d where d.inboundStage = :inboundStage and d.referenceId = :referenceId");
            query.setParameter("inboundStage", inboundStage);
            query.setParameter("referenceId", referenceId);
            List<Documents> results = (List<Documents>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Finding documents failed");
            throw e;
        }
    }

    @Override
    public List<Documents> findDocumentByFinalOutboundStageAndID(Integer finalOutboundStage, Integer referenceId) {

        log.debug("Finding Documents with filter");
        try{
            log.debug("Finding documents succeeded");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Documents d where d.finalOutboundStage = :finalOutboundStage and d.referenceId = :referenceId");
            query.setParameter("finalOutboundStage", finalOutboundStage);
            query.setParameter("referenceId", referenceId);
            List<Documents> results = (List<Documents>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Finding documents failed");
            throw e;
        }
    }

    @Override
    public List<Documents> findDocumentByFinalInboundStageAndID(Integer finalInboundStage, Integer referenceId) {

        log.debug("Finding Documents with filter");
        try{
            log.debug("Finding documents succeeded");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Documents d where d.finalInboundStage = :finalInboundStage and d.referenceId = :referenceId");
            query.setParameter("finalInboundStage", finalInboundStage);
            query.setParameter("referenceId", referenceId);
            List<Documents> results = (List<Documents>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Finding documents failed");
            throw e;
        }
    }

    @Override
    public List<Documents> findDocumentByArchiveStageAndID(Integer archiveStage, Integer referenceId) {

        log.debug("Finding Documents with filter");
        try{
            log.debug("Finding documents succeeded");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Documents d where d.archiveStage = :archiveStage and d.referenceId = :referenceId");
            query.setParameter("archiveStage", archiveStage);
            query.setParameter("referenceId", referenceId);
            List<Documents> results = (List<Documents>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Finding documents failed");
            throw e;
        }
    }

    @Override
    public List<Documents> findDocumentByBillingStageAndID(Integer billingStage, Integer referenceId) {

        log.debug("Finding Documents with filter");
        try{
            log.debug("Finding documents succeeded");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Documents d where d.billingStage = :billingStage and d.referenceId = :referenceId");
            query.setParameter("billingStage", billingStage);
            query.setParameter("referenceId", referenceId);
            List<Documents> results = (List<Documents>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Finding documents failed");
            throw e;
        }
    }

    @Override
    public Documents findDocumentByNameAndVendorCode(String documentName, String vendorCode) {

        log.debug("Finding Document . .. . ");
        try {
            log.debug("Finding Documents succeeded");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Documents d where d.documentName = :documentName and d.vendorCode = :vendorCode");
            query.setParameter("documentName", documentName);
            query.setParameter("vendorCode", vendorCode);
            Documents results = (Documents) query.list();
            return results;
        } catch (Exception e) {
            log.error("Finding documents failed");
            throw e;
        }
    }

    @Override
    public Documents findDocumentNameAndId(String documentName, Integer orderItemId) {

        log.debug("Finding Document ....");
        try {
            log.debug("Finding Document");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Documents d where d.documentName = :documentName and d.orderItemId = :orderItemId");
            query.setParameter("documentName", documentName);
            query.setParameter("documentId", orderItemId);
            Documents results = (Documents) query.list();
            return results;
        } catch (Exception e) {
            log.error("Finding documents failed");
            throw e;
        }
    }


    @Override
    public void deleteDocument(Documents documents){
        log.debug("Delete document");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.delete(documents);
            log.debug("Document has been deleted successfully");
        } catch (Exception e) {
            log.error("delete document failed", e);
            throw e;
        }
    }

}
