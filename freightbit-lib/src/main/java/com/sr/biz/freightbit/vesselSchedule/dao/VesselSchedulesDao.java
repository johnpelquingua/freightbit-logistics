package com.sr.biz.freightbit.vesselSchedule.dao;

import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 7/22/14.
 */
public interface VesselSchedulesDao {

    public void addVesselSchedule(VesselSchedules vesselSchedules);

    public void deleteVesselSchedule(VesselSchedules vesselSchedules);

    public void updateVesselSchedule(VesselSchedules vesselSchedules);

    public List<VesselSchedules> findAllVesselSchedules();

    public List<VesselSchedules> findVesselScheduleById(Integer vesselScheduleId);

    public List<VesselSchedules> findVesselSchedulesByVendorId(Integer vendorId);
}
