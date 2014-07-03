package com.sr.biz.freightbit.vendor.service.impl;

/**
 * Created by ADMIN on 5/16/2014.
 */

import com.sr.biz.freightbit.vendor.dao.VesselDao;
import com.sr.biz.freightbit.vendor.entity.Vessel;
import com.sr.biz.freightbit.vendor.exceptions.VesselAlreadyExistsException;
import com.sr.biz.freightbit.vendor.service.VesselService;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class VesselServiceImpl implements VesselService {

    private VesselDao vesselDao;

    public VesselDao getVesselDao() {
        return vesselDao;
    }

    public void setVesselDao(VesselDao vesselDao) {
        this.vesselDao = vesselDao;
    }


    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addVessel(Vessel vessel) throws VesselAlreadyExistsException {
        if (vesselDao.findVesselByName(vessel.getVesselName()) != null)
            throw new VesselAlreadyExistsException(vessel.getVesselName());
        else
            vesselDao.addVessel(vessel);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteVessel(Vessel vessel) {
        vesselDao.deleteVessel(vessel);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateVessel(Vessel vessel) {
        vesselDao.updateVessel(vessel);
    }

    @Override
    public List<Vessel> findAllVessel() {
        List<Vessel> vessels = vesselDao.findAllVessel();
        return vessels;
    }

    @Override
    public Vessel findVesselById(Integer vesselId) {
        return vesselDao.findVesselById(vesselId);
    }

    @Override
    public List<Vessel> findVesselByClientId(long clientId) {
        return vesselDao.findVesselByClientId(clientId);
    }

    public Vessel findVesselByName(String vesselName) {
        List<Vessel> result = vesselDao.findVesselByName(vesselName);
        if (result != null && !result.isEmpty())
            return result.get(0);
        return null;
    }

    @Override
    public List<Vessel> findVesselByVendorId(Integer vendorId) {
        List<Vessel> result = vesselDao.findVesselByVendorId(vendorId);

        return result;
    }


}
