package com.sr.biz.freightbit.vendor.service.impl;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 */

import com.sr.biz.freightbit.common.dao.AddressDao;
import com.sr.biz.freightbit.common.dao.ContactsDao;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.core.exceptions.ContactAlreadyExistsException;
import com.sr.biz.freightbit.vendor.dao.*;
import com.sr.biz.freightbit.vendor.entity.*;
import com.sr.biz.freightbit.vendor.exceptions.*;
import com.sr.biz.freightbit.vendor.service.VendorService;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

public class VendorServiceImpl implements VendorService {

    private VendorDao vendorDao;
    private AddressDao addressDao;
    private TrucksDao trucksDao;
    private DriverDao driverDao;
    private TrailersDao trailersDao;
    private VesselDao vesselDao;
    private ContactsDao contactsDao;


    public void setTrucksDao(TrucksDao trucksDao) {
        this.trucksDao = trucksDao;
    }

    public void setDriverDao(DriverDao driverDao) {
        this.driverDao = driverDao;
    }

    public void setTrailersDao(TrailersDao trailersDao) {
        this.trailersDao = trailersDao;
    }

    public void setVesselDao(VesselDao vesselDao) {
        this.vesselDao = vesselDao;
    }

    public void setAddressDao(AddressDao addressDao) {
        this.addressDao = addressDao;
    }

    public void setVendorDao(VendorDao vendorDao) {
        this.vendorDao = vendorDao;
    }

