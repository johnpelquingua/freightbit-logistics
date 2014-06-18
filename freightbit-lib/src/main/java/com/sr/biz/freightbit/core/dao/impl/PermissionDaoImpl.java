package com.sr.biz.freightbit.core.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.core.dao.PermissionDao;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.entity.Group;
import com.sr.biz.freightbit.core.entity.Permission;
import com.sr.biz.freightbit.core.entity.PermissionUserGroup;
import com.sr.biz.freightbit.core.entity.User;

/**
 *
 * @author junoroxas
 *
 */
@Transactional
public class PermissionDaoImpl extends HibernateDaoSupport implements PermissionDao {

    private static final Log log = LogFactory.getLog(PermissionDaoImpl.class);

    @Override
    public Permission createPermission(User user, Client client, long value) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Permission createPermission(Group group, Client client, long value) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void updatePermission(Permission permission) {
        // TODO Auto-generated method stub

    }

    @Override
    public void deletePermission(Permission permission) {
        // TODO Auto-generated method stub

    }

    @Override
    public void deletePermissions(Client client) {
        // TODO Auto-generated method stub

    }

    @Override
    public void deletePermissions(Group group) {
        // TODO Auto-generated method stub

    }

    @Override
    public void deletePermissions(User user) {
        // TODO Auto-generated method stub

    }

    @Override
    public Permission getPermissionById(Integer permissionId) {
        log.debug("Getting Permission instance with id: " + permissionId);
        try {
        	Permission instance = (Permission) getSessionFactory().getCurrentSession().get(
                    Permission.class, permissionId);
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
    public Permission getPermission(Client client, User user) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Permission getPermission(Client client, Group group) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Permission> getPermissions(Integer clientId) {
        log.debug("finding permissions by clientId");
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Permission p where p.clientId = :clientId");
            query.setParameter("clientId", clientId);
            List<Permission> results = (List<Permission>) query.list();
            log.debug("finding permissions by clientId successful, result size: " + results.size());
            return results;
        }catch(RuntimeException re){
            log.error("finding permissions failed", re);
            throw re;
        }
    }
    
    public List<PermissionUserGroup> getPermissionUserGroupsByClientIdAndPermissionId(Integer clientId, Integer permissionId){
        log.debug("finding permissionUserGroups by clientId and permissionId");
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from PermissionUserGroup p where p.permissionId = :permissionId and p.clientId = :clientId");
            query.setParameter("permissionId", permissionId);
            query.setParameter("clientId", clientId);
            List<PermissionUserGroup> results = (List<PermissionUserGroup>) query.list();
            log.debug("finding permissionUserGroups by clientId and permissionId successful, result size: " + results.size());
            return results;
        }catch(RuntimeException re){
            log.error("finding permissionUserGroups failed", re);
            throw re;
        }
    }
    
    public Permission findPermissionById(Integer permissionId) {
        log.debug("getting Permission instance with id: " + permissionId);
        try {
            Permission instance = (Permission) getSessionFactory().getCurrentSession().get(
                    Permission.class, permissionId);
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
    public void addPermissionUserGroup(PermissionUserGroup permissionUserGroup) {
        log.debug("Adding a new PermissionUserGroup");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.save(permissionUserGroup);
            log.debug("Add permissionUserGroup successful");
        } catch (RuntimeException re) {
            log.error("add failed", re);
            throw re;
        }
    }
    
    @Override
    public List<PermissionUserGroup> findPermissionUserGroup(Integer clientId, Integer groupId, Integer userId, Integer permissionId) {
        log.debug("Finding PermissionUserGroup by criteria");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from PermissionUserGroup where clientId = :clientId"
            		+ " and groupId = :groupId"
            		+ " and userId = :userId"
            		+ " and permissionId = :permissionId");
            query.setParameter("clientId", clientId);
            query.setParameter("groupId", groupId);
            query.setParameter("userId", userId);
            query.setParameter("permissionId", permissionId);
            return query.list();
        } catch (RuntimeException re) {
            log.error("find all failed", re);
            throw re;
        }
    }

    @Override
    public void deletePermissionUserGroup(PermissionUserGroup permissionUserGroup) {
        log.debug("Delete a permissionUserGroup");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.delete(permissionUserGroup);
            log.debug("Delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    @Override
    public List <PermissionUserGroup> findPermissionUserGroups(Map <String, Object> paramMap, String entity) {
    	Query query = getSessionFactory().getCurrentSession().createQuery(buildSearchCriteria(paramMap, entity));
    	return query.list();
    }
    
    private String buildSearchCriteria(Map <String, Object> paramMap, String entity){
    	StringBuilder queryString = new StringBuilder("from " + entity + " where ");
    	Set<String> mapKeys = paramMap.keySet();
    	int i=0;
    	for (String mapKey : mapKeys) {
    		if (i > 0)
    			queryString.append(" and ");
    		queryString.append(mapKey + " = '"+ paramMap.get(mapKey) +  "'");
    		i++;
    	}
    	return queryString.toString();
    }
}
