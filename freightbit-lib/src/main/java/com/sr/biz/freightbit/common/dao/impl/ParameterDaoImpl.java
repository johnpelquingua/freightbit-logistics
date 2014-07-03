package com.sr.biz.freightbit.common.dao.impl;

import com.sr.biz.freightbit.common.dao.ParameterDao;
import com.sr.biz.freightbit.common.entity.Parameters;
import org.apache.log4j.Logger;
import org.hibernate.ObjectNotFoundException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Transactional
public class ParameterDaoImpl extends HibernateDaoSupport implements ParameterDao {

    private static final Logger log = Logger.getLogger(ParameterDaoImpl.class);

    @Override
    public List<Parameters> findParameterMapByRefColumn(String referenceColumn) {
        log.debug("Finding parameter for [" + referenceColumn + "]");
        try {
            Session session = getSessionFactory().getCurrentSession();
            Query query = session.createQuery(" from Parameters p where referenceColumn = :referenceColumn");
            query.setParameter("referenceColumn", referenceColumn);
            return (List<Parameters>) query.list();
        } catch (ObjectNotFoundException onfe) {
            log.error("Finding parameter for [" + referenceColumn + "] failed.", onfe);
            throw onfe;
        }
    }

    @Override
    public List<Parameters> findParameterMapByRefColumn(String referenceTable, String referenceColumn) {
        log.debug("Finding parameter for [" + referenceColumn + "]");
        try {
            Session session = getSessionFactory().getCurrentSession();
            Query query = session.createQuery(" from Parameters p where referenceColumn = :referenceColumn and referenceTable = :referenceTable");
            query.setParameter("referenceColumn", referenceColumn);
            query.setParameter("referenceTable", referenceTable);
            return (List<Parameters>) query.list();
        } catch (ObjectNotFoundException onfe) {
            log.error("Finding parameter for [" + referenceColumn + "] failed.", onfe);
            throw onfe;
        }
    }

    @Override
    public List<Parameters> findParametersByProperty(Map<String, Object> params) {
        try {
            Session session = getSessionFactory().getCurrentSession();
            Query query = session.createQuery(" from Parameters p ");
            query.setProperties(params);
            return (List<Parameters>) query.list();
        } catch (ObjectNotFoundException onfe) {
            log.error("Finding parameter failed.", onfe);
            throw onfe;
        }
    }

}
