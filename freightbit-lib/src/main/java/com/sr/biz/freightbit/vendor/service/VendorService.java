package com.sr.biz.freightbit.vendor.service;

import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.core.exceptions.ContactAlreadyExistsException;
import com.sr.biz.freightbit.vendor.entity.*;
import com.sr.biz.freightbit.vendor.exceptions.*;

import java.util.List;

public interface VendorService {

    public Integer addVendor(Vendor vendor) throws VendorAlreadyExistsException;

    public void updateVendor(Vendor vendor);

    public void updateErnestVendor(Vendor vendor);

    public void deleteVendor(Vendor vendor);

    public Vendor findVendorById(Integer vendorId);

    public List<Vendor> findAllVendors();

    public List<Vendor> findAllShippingVendor();

    public List<Vendor> findShippingVendorClass(String vendorClass);

    public List<Vendor> findAllVendorByClientId(Integer clientId);

    public Vendor findVendorByVendorCode(String vendorCode);

    public Vendor findErnestRecipient(String vendorCode, String serviceArea);

    public List<Vendor> findVendorsByCriteria(String column, String value, Integer clientId);

    public List<Vendor> findVendorTruckByLocation(String serviceArea);

    //Address

    public void addAddress(Address address);

    public void deleteAddress(Address address);

    public void updateAddress(Address address);

    public List<Address> findAllAddressByClientId(Integer clientId);

    public List<Address> findAllAddress(Integer addressId);

    public Address findAddressById(Integer addressId);

    public Address findAddressByRefId(Integer customerId);

    public List<Address> findAllAddressByRefId(Integer referenceId);


    public List<Address> findAddressByRefIdAndType(String addressType, Integer customerId);


//    Trucks Service

    public void addTrucks(Trucks trucks) throws TrucksAlreadyExistsException;

    public void updateTrucks(Trucks trucks);

    public void deleteTrucks(Trucks trucks);

    /*public Trucks findTrucksById(long truckId);*/

    public List<Trucks> findAllTrucks();

    public Trucks findTrucksByTruckCode(String truckCode);

    public List<Trucks> findTrucksByVendorId(Integer vendorId);

//    Driver Service

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

//    Trailers Service

    public void addTrailers(Trailers trailers) throws TrailersAlreadyExistsException;

    public void updateTrailers(Trailers trailers);

    public void deleteTrailers(Trailers trailers);

    public Trailers findTrailersById(Integer trailerId);

    public List<Trailers> findAllTrailersByClientId(Integer trailerId);

    public List<Trailers> findAllTrailers();

    public Trailers findTrailersByTrailerCode(String trailerCode);


//    Vessel Service

    public void addVessel(Vessel vessel) throws VesselAlreadyExistsException;

    public void deleteVessel(Vessel vessel);

    public void updateVessel(Vessel vessel);

    public List<Vessel> findAllVessel();

    public Vessel findVesselById(Integer id);

    public List<Vessel> findVesselByClientId(long clientId);

    public Vessel findVesselByName(String vesselName);

    public List<Vessel> findVesselByVendorId(Integer vendorId);

//   Contact Service

    public Contacts findContactById(Integer contactId);

    public void addContact(Contacts contacts) throws ContactAlreadyExistsException;

    public void deleteContact(Contacts contacts);

    public void updateContact(Contacts contacts);

    public List<Contacts> findAllContacts();

    public List<Contacts> findContactByRefIdAndType(String contactType, Integer customerId);

    public List<Contacts> findContactByRefTableAndId(String referenceTable, Integer customerId);

    public List<Contacts> findContactByReferenceId(Integer vendorId);

}