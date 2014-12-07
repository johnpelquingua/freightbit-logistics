package com.sr.biz.freightbit.vendor.service;

/**
 * Created with IntelliJ IDEA.
 * User: johnpelquingua.com
 */

import com.sr.biz.freightbit.vendor.entity.Trucks;
import com.sr.biz.freightbit.vendor.exceptions.TrucksAlreadyExistsException;

import java.util.List;

public interface TrucksService {

    public void addTrucks(Trucks trucks) throws TrucksAlreadyExistsException;

    public void updateTrucks(Trucks trucks);

    public void deleteTrucks(Trucks trucks);

    /*public Trucks findTrucksById(long truckId);*/

    public List<Trucks> findAllTrucks();

    public Trucks findTrucksByTruckCode(String truckCode);

    public Trucks findTruckByCode(String truckCode);

    public List<Trucks> findTrucksByPlateNumber(String plateNumber, Integer vendorId);

    public List<Trucks> findTrucksByVendorId(Integer vendorId);

}
