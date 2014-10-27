package com.sr.biz.freightbit.vesselSchedule.dao.impl;

import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.vendor.entity.Vessel;
import com.sr.biz.freightbit.vesselSchedule.dao.VesselSchedulesDao;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 7/22/14.
 */

@Transactional
public class VesselSchedulesDaoImpl extends HibernateDaoSupport implements VesselSchedulesDao{

    private static final Logger log = Logger.getLogger(VesselSchedulesDaoImpl.class);

    @Override
    public void addVesselSchedule(VesselSchedules vesselSchedules) {
        log.debug("Adding new Vessel Schedule");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.save(vesselSchedules);
            log.debug("Vessel Schedule added successfully");
        } catch (Exception e) {
            log.error("Adding new Vessel Schedule failed", e);
            throw e;
        }
    }

    @Override
    public void deleteVesselSchedule(VesselSchedules vesselSchedules) {
        log.debug("Deleting a Vessel Schedule");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.delete(vesselSchedules);
            log.debug("Vessel Schedule deleted successfully");
        } catch (Exception e) {
            log.error("Deleting a Vessel Schedule failed", e);
            throw e;
        }
    }

    @Override
    public void updateVesselSchedule(VesselSchedules vesselSchedules) {
        log.debug("Updating a Vessel Schedule");
        try {
            Session session = getSessionFactory().getCurrentSession();
            session.saveOrUpdate(vesselSchedules);
            log.debug("Vessel Schedule updated successfully");
        } catch (Exception e) {
            log.error("Updating a Vessel Schedule failed");
            throw e;
        }
    }

    @Override
    public List<VesselSchedules> findAllVesselSchedules() {
        log.debug("Finding all Vessel Schedules");
        try {
            log.debug("Finding all Vessel Schedule successful");
            return getSessionFactory().getCurrentSession().createQuery("from VesselSchedules").list();
        } catch (Exception e) {
            log.error("Finding all Vessel Schedules failed", e);
            throw e;
        }
    }

    @Override
     public VesselSchedules findVesselScheduleById(Integer vesselScheduleId) {
        log.debug("Finding Vessel Schedule by Id");
        try {

            VesselSchedules instance = (VesselSchedules) getSessionFactory().getCurrentSession().get(VesselSchedules.class, vesselScheduleId);
            if (instance == null) {
                log.debug("get successful, no instance found");
            } else {
                log.debug("get successful, instance found");
            }
            return instance;


        } catch (Exception e) {
            log.error("Finding Vessel Schedule failed");
            throw e;
        }
    }

    @Override
    public VesselSchedules findVesselScheduleByIdVoyageNumber(String voyageNumber) {
        log.debug("Finding Vessel Schedule by Voyage Number");
        try {

            /*VesselSchedules instance = (VesselSchedules) getSessionFactory().getCurrentSession().get(VesselSchedules.class, voyageNumber);
            if (instance == null) {
                log.debug("get successful, no instance found");
            } else {
                log.debug("get successful, instance found");
            }
            return instance;*/

            Query query = getSessionFactory().getCurrentSession().createQuery(
                    "from VesselSchedules v where v.voyageNumber = :voyageNumber");
            query.setParameter("voyageNumber", voyageNumber);
            List<VesselSchedules> results = (List<VesselSchedules>) query.list();
            if (results != null && results.size() > 0) {
                return results.get(0);
            }
            return null;

        } catch (RuntimeException re) {
            log.error("Finding Vessel Schedule failed");
            throw re;
        }
    }

    @Override
    public List<VesselSchedules> findVesselScheduleByVoyageNumber(String voyageNumber) {
        log.debug("Finding Vessel Schedule by Id");
        try {

            Query query = getSessionFactory().getCurrentSession().createQuery("from VesselSchedules v where v.voyageNumber = :voyageNumber");
            query.setParameter("voyageNumber", voyageNumber);
            List<VesselSchedules> results = (List<VesselSchedules>) query.list();
            log.debug("Find Vessel Schedules by Id successful" + results.size());
            return results;
        } catch (Exception e) {
            log.error("Finding Vessel Schedule failed");
            throw e;
        }
    }

    @Override
    public List<VesselSchedules> findVesselScheduleByVoyageNumberAndId(String voyageNumber, Integer vesselScheduleId) {
        log.debug("Finding Vessel Schedule by Id");
        try {

            Query query = getSessionFactory().getCurrentSession().createQuery("from VesselSchedules v where v.voyageNumber = :voyageNumber and v.vesselScheduleId != :vesselScheduleId");
            query.setParameter("voyageNumber", voyageNumber);
            query.setParameter("vesselScheduleId", vesselScheduleId);
            List<VesselSchedules> results = (List<VesselSchedules>) query.list();
            log.debug("Find Vessel Schedules by Id successful" + results.size());
            return results;
        } catch (Exception e) {
            log.error("Finding Vessel Schedule failed");
            throw e;
        }
    }

    @Override
    public List<VesselSchedules> findVesselSchedulesByVendorId(Integer vendorId) {
        log.debug("Finding Vessel Schedules by vendorId");
        try {
            Query query = getSessionFactory().getCurrentSession().createQuery("from VesselSchedules v where v.vendorId = :vendorId");
            query.setParameter("vendorId", vendorId);
            List<VesselSchedules> results = (List<VesselSchedules>) query.list();
            log.debug("Find Vessel Schedules by vendorId successful" + results.size());
            return results;
        } catch (Exception e) {
            log.error("Finding Vessel Schedule by vendorId failed", e);
            throw e;
        }
    }

    @Override
    public List<VesselSchedules> findVesselSchedulesByCriteria(String column, String value) {
        log.debug("Find vendor by criteria ");
        Session session = getSessionFactory().getCurrentSession();
        List<VesselSchedules> vesselSchedules = session.createCriteria(VesselSchedules.class)
                .add(Restrictions.like(column, value))
                .list();
        return vesselSchedules;
    }
}
