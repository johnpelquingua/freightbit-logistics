package com.sr.biz.freightbit.vendor.service;

import com.sr.biz.freightbit.vendor.entity.Driver;
import com.sr.biz.freightbit.vendor.exceptions.DriverAlreadyExistsException;

import java.util.List;


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

    public List<Driver> findDriverByVendorId(Integer vendorId);

    public Driver findDriverByDriverCode(String driverCode);
}
