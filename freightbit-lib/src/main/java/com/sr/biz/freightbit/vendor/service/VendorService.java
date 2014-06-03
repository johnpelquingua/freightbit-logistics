package com.sr.biz.freightbit.vendor.service;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 */

import java.util.List;

import com.sr.biz.freightbit.vendor.entity.Vendor;
import com.sr.biz.freightbit.vendor.exceptions.VendorAlreadyExistsException;

public interface VendorService {

    public void addVendor(Vendor vendor) throws VendorAlreadyExistsException;

    public void updateVendor(Vendor vendor);

    public void deleteVendor(Vendor vendor);

    public Vendor findVendorById(long vendorId);

    public List<Vendor> findAllVendors();

    public List<Vendor> findAllVendorByClientId(long clientId);

    public Vendor findVendorByVendorCode(String vendorCode);

}
