package com.sr.biz.freightbit.vendor.dao.impl;

/**
 * Created with IntelliJ IDEA.
 * User: johnpelquingua.com
 */

import com.sr.biz.freightbit.vendor.dao.TrailersDao;
import com.sr.biz.freightbit.vendor.entity.Trailers;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class TrailersDaoImpl extends HibernateDaoSupport implements TrailersDao {

    private static final Logger log = Logger.getLogger(TrailersDaoImpl.class);

    @Override
    public void addTrailers(Trailers trailers) {
        log.debug("Adding Trailers");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.save(trailers);
            log.debug("Trailers addedd successfully");
        } catch (RuntimeException e) {
            log.error("Trailers added failed", e);
            throw e;
        }
    }

    @Override
    public void deleteTrailers(Trailers trailers) {
        log.debug("Deleting Trailers");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.delete(trailers);
            log.debug("Trailers deleted successfully");
        } catch (RuntimeException e) {
            log.error("Trailers delete failed", e);
            throw e;
        }
    }

    @Override
    public List<Trailers> findAllTrailers() {
        log.debug("Finding all trailers");
        try {
            return getSessionFactory().getCurrentSession()
                    .createQuery("from Trailers").list();
        } catch (RuntimeException e) {
            log.error("Find all failed", e);
            throw e;
        }
    }

    @Override
    public Trailers findTrailersById(Integer trailerId) {
        log.debug("Getting Trailers instance with id: " + trailerId);
        try {
            Trailers instance = (Trailers) getSessionFactory().getCurrentSession().get(
                    Trailers.class, trailerId);
            if (instance == null) {
                log.debug("Get successful, no instance found");
            } else {
                log.debug("Get successful, instance found");
            }
            return instance;
        } catch (RuntimeException e) {
            log.error("Get failed", e);
            throw e;
        }
    }

    @Override
    public List<Trailers> findAllTrailersByClientId(Integer clientId) {

        log.debug("finding Orders by client");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Trailers t where t.clientId = :clientId");
            query.setParameter("clientId", clientId);
            List<Trailers> results = (List<Trailers>) query.list();
            log.debug("find by client id successful, result size:" + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by client id failed", re);
            throw re;
        }
    }


    @Override
    public List<Trailers> findTrailersByTrailerCode(String trailerCode) {
        log.debug("Finding Trailers instance");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Trailers t where t.trailerCode = :trailerCode");
            query.setParameter("trailerCode", trailerCode);
            List<Trailers> results = (List<Trailers>) query.list();
            log.debug("Find by trailerCode successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException e) {
            log.error("Find by trailerCode failed", e);
            throw e;
        }
    }

    @Override
    public void updateTrailers(Trailers trailers) {
        log.debug("Updating Trailers");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(trailers);
            log.debug("Update successful");
        } catch (RuntimeException e) {
            log.error("update failed", e);
            throw e;
        }
    }
}
