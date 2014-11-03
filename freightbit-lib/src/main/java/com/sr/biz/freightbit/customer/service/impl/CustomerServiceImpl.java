package com.sr.biz.freightbit.customer.service.impl;

import com.sr.biz.freightbit.common.dao.AddressDao;
import com.sr.biz.freightbit.common.dao.ContactsDao;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.core.exceptions.ContactAlreadyExistsException;
import com.sr.biz.freightbit.customer.dao.CustomerDao;
import com.sr.biz.freightbit.customer.dao.ItemsDao;
import com.sr.biz.freightbit.customer.dao.RatesDao;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.entity.Items;
import com.sr.biz.freightbit.customer.entity.Rates;
import com.sr.biz.freightbit.customer.exceptions.CustomerAlreadyExistsException;
import com.sr.biz.freightbit.customer.exceptions.ItemAlreadyExistsException;
import com.sr.biz.freightbit.customer.service.CustomerService;
import com.sr.biz.freightbit.order.dao.OrderDao;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ADMIN on 5/13/14.
 */
public class CustomerServiceImpl implements CustomerService {

    private CustomerDao customerDao;
    private ItemsDao itemsDao;
    private AddressDao addressDao;
    private RatesDao ratesDao;
    private ContactsDao contactsDao;
    private OrderDao orderDao;


    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

    public void setItemsDao(ItemsDao itemsDao) {
        this.itemsDao = itemsDao;
    }

    public void setAddressDao(AddressDao addressDao) {
        this.addressDao = addressDao;
    }

    public void setRatesDao(RatesDao ratesDao) {
        this.ratesDao = ratesDao;
    }

