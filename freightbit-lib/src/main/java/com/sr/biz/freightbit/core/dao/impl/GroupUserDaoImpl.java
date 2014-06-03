package com.sr.biz.freightbit.core.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sr.biz.freightbit.core.dao.GroupUserDao;
import com.sr.biz.freightbit.core.entity.GroupUser;

@Transactional
public class GroupUserDaoImpl extends HibernateDaoSupport implements GroupUserDao {
	
	private static final Logger log = Logger.getLogger(GroupUserDaoImpl.class);

	@Override
	public void addGroupUser(GroupUser groupUser) {
		log.debug("adding a new GroupUser");
		try {
			Session session = getSessionFactory().getCurrentSession();
			session.save(groupUser);
			log.debug("add successful");
		} catch (RuntimeException re) {
			log.error("add failed", re);
			throw re;
		}
	}

	@Override
	public void updateGroupUser(GroupUser groupUser) {
		log.debug("updating a new GroupUser");
		try {
			Session session = getSessionFactory().getCurrentSession();
			session.saveOrUpdate(groupUser);
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}
	
	@Override
	public void deleteGroupUser(GroupUser groupUser) {
		log.debug("delete from GroupUser");
		try {
			Session session = getSessionFactory().getCurrentSession();
			session.delete(groupUser);
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}

	@Override
	public List<GroupUser> findAllUsersByGroupId(Integer groupId) {
		log.debug("finding Users instance by group");
		try {
			Query query = getSessionFactory().getCurrentSession().createQuery(" from GroupUser gu where gu.groupId = :groupId");
			query.setParameter("groupId", groupId);
			List<GroupUser> results = (List<GroupUser>) query.list();
			log.debug("find by client id successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by group id failed", re);
			throw re;
		}
	}

	@Override
	public List<GroupUser> findAllGroupsByUserId(Integer userId) {
		log.debug("finding Group instance by user");
		try {
			Query query = getSessionFactory().getCurrentSession().createQuery(" from GroupUser gu where gu.userId = :userId");
			query.setParameter("userId", userId);
			List<GroupUser> results = (List<GroupUser>) query.list();
			log.debug("find by user id successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by user id failed", re);
			throw re;
		}
	}

}
