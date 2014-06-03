package com.sr.biz.freightbit.core.dao;

import java.util.List;

import com.sr.biz.freightbit.vendor.entity.Driver;

/**
 * Created by JMXPSX on 5/16/14.
 */

public interface DriverDao {

    public void addDriver(Driver driver);

    public void deleteDriver(Driver driver);

    public void updateDriver(Driver driver);

    public List<Driver> findAllDrivers();

    public List<Driver> findAllDriversByClientId(Integer clientId);

    public Driver findDriverById(Integer driverId);

    public List<Driver> findDriverByLastName(String lastName);

}