package com.sr.biz.freightbit.common.dao.impl;

import com.sr.biz.freightbit.common.dao.ParameterDao;
import com.sr.biz.freightbit.common.entity.Parameters;
import com.sr.biz.freightbit.core.entity.User;

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
    public Parameters findParameterById(Integer parameterId) {
        log.debug("finding Parameter by Id");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Parameters p where p.parameterId = :parameterId");
            query.setParameter("parameterId", parameterId);
            List<Parameters> results = (List<Parameters>) query.list();
            if (results != null && results.size() > 0) {
            	return results.get(0);
            } 
            return null;
        } catch (RuntimeException re) {
            log.error("find by username failed", re);
            throw re;
        }
    }

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
    
    @Override
    public void addParameter(Parameters param) {
        log.debug("adding a new Parameter");
        try {
            Session session = getSessionFactory().getCurrentSession();
            Integer paramId = (Integer) session.save(param);
            log.debug("Add parameter successful");
        } catch (RuntimeException re) {
            log.error("Add parameter failed", re);
            throw re;
        }
    }
    
    @Override
    public void deleteParameter(Parameters param) {
        log.debug("Removing parameter");
        try {
/*            Session session = getSessionFactory().getCurrentSession();
            session.delete(param);*/
    		Session session = getSessionFactory().getCurrentSession();
    		Query query = session.createQuery("Delete from Parameters where parameterId = :parameterId");
    		query.setParameter("parameterId", param.getParameterId());
    		int result = query.executeUpdate();
            log.debug("Delete parameter successful");
        } catch (RuntimeException re) {
            log.error("Delete parameter failed", re);
            throw re;
        }

    }
    
    @Override
    public void deleteParameters(String referenceTable, String referenceColumn) {
    	try {
    		Session session = getSessionFactory().getCurrentSession();
    		Query query = session.createQuery("Delete from Parameters where referenceTable = :referenceTable and referenceColumn = :referenceColumn");
    		query.setParameter("referenceTable", referenceTable);
    		query.setParameter("referenceColumn", referenceColumn);
    	} catch (RuntimeException e) {
    		log.error("Deleting parameters failed");
    	}
    }
    
    @Override
    public void addParameters(List <Parameters> paramList) {
    	try {
    		Session session = getSessionFactory().getCurrentSession();
    		for (Parameters param:paramList) {
    			session.save(param);
    		}
    		log.debug("Add parameters successful");
    	} catch (RuntimeException e) {
    		log.error("Adding parameters failed");
    	}
    }
    
    @Override
    public void updateParameter(Parameters param) {
        log.debug("updating a Parameter");
        try {
    		Session session = getSessionFactory().getCurrentSession();
    		Query query = session.createQuery("Update Parameters set value = :value, label = :label where parameterId = :parameterId");
    		query.setParameter("value", param.getValue());
    		query.setParameter("label", param.getValue());
    		query.setParameter("parameterId", param.getParameterId());
    		int result = query.executeUpdate();
            log.debug("update successful");
        } catch (RuntimeException re) {
            log.error("update failed", re);
            throw re;
        }
    }

}
