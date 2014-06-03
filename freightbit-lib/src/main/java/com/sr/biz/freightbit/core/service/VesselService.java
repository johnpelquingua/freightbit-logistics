package com.sr.biz.freightbit.core.service;

/**
 * Created by ADMIN on 5/16/2014.
 */
import java.util.List;

import com.sr.biz.freightbit.core.dao.VesselDao;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.exceptions.VesselAlreadyExistsException;
import com.sr.biz.freightbit.vendor.entity.Vessel;
public interface VesselService {

    public void addVessel(Vessel vessel) throws VesselAlreadyExistsException;

    public void deleteVessel(Vessel vessel);

    public void updateVessel(Vessel vessel);

    public List<Vessel> findAllVessel();

    public Vessel findVesselById(long id);

    public List<Vessel> findVesselByClientId(long clientId);

    public Vessel findVesselByName(String vesselName);


}
