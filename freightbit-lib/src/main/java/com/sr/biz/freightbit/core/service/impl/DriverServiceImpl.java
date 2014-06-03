package com.sr.biz.freightbit.core.service.impl;

import java.util.Date;
import java.util.List;

import com.sr.biz.freightbit.core.dao.DriverDao;
import com.sr.biz.freightbit.core.exceptions.DriverAlreadyExistsException;
import com.sr.biz.freightbit.core.service.DriverService;
import com.sr.biz.freightbit.vendor.entity.Driver;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public class DriverServiceImpl implements DriverService{

    private DriverDao driverDao;

    public void setDriverDao(DriverDao driverDao) { this.driverDao = driverDao;}

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addDriver(Driver driver) throws DriverAlreadyExistsException {
        if (driverDao.findDriverByLastName(driver.getLastName())!=null)
            throw new DriverAlreadyExistsException(driver.getLastName());
        else
            driverDao.addDriver(driver);
    }


    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteDriver(Driver driver){
        driverDao.deleteDriver(driver);
    }

    @Override
    public List<Driver> findAllDriversByClientId(Integer clientId){
        return driverDao.findAllDriversByClientId(clientId);
    }

    @Override
    public List<Driver> findAllDrivers() {
        List<Driver> drivers = driverDao.findAllDrivers();
        return drivers;
    }

    @Override
    public Driver findDriverById(Integer driverId ) {
        return driverDao.findDriverById(driverId);
    }

    @Override
    public Driver findDriverByLastName(String lastName){
        List<Driver> result = driverDao.findDriverByLastName(lastName);
        if (result != null && !result.isEmpty())
            return result.get(0);
        return null;
    }

    @Override
    public void updateDateHired(Driver driver){
        driver.setDateHired(new Date());
        driverDao.updateDriver(driver);
    }

    @Override
    public void updateDateTerminated(Driver driver){
        driver.setDateTerminated(new Date());
        driverDao.updateDriver(driver);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateDriver(Driver driver) {
        driverDao.updateDriver(driver);
    }

}
