package com.sr.biz.freightbit.vendor.service.impl;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 */

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sr.biz.freightbit.vendor.dao.VendorDao;
import com.sr.biz.freightbit.vendor.entity.Vendor;
import com.sr.biz.freightbit.vendor.exceptions.VendorAlreadyExistsException;
import com.sr.biz.freightbit.vendor.service.VendorService;

public class VendorServiceImpl implements VendorService {

    private VendorDao vendorDao;

    public void setVendorDao(VendorDao vendorDao) {
        this.vendorDao = vendorDao;
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
    public void updateVendor(Vendor vendor){
            vendorDao.updateVendor(vendor);
    }

    @Override
    public List<Vendor> findVendorsByCriteria(String column, String value, Integer clientId) {
        return vendorDao.findVendorsByCriteria(column, value, clientId);
    }

}
