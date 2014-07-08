package com.sr.biz.freightbit.order.service;

import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.core.exceptions.ContactAlreadyExistsException;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.entity.Items;
import com.sr.biz.freightbit.customer.exceptions.CustomerAlreadyExistsException;
import com.sr.biz.freightbit.customer.exceptions.ItemAlreadyExistsException;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.List;

/**
 * Created by JMXPSX on 5/27/14.
 */
public interface OrderService {

    public void addOrder(Orders orders);

    public void deleteOrder(Orders orders);

    public void updateOrder(Orders orders);

    public List<Orders> findAllOrders();

    public List<Orders> findAllOrdersByClientId(Integer clientId);

    public Orders findOrdersById(Integer orderId);

    public Orders findOrdersByOrderNumber(Integer orderNumber);

    public List<Orders> findOrdersByCriteria(String column, String value, Integer clientId);

    public void updateOrderDate(Orders orders);

    public Integer addCustomer(Customer customer) throws CustomerAlreadyExistsException;

    public void deleteCustomer(Customer customer);

    public void updateCustomer(Customer customer);

    public List<Customer> findAllCustomer();

    public Customer findCustomerById(Integer id);

    public List<Customer> findCustomerByClientId(Integer clientId);

    public List<Customer> findCustomersByCriteria(String column, String value, Integer clientId);

    public Contacts findContactById(Integer contactId);

    public void addContact(Contacts contacts) throws ContactAlreadyExistsException;

    public void deleteContact(Contacts contacts);

    public void updateContact(Contacts contacts);

    public List<Contacts> findAllContacts();

    public Address findAddressByRefId(Integer customerId);

    public void addAddress(Address address);

    public void deleteAddress(Address address);

    public void updateAddress(Address address);

    public List<Address> findAllAddressByClientId(Integer clientId);

    public Address findAddressById(Integer addressId);

    public List<Address> findAddressByRefIdAndType(String addressType, Integer customerId);

    public void addItem(Items items) throws ItemAlreadyExistsException;

    public void deleteItem(Items items);

    public List<Items> findAllItems(Integer customerItemsId);

    public List<Items> findAllItemsByClientId(Integer clientId);

    public List<Items> findUserByItemName(String itemName);

    public Items findItemByCustomerItemsId(Integer customerItemsId);

    public List<Items> findItemByCustomerId(Integer customerId);

    public void updateItems(Items items);

    public List<OrderItems> findAllItemByOrderId(Integer orderId);

}

