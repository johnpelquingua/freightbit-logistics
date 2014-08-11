package com.sr.biz.freightbit.documentation.dao.impl;

import com.sr.biz.freightbit.documentation.dao.DocumentationDao;
import com.sr.biz.freightbit.documentation.entity.Documentation;
import com.sr.biz.freightbit.order.entity.Orders;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Clarence C. Victoria on 8/8/14.
 */
public class DocumentationDaoImpl extends HibernateDaoSupport implements DocumentationDao {
    private static final Logger log = Logger.getLogger(DocumentationDaoImpl.class);

    @Override
    public List<Documentation> findDocumentationByCriteria(String column, String value) {
        log.debug("Find documentation by criteria started");
        Session session = getSessionFactory().getCurrentSession();
        List<Documentation> documents = session.createCriteria(Documentation.class)
                .add(Restrictions.like(column, value))
                .list();
        return documents;
    }

    @Override
    public List<Orders> findAllOrdersDocumentation() {

        List<String> statusList = new ArrayList<>();
        statusList.add("APPROVED");
        statusList.add("PENDING");
        statusList.add("DISAPPROVED");
        statusList.add("BOOKING ON PROCESS");
        statusList.add("PLANNING 1");
        statusList.add("PLANNING 2");
        statusList.add("PLANNING 3");
        statusList.add("SERVICE ACCOMPLISHED");

        log.debug("Finding orders with filter");
        try {
            log.debug("Finding orders succeeded");
            Query query = getSessionFactory().getCurrentSession().createQuery("from Orders o where o.orderStatus not in(:statusList)");
            query.setParameterList("statusList", statusList);
            List<Orders> results = (List<Orders>) query.list();
            return results;
        } catch (Exception e) {
            log.error("Finding orders failed");
            throw e;
        }
    }
}