    public void setContactsDao(ContactsDao contactsDao) {
        this.contactsDao = contactsDao;
    }

    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }
    //Consignee

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addConsignee(Contacts contact, Address address) {
        Integer contactId = contactsDao.addContact(contact);
        address.setContactReferenceId(contactId);
        addressDao.addAddress(address);
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
    public void updateContact(Contacts contacts) throws ContactAlreadyExistsException{
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

    /*@Override
    public List<Contacts> findContactsByCustomerId(Integer customerId) {
        List<Contacts> contacts = contactsDao.findContactsByCustomerId(customerId);
        return contacts;
    }*/

    @Override
    public List<Contacts> findContactByRefIdAndType(String contactType, Integer customerId) {
        return contactsDao.findContactByRefTableAndIdAndType("CUSTOMERS", customerId, contactType);
    }


    @Override
    public List<Contacts> findContactByParameterMap(Integer referenceId, String contactType, Integer clientId) {
        List<Contacts> contacts = new ArrayList<Contacts>();
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("referenceTable", "CUSTOMERS");
        paramMap.put("referenceId", referenceId);
        paramMap.put("contactType", contactType);
        paramMap.put("clientId", clientId);
        contacts = contactsDao.findContactsByParameterMap(paramMap, "Contacts");
        return contacts;
    }

    @Override
    public List<Contacts> findContactByConsignee(Integer referenceId, String contactType, Integer clientId) {
        List<Contacts> contacts = new ArrayList<Contacts>();
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("referenceTable", "CONTACTS");
        paramMap.put("referenceId", referenceId);
        paramMap.put("contactType", contactType);
        paramMap.put("clientId", clientId);
        contacts = contactsDao.findContactsByParameterMap(paramMap, "Contacts");
        return contacts;
    }

    @Override
    public List<Contacts> findContactByReferenceId(Integer customerId) {
        List<Contacts> result = contactsDao.findContactByReferenceId(customerId);
        return result;

    }

    //end of Contacts


    //Address

    @Override
    public List<Address> findAllAddressByRefId(Integer customerId) {
        return addressDao.findAllAddressByRefId(customerId);
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
    public List<Address> findAllAddressByClientId(Integer clientId) {
        return addressDao.findAllAddressByClientId(clientId);
    }

    @Override
    public List<Address> findAddressByParameterMap(Integer referenceId, String addressType, Integer clientId) {
        List<Address> addresses = new ArrayList<Address>();
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("referenceTable", "CUSTOMERS");
        paramMap.put("referenceId", referenceId);
        paramMap.put("addressType", addressType);
        paramMap.put("clientId", clientId);
        addresses = addressDao.findAddressesByParameterMap(paramMap, "Address");
        return addresses;
    }

    @Override
    public Address findAddressByParameterMap(Integer referenceId, String addressType, Integer clientId, Integer contactId) {
        List<Address> addresses = new ArrayList<Address>();
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("referenceTable", "CUSTOMERS");
        paramMap.put("referenceId", referenceId);
        paramMap.put("addressType", addressType);
        paramMap.put("clientId", clientId);
        paramMap.put("contactReferenceId", contactId);
        addresses = addressDao.findAddressesByParameterMap(paramMap, "Address");
        if (addresses != null && addresses.size() > 0)
            return addresses.get(0);
        else
            return null;
    }


    @Override
    public Address findAddressById(Integer addressId) {
        return addressDao.findAddressById(addressId);
    }

    @Override
    public Address findAddressByRefId(Integer contactId) {
        return addressDao.findAddressByRefId(contactId);
    }

    @Override
    public List<Address> findAddressByRefIdAndType(String addressType, Integer customerId) {
        return addressDao.findAddressByRefTableAndIdAndType("CUSTOMERS", customerId, addressType);
    }

    @Override
    public List<Address> findAddressByShipper(String addressType, Integer customerId) {
        return addressDao.findAddressByShipper("CUSTOMERS", customerId, addressType);
    }

    @Override
    public List<Address> findAddressByCriteria(String addressType, Integer customerId) {
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
    public List<Rates> findAllRatesByCustomerId(Integer customerId) {
        return ratesDao.findAllRatesByCustomerId(customerId);
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
        if (itemsDao.findUserByItemName(items.getItemCode()).size() > 0)
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
    public List<Items> findAllItemsByClientId(Integer clientId) {
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
    public List<Items> findItemByCustomerId(Integer customerId) {
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
    public Integer addCustomer(Customer customer) throws CustomerAlreadyExistsException {

        if (customerDao.findCustomerByCustomerCode(customer.getCustomerCode()).size() > 0)
            throw new CustomerAlreadyExistsException(customer.getCustomerCode());
        else
            return customerDao.addCustomer(customer);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteCustomer(Customer customer) {
        customerDao.deleteCustomer(customer);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateCustomer(Customer customer) throws CustomerAlreadyExistsException {
        if (customerDao.findDuplicateCustomerByCodeAndId(customer.getCustomerCode(), customer.getCustomerId()).size() > 0)
            throw new CustomerAlreadyExistsException(customer.getCustomerCode());
        else
            customerDao.updateCustomer(customer);
    }

    @Override
    public List<Customer> findAllCustomer() {
        List<Customer> customers = customerDao.findAllCustomer();
        return customers;
    }

    @Override
    public Customer findCustomerById(Integer customerId) {
        return customerDao.findCustomerById(customerId);
    }

    @Override
    public List<Customer> findCustomerByClientId(Integer clientId) {
        return customerDao.findCustomerByClientId(clientId);
    }

    public List<Customer> findCustomerByName(String customer) {
        List<Customer> result = customerDao.findCustomerByName(customer);
        if (result != null && !result.isEmpty())
            return result;
        return null;
    }

    public List<Customer> findCustomerByType(String customer) {
        List<Customer> result = customerDao.findCustomerByType(customer);
        if (result != null && !result.isEmpty())
            return result;
        return null;
    }


    public Customer findCustomerByEmail(String customer) {
        return customerDao.findCustomerByEmail(customer);
    }

    @Override
    public List<Customer> findCustomersByCriteria(String column, String value, Integer clientId) {
        return customerDao.findCustomersByCriteria(column, value, clientId);
    }

    @Override
    public Customer findCustomerByCustomerCode(String customerCode) {
        List<Customer> result = customerDao.findCustomerByCustomerCode(customerCode);
        if (result != null && !result.isEmpty())
            return result.get(0);
        return null;
    }



    //End Of Customer

}
