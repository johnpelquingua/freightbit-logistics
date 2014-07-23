package com.sr.biz.freightbit.vesselSchedule.dao.impl;

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
    public List<VesselSchedules> findVesselScheduleById(Integer vesselScheduleId) {
        log.debug("Finding Vessel Schedule by Id");
        try {

            Query query = getSessionFactory().getCurrentSession().createQuery("from VesselSchedules v where v.vesselScheduleId = :vesselScheduleId");
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
    public List<VesselSchedules> findVesselSchedulesByCriteria(String column, String value, Integer clientId) {
        log.debug("Find vendor by criteria ");
        Session session = getSessionFactory().getCurrentSession();
        List<VesselSchedules> vesselSchedules = session.createCriteria(VesselSchedules.class)
                .add(Restrictions.like(column, value))
                .add(Restrictions.eq("client.clientId", clientId))
                .list();
        return vesselSchedules;
    }
}
