package com.sr.biz.freightbit.common.dao.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.ObjectNotFoundException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.common.dao.ParameterDao;
import com.sr.biz.freightbit.common.entity.Parameters;


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
    		Query query = session.createQuery("Update Parameters set key = :key, value = :value, label = :label where parameterId = :parameterId");
    		query.setParameter("key", param.getValue().toUpperCase());
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
    
    @Override
    public List<Parameters> findShipmentActivityParameters(String freightType, String serviceMode, String serviceReq, Integer currentParameterId) {
        log.debug("Finding parameter for shipment activities");
        try {
            Session session = getSessionFactory().getCurrentSession();
            List<Parameters> parameterList = null;
            if ("SHIPPING".equals(freightType)) {
            	Query query = session.createQuery(" from Parameters p where p.referenceTable = 'SHIPMENTLOGS' "
                		+ "and p.referenceColumn = 'ACTIVITY' "
                		+ "and p.parameterId > :currentParameterId "
                		+ "and p.key like 'SC%' or p.key like 'MISC%' or p.key like 'DEC%' or p.key like 'CON%'");
            	query.setParameter("currentParameterId", currentParameterId);
            	parameterList = (List<Parameters>) query.list();
            }   else if ("TRUCKING".equals(freightType)) {
            	Query query = session.createQuery(" from Parameters p where p.referenceTable = 'SHIPMENTLOGS' "
                		+ "and p.referenceColumn = 'ACTIVITY' "
                		+ "and p.parameterId > :currentParameterId "
                		+ "and p.key not like 'SC%'");
            	query.setParameter("currentParameterId", currentParameterId);
            	parameterList = (List<Parameters>) query.list();
            } else { // if Shipping and Trucking, return all parameters
                Query query = session.createQuery(" from Parameters p where p.referenceTable = 'SHIPMENTLOGS' "
                		+ "and p.referenceColumn = 'ACTIVITY' "
                		+ "and p.parameterId > :currentParameterId;");
                query.setParameter("currentParameterId", currentParameterId);
                parameterList = (List<Parameters>) query.list();
            }
            
            //Status to remove for Pier to Door, Pier to Pier, Door to Pier; If Door to Door, nothing to remove
            if ("PIER TO DOOR".equals(serviceMode) || "PIER TO PIER".equals(serviceMode)) { //remove params with IFO
                for (Iterator<Parameters> iter = parameterList.listIterator(); iter.hasNext(); ) {
                	Parameters param = iter.next();
                	if (param.getKey().startsWith("IFO")) {
                		iter.remove();
                	}
                }
            } else if ("DOOR TO PIER".equals(serviceMode))  { //remove params with IFD
                for (Iterator<Parameters> iter = parameterList.listIterator(); iter.hasNext(); ) {
                	Parameters param = iter.next();
                	if (param.getKey().startsWith("IFD")) {
                		iter.remove();
                	}
                }
            }

            //Status to remove for FCL and LCL
            if ("FULL CONTAINER LOAD".equals(serviceReq)) { //remove params with DC_ and CON_ prefix
                for (Iterator<Parameters> iter = parameterList.listIterator(); iter.hasNext(); ) {
                	Parameters param = iter.next();
                	if (param.getKey().startsWith("DEC") || param.getKey().startsWith("CON")) {
                		iter.remove();
                	}
                	if ("TRUCKING".equals(freightType)) {
                		if (param.getKey().equals("IFO_TRUCK FOR WITHDRAWAL OF EMPTY VAN") 
            			|| param.getKey().equals("IFO_TRUCK AT PORT FOR TURNOVER OF LADEN") 
            			|| param.getKey().equals("IFD_TRUCK AT PORT FOR WITHDRAWAL OF LADEN VAN") 
            			|| param.getKey().equals("IFD_TRUCK IN TRANSIT FOR WITHDRAWAL OF LADEN VAN")) {
                			iter.remove();
                		}
                	}
                }
            } else {
                for (Iterator<Parameters> iter = parameterList.listIterator(); iter.hasNext(); ) {
                	Parameters param = iter.next();
            		if (param.getKey().equals("IFO_TRUCK FOR WITHDRAWAL OF EMPTY VAN") 
        			|| param.getKey().equals("IFO_TRUCK AT PORT FOR TURNOVER OF LADEN") 
        			|| param.getKey().equals("IFD_TRUCK AT PORT FOR WITHDRAWAL OF LADEN VAN") 
        			|| param.getKey().equals("IFD_TRUCK IN TRANSIT FOR WITHDRAWAL OF LADEN VAN")) {
            			iter.remove();
            		}
                }
            }
            
            return parameterList;
            
        } catch (ObjectNotFoundException onfe) {
            log.error("Finding parameter for shipment activities");
            throw onfe;
        }
    }
    
    @Override
    public List<Parameters> findParametersByCriteria(String column, String value) {
        log.debug("Find params by criteria ");
        Session session = getSessionFactory().getCurrentSession();
        List<Parameters> parameters = session.createCriteria(Parameters.class)
                .add(Restrictions.like(column, value))
                .list();
        return parameters;
    }
    

}
