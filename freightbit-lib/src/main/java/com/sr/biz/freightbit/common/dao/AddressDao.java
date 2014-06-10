package com.sr.biz.freightbit.common.dao;

import com.sr.biz.freightbit.common.entity.Address;

import java.util.List;

/**
 * Created by Solutions Resource on 5/28/14.
 */
public interface AddressDao {

    public void addAddress(Address address);

    public void deleteAddress(Address address);

    public List<Address> findAllAddress(Integer addressId);

    public List<Address> findAllAddressByClientId(Integer clientId);

    public Address findAddressById(Integer addressId);

    public void updateAddress(Address address);

    public List <Address> findContactByReferenceTableAndId(String referenceTable, Integer referenceId);

}
