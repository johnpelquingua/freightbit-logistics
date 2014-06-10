package com.sr.biz.freightbit.customer.service.impl;

import com.sr.biz.freightbit.common.dao.AddressDao;
import com.sr.biz.freightbit.common.dao.ContactsDao;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.exceptions.ContactAlreadyExistsException;
import com.sr.biz.freightbit.customer.exceptions.CustomerAlreadyExistsException;
import com.sr.biz.freightbit.customer.exceptions.ItemAlreadyExistsException;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.customer.dao.CustomerDao;
import com.sr.biz.freightbit.customer.dao.ItemsDao;
import com.sr.biz.freightbit.customer.dao.RatesDao;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.entity.Items;
import com.sr.biz.freightbit.customer.entity.Rates;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ADMIN on 5/13/14.
 */
public class CustomerServiceImpl implements CustomerService {

    CustomerDao customerDao;

    public CustomerDao getCustomerDao() {
        return customerDao;
    }
    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

    private ItemsDao itemsDao;
    public ItemsDao getItemsDao() { return itemsDao; }
    public void setItemsDao(ItemsDao itemsDao) { this.itemsDao = itemsDao; }


    private AddressDao addressDao;
    public AddressDao getAddressDao() { return addressDao; }
    public void setAddressDao(AddressDao addressDao) { this.addressDao = addressDao; }

    private RatesDao ratesDao;
    public RatesDao getRatesDao() { return ratesDao; }
    public void setRatesDao(RatesDao ratesDao) {
        this.ratesDao = ratesDao;
    }

    private ContactsDao contactsDao;
    public void setContactsDao(ContactsDao contactsDao) {
        this.contactsDao = contactsDao;
    }


    //Consignee

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addConsignee(Contacts contact, Address address) {
            addressDao.addAddress(address);
            contactsDao.addContact(contact);

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteConsignee(Contacts contact, Address address) {
        addressDao.deleteAddress(address);
        contactsDao.deleteContact(contact);

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateConsignee(Contacts contact, Address address) {
        contactsDao.updateContact(contact);
        addressDao.updateAddress(address);
    }


    //end of Consignee


    //Contacts

    @Override
    public Contacts findContactById(long contactId) {
        return contactsDao.findContactById(contactId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addContact(Contacts contacts) throws ContactAlreadyExistsException {
        if (contactsDao.findContactById(contacts.getContactId()) != null) {
            throw new ContactAlreadyExistsException(contacts.getContactId());
        } else {
            contactsDao.addContact(contacts);
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteContact(Contacts contacts) {
        contactsDao.deleteContact(contacts);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateContact(Contacts contacts) {
        contactsDao.updateContact(contacts);
    }

    @Override
    public List<Contacts> findAllContacts(long clientId) {
        List<Contacts> contacts =contactsDao.findAllContacts(clientId);
        return contacts;
    }
    
    @Override
    public List <Contacts> findContactByRefIdAndType(String contactType, Integer customerId) {
    	return contactsDao.findContactByRefTableAndIdAndType("CUSTOMERS", customerId, contactType);
    }

//    @Override
//    public List<Contacts> findAllContactsByClientId(long clientId){
//        return contactsDao.findAllContactsByClientId(clientId);
//    }

    //end of Contacts



    //Address

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
    public List<Address> findAllAddressByClientId(Integer clientId) {
        return addressDao.findAllAddressByClientId(clientId);
    }

//    @Override
//    public List<Address> findAllAddress(Integer addressId) {
//        List<Address> address = addressDao.findAllAddress(addressId);
//        return address;
//    }


    @Override
    public Address findAddressById(Integer addressId) {
        return addressDao.findAddressById(addressId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateAddress(Address address) {
        addressDao.updateAddress(address);
    }
    
    @Override
    public List <Address> findAddressByRefIdAndType(String addressType, Integer customerId) {
    	return addressDao.findAddressByRefTableAndIdAndType("CUSTOMERS", customerId, addressType);
    }

    //End of Address



    //Rates

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addRate(Rates rate) {
            ratesDao.addRate(rate);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteRate(Rates rate) {
        ratesDao.deleteRate(rate);
    }

    @Override
    public List<Rates> findAllRatesByClientId(Integer clientId) {
        return ratesDao.findAllRatesByClientId(clientId);
    }

    @Override
    public List<Rates> findAllRatesByRatesId(Integer customerRateId) {
        return ratesDao.findAllRatesByRatesId(customerRateId);
    }


    @Override
    public List<Rates> findAllRates(Integer customerRateId) {
        List<Rates> rates = ratesDao.findAllRates(customerRateId);
        return rates;
    }

    @Override
    public Rates findRateById(Integer customerRateId) {
        return ratesDao.findRateById(customerRateId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateRate(Rates rates) {
        ratesDao.updateRate(rates);
    }

    //End of Rates


    //Items

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addItem(Items items) throws ItemAlreadyExistsException {
        if(itemsDao.findUserByItemName(items.getItemName()).size() > 0)
            throw new ItemAlreadyExistsException(items.getItemName());
        else
            itemsDao.addItems(items);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteItem(Items items) {
        itemsDao.deleteItems(items);
    }

    @Override
    public List<Items> findAllItems(Integer customerItemsId) {
        return itemsDao.findAllItems(customerItemsId);
    }

    @Override
    public List<Items> findAllItemsByClientId(Integer clientId){
        return itemsDao.findAllItemsByClientId(clientId);

    }

    @Override
    public List<Items> findUserByItemName(String itemName) {
        List<Items> result = itemsDao.findUserByItemName(itemName);
        return result;
    }

    @Override
    public Items findItemByCustomerItemsId(Integer customerItemsId) {
        return itemsDao.findItemByCustomerItemsId(customerItemsId);
    }


    @Override
    public List<Items> findItemByCustomerId(Integer customerId){
        List<Items> result = itemsDao.findItemByCustomerId(customerId);
        return result;
    }
    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateItems(Items items) {
        itemsDao.updateItems(items);
    }

    //End of Items



    //Customer

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Integer addCustomer(Customer customer) throws CustomerAlreadyExistsException{

        if (customerDao.findCustomerByName(customer.getCustomerName()).size() > 0)
            throw new CustomerAlreadyExistsException(customer.getCustomerName());
        else
           return customerDao.addCustomer(customer);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteCustomer(Customer customer){
        customerDao.deleteCustomer(customer);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateCustomer(Customer customer){
        customerDao.updateCustomer(customer);
    }

    @Override
    public List<Customer> findAllCustomer(Integer clientId){
        List<Customer> customers = customerDao.findAllCustomer(clientId);
        return customers;
    }

    @Override
    public Customer findCustomerById(Integer id){
        return customerDao.findCustomerById(id);
    }

    @Override
    public List<Customer> findCustomerByClientId(Integer clientId){
        return customerDao.findCustomerByClientId(clientId);
    }

    public List<Customer> findCustomerByName(String customer){
        List<Customer> result = customerDao.findCustomerByName(customer);
        if(result != null && !result.isEmpty())
            return result;
        return null;
    }

    public List<Customer> findCustomerByType(String customer){
        List<Customer> result = customerDao.findCustomerByType(customer);
        if(result != null && !result.isEmpty())
            return result;
        return null;
    }


    public Customer findCustomerByEmail(String customer){
        return customerDao.findCustomerByEmail(customer);
    }

    @Override
    public List<Customer> findCustomersByCriteria(String column, String value, Integer clientId) {
    	return customerDao.findCustomersByCriteria(column, value, clientId);
    }

    //End Of Customer

}
