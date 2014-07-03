package com.sr.biz.freightbit.vendor.service;

/**
 * Created by ADMIN on 5/16/2014.
 */

import com.sr.biz.freightbit.vendor.entity.Vessel;
import com.sr.biz.freightbit.vendor.exceptions.VesselAlreadyExistsException;

import java.util.List;

public interface VesselService {

    public void addVessel(Vessel vessel) throws VesselAlreadyExistsException;

    public void deleteVessel(Vessel vessel);

    public void updateVessel(Vessel vessel);

    public List<Vessel> findAllVessel();

    public Vessel findVesselById(Integer id);

    public List<Vessel> findVesselByClientId(long clientId);

    public Vessel findVesselByName(String vesselName);

    public List<Vessel> findVesselByVendorId(Integer vendorId);


}
