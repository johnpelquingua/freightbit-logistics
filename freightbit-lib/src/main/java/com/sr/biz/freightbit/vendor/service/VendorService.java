package com.sr.biz.freightbit.vendor.service;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 */

import java.util.List;

import com.sr.biz.freightbit.vendor.entity.Vendor;
import com.sr.biz.freightbit.vendor.exceptions.VendorAlreadyExistsException;

public interface VendorService {

    public Integer addVendor(Vendor vendor) throws VendorAlreadyExistsException;

    public void updateVendor(Vendor vendor);

    public void deleteVendor(Vendor vendor);

    public Vendor findVendorById(Integer vendorId);

    public List<Vendor> findAllVendors();

    public List<Vendor> findAllVendorByClientId(Integer clientId);

    public Vendor findVendorByVendorCode(String vendorCode);

    public List<Vendor> findVendorsByCriteria(String column, String value, Integer clientId);

}
