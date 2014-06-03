package com.sr.biz.freightbit.core.service;

import java.util.List;

import com.sr.biz.freightbit.core.exceptions.DriverAlreadyExistsException;
import com.sr.biz.freightbit.vendor.entity.Driver;


public interface DriverService {

    public void addDriver(Driver driver) throws DriverAlreadyExistsException;

    public void deleteDriver(Driver driver);

    public List<Driver> findAllDriversByClientId(Integer clientId);

    public List<Driver> findAllDrivers();

    public Driver findDriverById(Integer driverId);

    public Driver findDriverByLastName(String lastName);

    public void updateDateHired(Driver driver);

    public void updateDateTerminated(Driver driver);

    public void updateDriver(Driver driver);
}
