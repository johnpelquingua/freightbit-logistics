package com.sr.biz.freightbit.operations.dao.impl;

import com.sr.biz.freightbit.operations.dao.ContainerDao;
import com.sr.biz.freightbit.operations.entity.Container;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 11/3/2014.
 */

@Transactional
public class ContainerDaoImpl extends HibernateDaoSupport implements ContainerDao{

    private static final Logger Log = Logger.getLogger(ContainerDaoImpl.class);

    @Override
    public void addContainer(Container container){
        Log.debug("Adding new Container");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.save(container);
            Log.debug("Successfully added new Container");
        }catch (Exception e) {
            Log.error("Adding of new Container failed");
            throw e;
        }
    }

    @Override
    public void updateContainer(Container container) {
        Log.debug("Editing a Container");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(container);
            Log.debug("Successfully edited a container");
        } catch (Exception e) {
            Log.error("Editing of a Container failed");
            throw e;
        }
    }

    @Override
    public void deleteContainer(Container container) {
        Log.debug("Deleting a Container");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.delete(container);
            Log.debug("Successfully delete a Container");
        } catch (Exception e){
            Log.error("Deleting of Container Failed");
            throw e;
        }
    }

    @Override
    public List<Container> findAllContainer() {
        Log.debug("Finding all Containers");
        try {
            return getSessionFactory().getCurrentSession().createQuery("from Container").list();
        } catch (Exception e) {
            Log.error("Finding Container failed");
            throw e;
        }
    }

    @Override
    public List<Container> findContainerByOrderNumber(String orderNumber) {
        Log.debug("Finding Container via orderNumber");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where orderNumber = :orderNumber");
            query.setParameter("orderNumber", orderNumber);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by orderNumber successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Container by orderNumber failed", e);
            throw e;
        }
    }

    @Override
    public List<Container> findContainerByEIRNumber(String eirNumber) {
        Log.debug("Finding Container via eirNumber");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from Container where eirNumber = :eirNumber");
            query.setParameter("eirNuumber", eirNumber);
            List<Container> results = (List<Container>) query.list();
            Log.debug("Find Container by eirNumber successful, result size: " + results.size());
            return results;
        } catch (Exception e) {
            Log.error("Find Contatiner by eirNnumber failed", e);
            throw e;
        }
    }

    @Override
    public Container findContainerById(Integer containerId) {
        Log.debug("Finding Container By Id");
        try {
            Container instance = (Container) getSessionFactory().getCurrentSession().get(Container.class, containerId);
            if (instance == null) {
                Log.debug("Container Found!");
            } else {
                Log.debug("Container Not Found!");
            }
            return instance;
        }  catch (Exception e) {
            Log.error("Get Failed", e);
            throw e;
        }
    }
}