    public void setContactsDao(ContactsDao contactsDao) {
        this.contactsDao = contactsDao;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Integer addVendor(Vendor vendor) throws VendorAlreadyExistsException {
        if (vendorDao.findVendorByVendorCode(vendor.getVendorCode()).size() > 0)
            throw new VendorAlreadyExistsException(vendor.getVendorCode());
        else
            return vendorDao.addVendor(vendor);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteVendor(Vendor vendor) {
        vendorDao.deleteVendor(vendor);
    }

    @Override
    public List<Vendor> findAllVendorByClientId(Integer clientId) {
        List<Vendor> vendor = vendorDao.findAllVendorByClientId(clientId);
        return vendor;
    }

    @Override
    public List<Vendor> findAllVendors() {
        List<Vendor> vendor = vendorDao.findAllVendors();
        return vendor;
    }

    @Override
    public List<Vendor> findAllShippingVendor() {
        List<Vendor> vendor = vendorDao.findAllShippingVendor();
        return vendor;
    }

    @Override
    public List<Vendor> findShippingVendorClass(String vendorClass) {
        List<Vendor> vendor = vendorDao.findShippingVendorClass(vendorClass);
        return vendor;
    }

    @Override
    public List<Vendor> findVendorTruckByLocation(String serviceArea) {
        List<Vendor> vendor = vendorDao.findVendorTruckByLocation(serviceArea);
        return vendor;
    }

    @Override
    public Vendor findVendorById(Integer vendorId) {
        return vendorDao.findVendorById(vendorId);
    }

    public Vendor findVendorByVendorCode(String vendorCode) {
        List<Vendor> result = vendorDao.findVendorByVendorCode(vendorCode);
        if (result != null && !result.isEmpty())
            return result.get(0);
        return null;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateVendor(Vendor vendor) {
        if (vendorDao.findDuplicateVendorByVendorCode(vendor.getVendorCode(), vendor.getVendorId()).size() > 0)
            throw new VendorAlreadyExistsException(vendor.getVendorCode());
        else
            vendorDao.updateVendor(vendor);
    }

    @Override
    public List<Vendor> findVendorsByCriteria(String column, String value, Integer clientId) {
        return vendorDao.findVendorsByCriteria(column, value, clientId);
    }


    //    START OF ADDRESS
    @Override
    public Address findAddressByRefId(Integer customerId) {
        return addressDao.findContactByReferenceTableAndId("CUSTOMERS", customerId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addAddress(Address address) {
        addressDao.addAddress(address);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteAddress(Address address) {
        addressDao.deleteAddress(address);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateAddress(Address address) {
        addressDao.updateAddress(address);
    }


    @Override
    public List<Address> findAllAddressByRefId(Integer referenceId) {
        List<Address> address = addressDao.findAllAddressByRefId(referenceId);
        return address;
    }

    @Override
    public List<Address> findAllAddressByClientId(Integer clientId) {
        return addressDao.findAllAddressByClientId(clientId);
    }

    @Override
    public List<Address> findAllAddress(Integer addressId) {
        List<Address> address = addressDao.findAllAddress(addressId);
        return address;
    }


    @Override
    public Address findAddressById(Integer addressId) {
        return addressDao.findAddressById(addressId);
    }


    @Override
    public List<Address> findAddressByRefIdAndType(String addressType, Integer customerId) {
        return addressDao.findAddressByRefTableAndIdAndType("CUSTOMERS", customerId, addressType);
    }

//    END OF ADDRESS

//    START OF TRUCKS

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
    public void updateTrucks(Trucks trucks) throws TrucksAlreadyExistsException {

        if (trucksDao.findDuplicateTruckByTruckCodeAndId(trucks.getTruckCode(), trucks.getTruckId()).size() > 0) {
            throw new TrucksAlreadyExistsException(trucks.getTruckCode());
        } else {
            trucksDao.updateTrucks(trucks);
        }
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

//    END OF TRUCKS


    //    START OF DRIVER
    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addDriver(Driver driver) throws DriverAlreadyExistsException {
        if (driverDao.findDriverByLicense(driver.getLicenseNumber()).size() > 0) {
            throw new DriverAlreadyExistsException(driver.getDriverCode());
        } else {
            driver.setDateHired(new Date());
            driverDao.addDriver(driver);
        }
    }


    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteDriver(Driver driver) {
        driverDao.deleteDriver(driver);
    }

    @Override
    public List<Driver> findAllDriversByClientId(Integer clientId) {
        return driverDao.findAllDriversByClientId(clientId);
    }

    @Override
    public List<Driver> findAllDrivers() {
        List<Driver> driver = driverDao.findAllDrivers();
        return driver;
    }

    @Override
    public Driver findDriverById(Integer driverId) {
        return driverDao.findDriverById(driverId);
    }

    @Override
    public Driver findDriverByLastName(String lastName) {
        List<Driver> result = driverDao.findDriverByLastName(lastName);
        if (result != null && !result.isEmpty())
            return result.get(0);
        return null;
    }

    @Override
    public void updateDateHired(Driver driver) {
        driver.setDateHired(new Date());
        driverDao.updateDriver(driver);
    }

    @Override
    public void updateDateTerminated(Driver driver) {
        driver.setDateTerminated(new Date());
        driverDao.updateDriver(driver);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateDriver(Driver driver) throws DriverAlreadyExistsException {
        if (driverDao.findDriverByLicenseAndId(driver.getLicenseNumber(), driver.getDriverId()).size() > 0) {
            throw new DriverAlreadyExistsException(driver.getLicenseNumber());
        } else {
            driver.setDateHired(new Date());
            driverDao.updateDriver(driver);
        }
    }

    @Override
    public List<Driver> findDriverByVendorId(Integer vendorId) {
        List<Driver> result = driverDao.findDriverByVendorId(vendorId);
        return result;
    }

    @Override
    public Driver findDriverByDriverCode(String driverCode) {
        List<Driver> result = driverDao.findDriverByDriverCode(driverCode);
        if (result != null && !result.isEmpty()) {
            return result.get(0);
        }
        return null;
    }
//    END OF DRIVER

//    START OF TRAILERS

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addTrailers(Trailers trailers) throws TrailersAlreadyExistsException {
        if (trailersDao.findTrailersByTrailerCode(trailers.getTrailerCode()) != null)
            throw new TrailersAlreadyExistsException(trailers.getTrailerCode());
        else
            trailersDao.addTrailers(trailers);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateTrailers(Trailers trailers) {
        trailersDao.updateTrailers(trailers);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteTrailers(Trailers trailers) {
        trailersDao.deleteTrailers(trailers);
    }

    @Override
    public Trailers findTrailersById(Integer trailerId) {
        return trailersDao.findTrailersById(trailerId);
    }

    @Override
    public List<Trailers> findAllTrailersByClientId(Integer clientId) {
        return trailersDao.findAllTrailersByClientId(clientId);
    }

    @Override
    public List<Trailers> findAllTrailers() {
        List<Trailers> trailers = trailersDao.findAllTrailers();
        return trailers;
    }

    @Override
    public Trailers findTrailersByTrailerCode(String trailerCode) {
        List<Trailers> result = trailersDao.findTrailersByTrailerCode(trailerCode);
        if (result != null && !result.isEmpty()) {
            return result.get(0);
        }
        return null;
    }

//    END OF TRAILERS

//    START OF VESSEL

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addVessel(Vessel vessel) throws VesselAlreadyExistsException {
        if (vesselDao.findVesselByName(vessel.getVesselName()).size() > 0)
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
    public void updateVessel(Vessel vessel) throws VesselAlreadyExistsException {
        if (vesselDao.findDuplicateByVesselNumberAndId(vessel.getVesselNumber(), vessel.getVesselId()).size() > 0)
            throw new VesselAlreadyExistsException(vessel.getVesselNumber());
        else
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

//    END OF VESSEL

    //Contacts

    @Override
    public Contacts findContactById(Integer contactId) {
        return contactsDao.findContactById(contactId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addContact(Contacts contacts) throws ContactAlreadyExistsException {
        if (contactsDao.findContactByLastNameAndFirstName(contacts.getLastName(), contacts.getFirstName()).size() > 0)
            throw new ContactAlreadyExistsException(contacts.getLastName());
        else
            contactsDao.addContact(contacts);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteContact(Contacts contacts) {
        contactsDao.deleteContact(contacts);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateContact(Contacts contacts) throws ContactAlreadyExistsException {
        if (contactsDao.findDuplicateContactByNameAndId(contacts.getLastName(), contacts.getFirstName(), contacts.getContactId(), contacts.getReferenceId()).size() > 0)
            throw new ContactAlreadyExistsException(contacts.getLastName());
        else
            contactsDao.updateContact(contacts);
    }

    @Override
    public List<Contacts> findAllContacts() {
        List<Contacts> contacts = contactsDao.findAllContacts();
        return contacts;
    }

    @Override
    public List<Contacts> findContactByRefIdAndType(String contactType, Integer customerId) {
        return contactsDao.findContactByRefTableAndIdAndType("CUSTOMERS", customerId, contactType);
    }

    @Override
    public List<Contacts> findContactByReferenceId(Integer vendorId) {
        List<Contacts> result = contactsDao.findContactByReferenceId(vendorId);
        return result;

    }


//    @Override
//    public List<Contacts> findAllContactsByClientId(long clientId){
//        return contactsDao.findAllContactsByClientId(clientId);
//    }

    //end of Contacts
}