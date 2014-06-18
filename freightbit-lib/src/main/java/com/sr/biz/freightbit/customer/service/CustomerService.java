package com.sr.biz.freightbit.customer.service;

/**
 * Created by ADMIN on 5/13/14.
 */

import java.util.List;

import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.core.exceptions.ContactAlreadyExistsException;
import com.sr.biz.freightbit.customer.exceptions.CustomerAlreadyExistsException;
import com.sr.biz.freightbit.customer.exceptions.ItemAlreadyExistsException;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.entity.Items;
import com.sr.biz.freightbit.customer.entity.Rates;

public interface CustomerService {

    //Consignee

    public void addConsignee(Contacts contact, Address address);

    public void deleteConsignee(Contacts contact, Address address);

    public void updateConsignee(Contacts contact, Address address);




    //Contacts Table

    public Contacts findContactById(Integer contactId);

    public void addContact(Contacts contacts) throws ContactAlreadyExistsException;

    public void deleteContact(Contacts contacts);

    public void updateContact(Contacts contacts);

    public List<Contacts> findAllContacts();
    
    public List <Contacts> findContactByRefIdAndType(String contactType, Integer customerId);

//    public List<Contacts> findAllContactsByClientId(long clientId);


    //Address

    public void addAddress(Address address);

    public void deleteAddress(Address address);

    public List<Address> findAllAddressByClientId(Integer clientId);

  // public List<Address> findAllAddress(Integer addressId);

    public Address findAddressById(Integer addressId);

    public Address findAddressByRefId(Integer customerId);

    public void updateAddress(Address address);
    
    public List <Address> findAddressByRefIdAndType(String addressType, Integer customerId);

    //Customer

    public Integer addCustomer(Customer customer) throws CustomerAlreadyExistsException;

    public void deleteCustomer(Customer customer);

    public void updateCustomer(Customer customer);

    public List<Customer> findAllCustomer(Integer clientId);

    public Customer findCustomerById(Integer customerId);

    public List<Customer> findCustomerByClientId(Integer clientId);

    public List<Customer> findCustomerByName(String customer);

    public List<Customer> findCustomerByType(String customer);

    public Customer findCustomerByEmail(String customer);

    public List <Customer> findCustomersByCriteria(String column, String value, Integer clientId);

    //Items

    public void addItem(Items items) throws ItemAlreadyExistsException;

    public void deleteItem(Items items);

    public List<Items> findAllItems(Integer customerItemsId);

    public List<Items> findUserByItemName(String itemName);

    public Items findItemByCustomerItemsId(Integer customerItemsId);

    public void updateItems(Items items);

    public List<Items> findAllItemsByClientId(Integer clientId);

    public List<Items> findItemByCustomerId(Integer customerId);

    //Rates

    public void addRate(Rates rate);

    public void deleteRate(Rates rate);

    public List<Rates> findAllRatesByRatesId(Integer customerRateId);

    public void updateRate(Rates rates);

    public Rates findRateById(Integer customerRateId);

    public List<Rates> findAllRates(Integer customerRateId);

    public List<Rates> findAllRatesByClientId(Integer clientId);

}
