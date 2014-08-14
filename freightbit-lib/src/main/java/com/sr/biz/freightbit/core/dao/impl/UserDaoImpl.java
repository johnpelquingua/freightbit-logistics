package com.sr.biz.freightbit.core.dao.impl;

// Generated Feb 11, 2014 3:09:30 PM by Hibernate Tools 3.4.0.CR1

import com.sr.biz.freightbit.core.dao.UserDao;
import com.sr.biz.freightbit.core.entity.User;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Hibernate Tools
 * @see com.sr.biz.freightbit.core.entity.User
 */
@Transactional
public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

    private static final Logger log = Logger.getLogger(UserDaoImpl.class);


    @Override
    public Integer addUser(User user) {
        log.debug("adding a new User");
        try {
            Session session = getSessionFactory().getCurrentSession();
            Integer userId = (Integer) session.save(user);
            log.debug("Add user successful");
            return userId;
        } catch (RuntimeException re) {
            log.error("add failed", re);
            throw re;
        }
    }


    @Override
    public void deleteUser(User user) {
        log.debug("deleting a User");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.delete(user);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }


    @Override
    public List<User> findAllUsers(Integer clientId) {
        log.debug("finding all User");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from User where clientId = :clientId");
            query.setParameter("clientId", clientId);
            return query.list();
        } catch (RuntimeException re) {
            log.error("find all failed", re);
            throw re;
        }
    }


    @Override
    public List<User> findAllUsersByClientId(Long clientId) {
        log.debug("finding User instance by client");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from User u where u.clientId = :clientId");
            query.setParameter("clientId", clientId);
            List<User> results = (List<User>) query.list();
            log.debug("find by client id successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by client id failed", re);
            throw re;
        }
    }


    @Override
    public User findUserById(Integer id) {
        log.debug("getting User instance with id: " + id);
        try {
            User instance = (User) getSessionFactory().getCurrentSession().get(
                    User.class, id);
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
    public User findUserByUserName(String username) {
        log.debug("finding User instance by example");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from User u where u.username = :username");
            query.setParameter("username", username);
            List<User> results = (List<User>) query.list();
            if (results != null && results.size() > 0) {
            	return results.get(0);
            } 
            return null;
        } catch (RuntimeException re) {
            log.error("find by username failed", re);
            throw re;
        }
    }

    /*
     * (non-Javadoc)
     *
     * @see
     * com.sr.biz.freightbit.customer.dao.UserDao#update(com.sr.biz.freightbit
     * .customer.entity.User)
     */
    @Override
    public void updateUser(User user) {
        log.debug("updating a new User");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(user);
            log.debug("update successful");
        } catch (RuntimeException re) {
            log.error("update failed", re);
            throw re;
        }
    }

    @Override
    public List<User> findUsersByCriteria(String column, String value, Integer clientId) {
        log.debug("Find users by criteria ");
        Session session = getSessionFactory().getCurrentSession();
        List<User> users = session.createCriteria(User.class)
                .add(Restrictions.like(column, value))
                .add(Restrictions.eq("client.clientId", clientId))
                .list();
        return users;
    }

}
