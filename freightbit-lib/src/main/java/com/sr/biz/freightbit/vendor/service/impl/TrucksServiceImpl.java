package com.sr.biz.freightbit.vendor.service.impl;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 */

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.vendor.dao.TrucksDao;
import com.sr.biz.freightbit.vendor.exceptions.TrucksAlreadyExistsException;
import com.sr.biz.freightbit.vendor.service.TrucksService;
import com.sr.biz.freightbit.vendor.entity.Trucks;

public class TrucksServiceImpl implements TrucksService {

    private TrucksDao trucksDao;

    public void setTrucksDao(TrucksDao trucksDao) {
        this.trucksDao = trucksDao;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addTrucks(Trucks trucks) throws TrucksAlreadyExistsException {
        if (trucksDao.findTrucksByTruckCode(trucks.getTruckCode()).size() > 0)
            throw new TrucksAlreadyExistsException(trucks.getTruckCode());
        else
            trucksDao.addTrucks(trucks);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateTrucks(Trucks trucks) {
        trucksDao.updateTrucks(trucks);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteTrucks(Trucks trucks) {
        trucksDao.deleteTrucks(trucks);
    }

   /* @Override
    public List<Trucks> findTrucksById(long truckId) {
        return trucksDao.findTrucksById(truckId);
    }*/

    @Override
    public List<Trucks> findAllTrucks() {
        List<Trucks> trucks = trucksDao.findAllTrucks();
        return trucks;
    }

    @Override
    public Trucks findTrucksByTruckCode(String truckCode) {
        List<Trucks> result = trucksDao.findTrucksByTruckCode(truckCode);
        if (result != null && !result.isEmpty())
            return result.get(0);
        return null;
    }

    @Override
    public List<Trucks> findTrucksByVendorId(Integer vendorId) {
        List<Trucks> result = trucksDao.findTrucksByVendorId(vendorId);
       /* if (result != null && !result.isEmpty()) {
            return result.get(0);
        }*/
        return result;
    }

  /*  @Override
    public void updateLastVisitDate(User user) {
        user.setLastVisitDate(new Date());
        userDao.updateUser(user);
    }*/
}
