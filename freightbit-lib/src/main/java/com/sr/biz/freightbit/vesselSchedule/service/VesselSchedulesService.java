package com.sr.biz.freightbit.vesselSchedule.service;

import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;
import com.sr.biz.freightbit.vesselSchedule.exception.VesselSchedulesAlreadyExistsException;

import java.util.List;

/**
 * Created by Clarence C. Victoria on 7/22/14.
 */
public interface VesselSchedulesService {

    public void addVesselSchedule(VesselSchedules vesselSchedules) throws VesselSchedulesAlreadyExistsException;

    public void deleteVesselSchedule(VesselSchedules vesselSchedules);

    public void updateVesselschedule(VesselSchedules vesselSchedules) throws VesselSchedulesAlreadyExistsException;

    public List<VesselSchedules> findAllVesselSchedules();

    public List<VesselSchedules> findVesselSchedulesById(Integer vesselScheduleId);

    public List<VesselSchedules> findVesselScheduleByVendorId(Integer vendorId);

    public List<VesselSchedules> findVesselSchedulesByCriteria(String column, String value, Integer clientId);
}
