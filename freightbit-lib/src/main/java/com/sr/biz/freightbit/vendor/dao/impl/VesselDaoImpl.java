package com.sr.biz.freightbit.vendor.dao.impl;

/**
 * Created by ADMIN on 5/16/2014.
 */


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.vendor.dao.VesselDao;
import com.sr.biz.freightbit.vendor.entity.Vessel;

import java.util.List;

@Transactional
public class VesselDaoImpl extends HibernateDaoSupport implements VesselDao {

    private static final Log Log = LogFactory.getLog(VesselDao.class);

    @Override
    public void addVessel(Vessel vessel){
        Log.debug("adding new vessel");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.save(vessel);
            Log.debug("adding success");
        }catch(RuntimeException re){
            Log.error("adding vessel failed", re);
            throw re;
        }
    }

    @Override
    public void deleteVessel(Vessel vessel){
        Log.debug("deleting vessel");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.delete(vessel);
            Log.debug("deleting successful");
        }catch(RuntimeException re){
            Log.error("deleting failed", re);
            throw re;
        }

    }

    @Override
    public void updateVessel(Vessel vessel){
        Log.debug("updating vessel");
        try{
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(vessel);
            Log.debug("updating success");
        }catch(RuntimeException re){
            Log.error("updating failed", re);
            throw  re;
        }


    }

    @Override
    public List<Vessel> findAllVessel(){
        Log.debug("finding all vessel");
        try{
            return getSessionFactory().getCurrentSession().createQuery("from vessels").list();
        }catch(RuntimeException re){
            Log.error("finding all vessel failed", re);
            throw re;
        }

    }

    @Override
    public Vessel findVesselById(Integer id){
        Log.debug("finding vessel by id");
        try{
            Vessel instance = (Vessel) getSessionFactory().getCurrentSession().get(Vessel.class, id);
            if(instance == null){
                Log.debug("no vesselId exists");
            }else{ Log.debug("vesselId found");}
            return instance;
        }catch(RuntimeException re){
            Log.debug("finding failed", re);
            throw  re;
        }


    }

    @Override
    public List<Vessel> findVesselByClientId(long clientId){
        Log.debug("finding vessel by client");
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Vessel v where v.clientId = :clientId");
            query.setParameter("clientId",clientId);
            List<Vessel> results = (List<Vessel>) query.list();
            Log.debug("finding vessel by id successful, result size: " + results.size());
            return results;

        }catch(RuntimeException re){
            Log.error("finding vessel failed", re);
            throw re;
        }
    }

    @Override
    public List<Vessel> findVesselByName(String vesselName){
        Log.debug("finding vessel by name");
        try{
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Vessel v where v.vesselName = :vesselName");
            query.setParameter("vesselName", vesselName);
            List<Vessel> results = (List<Vessel>) query.list();
            Log.debug("Find by vesselName successful, result size: "
                    + results.size());
            return results;
        }catch(RuntimeException re){
            Log.error("finding vessel by name failed", re);
            throw re;
        }

    }

    @Override
    public List<Vessel> findVesselByVendorId(Integer vendorId) {
        Log.debug("finding vessel by vendorId");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from Vessel v where v.vendorId = :vendorId");
            query.setParameter("vendorId", vendorId);
            List<Vessel> results = (List<Vessel>) query.list();
            return results;
        } catch (RuntimeException re) {
            Log.error("finding vessely by vendorId failed", re);
            throw re;
        }
    }

}
