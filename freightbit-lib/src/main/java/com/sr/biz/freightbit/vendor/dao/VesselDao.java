package com.sr.biz.freightbit.vendor.dao;

/**
 * Created by ADMIN on 5/16/2014.
 */

import com.sr.biz.freightbit.vendor.entity.Vessel;

import java.util.List;

public interface VesselDao {

    public void addVessel(Vessel vessel);

    public void deleteVessel(Vessel vessel);

    public void updateVessel(Vessel vessel);

    public List<Vessel> findAllVessel();

    public Vessel findVesselById(Integer id);

    public List<Vessel> findVesselByClientId(long clientId);

    public List<Vessel> findVesselByName(String vesselName);

    public List<Vessel> findVesselByVendorId(Integer vendorId);

    public List<Vessel> findDuplicateByVesselNumber(String vesselNumber);

    public List<Vessel> findDuplicateByVesselNumberAndId(String vesselNumber, Integer vesselId);
}
