package com.sr.biz.freightbit.common.dao;

import com.sr.biz.freightbit.common.entity.Address;

import java.util.List;
import java.util.Map;

/**
 * Created by Solutions Resource on 5/28/14.
 */
public interface AddressDao {

    public void addAddress(Address address);

    public void deleteAddress(Address address);

    public void updateAddress(Address address);

    public List<Address> findAllAddress(Integer addressId);

    public List<Address> findAllAddressByClientId(Integer clientId);

    public List<Address> findAllAddressByRefId(Integer referenceId);

    public Address findAddressById(Integer addressId);

    public List<Address> findAddressInBooking(Integer addressId);

    public Address findAddressByRefId(Integer contactId);

    public Address findContactByReferenceTableAndId(String referenceTable, Integer referenceId);

    public List<Address> findAddressByRefTableAndIdAndType(String referenceTable, Integer referenceId, String addressType);

    public List<Address> findAddressByShipper(String referenceTable, Integer referenceId, String addressType);

    public List<Address> findAddressesByParameterMap(Map<String, Object> paramMap,
                                                     String entity);

}
