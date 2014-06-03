package com.sr.biz.freightbit.vendor.service;

/**
 * Created with IntelliJ IDEA.
 * User: johnpelquingua.com
 */

import java.util.List;

import com.sr.biz.freightbit.core.exceptions.TrucksAlreadyExistsException;
import com.sr.biz.freightbit.vendor.entity.Trucks;

public interface TrucksService {

    public void addTrucks(Trucks trucks) throws TrucksAlreadyExistsException;

    public void updateTrucks(Trucks trucks);

    public void deleteTrucks(Trucks trucks);

    /*public Trucks findTrucksById(long truckId);*/

    public List<Trucks> findAllTrucks();

    /*public List<Trucks> findTrucksByTruckCode(String truckCode);*/

}
