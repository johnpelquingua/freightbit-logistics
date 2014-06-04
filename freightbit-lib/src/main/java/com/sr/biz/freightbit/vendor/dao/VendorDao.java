package com.sr.biz.freightbit.vendor.dao;

import com.sr.biz.freightbit.vendor.entity.Vendor;

import java.util.List;

/**
 * Created by JMXPSX on 5/29/14.
 */
public interface VendorDao {

    public Integer addVendor(Vendor vendor);

    public void deleteVendor(Vendor vendor);

    public List<Vendor> findAllVendors();

    public List<Vendor> findAllVendorByClientId(long clientId);

    public Vendor findVendorById(long vendorId);

    public List<Vendor> findVendorByVendorCode(String vendorCode);

    public void updateVendor(Vendor vendor);

    public List<Vendor> findVendorByCriteria(String column, String value);

}
