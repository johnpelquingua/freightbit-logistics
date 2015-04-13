package com.sr.biz.freightbit.vesselSchedule.dao;

import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;

import java.util.List;

public interface VesselSchedulesDao {

    public Integer addVesselSchedule(VesselSchedules vesselSchedules);

    public void deleteVesselSchedule(VesselSchedules vesselSchedules);

    public void updateVesselSchedule(VesselSchedules vesselSchedules);

    public List<VesselSchedules> findAllVesselSchedules();

    public VesselSchedules findVesselScheduleById(Integer vesselScheduleId);

    public VesselSchedules findVesselScheduleByIdVoyageNumber(String voyageNumber);

    public List<VesselSchedules> findVesselSchedulesByVendorId(Integer vendorId);

    public List<VesselSchedules> findVesselSchedulesByCriteria(String column, String value);

    public List<VesselSchedules> findVesselScheduleByVoyageNumber(String voyageNumber);

    public List<VesselSchedules> findVesselScheduleByVoyageNumberAndId(String voyageNumber, Integer vesselScheduleId);
}
