package com.sr.biz.freightbit.vendor.dao;

/**
 * Created with IntelliJ IDEA.
 * User: johnpelquingua.com
 */

import java.util.List;

import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.vendor.entity.Trucks;


public interface TrucksDao {

    public void updateTrucks(Trucks trucks);

    public void addTrucks(Trucks trucks);

    public void deleteTrucks(Trucks trucks);

    public Trucks findTrucksById(Long truckId);

    public List<Trucks> findTrucksByTruckCode(String truckCode);

    public List<Trucks> findAllTrucks();

    public List<User> findAllUsersByClientId(Long clientId);

    public List<Trucks> findTrucksByVendorId(Integer vendorId);
}
