package com.sr.biz.freightbit.order.service.impl;

import com.sr.biz.freightbit.common.dao.AddressDao;
import com.sr.biz.freightbit.common.dao.ContactsDao;
import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.core.exceptions.ContactAlreadyExistsException;
import com.sr.biz.freightbit.core.exceptions.OrderAlreadyExistsException;
import com.sr.biz.freightbit.customer.dao.CustomerDao;
import com.sr.biz.freightbit.customer.dao.ItemsDao;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.entity.Items;
import com.sr.biz.freightbit.customer.exceptions.CustomerAlreadyExistsException;
import com.sr.biz.freightbit.operations.entity.OrderStatusLogs;
import com.sr.biz.freightbit.order.dao.OrderDao;
import com.sr.biz.freightbit.order.dao.OrderItemsDao;
import com.sr.biz.freightbit.order.entity.Counter;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.order.service.OrderService;
import com.sr.biz.freightbit.vendor.dao.TrucksDao;
import com.sr.biz.freightbit.vendor.entity.Trucks;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

public class OrderServiceImpl implements OrderService {

    private OrderDao orderDao;
    private OrderItemsDao orderItemsDao;
    private CustomerDao customerDao;
    private ContactsDao contactsDao;
    private AddressDao addressDao;
    private ItemsDao itemsDao;
    private TrucksDao trucksDao;

    public void setOrderItemsDao(OrderItemsDao orderItemsDao) {
        this.orderItemsDao = orderItemsDao;
    }

    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

    public void setContactsDao(ContactsDao contactsDao) {
        this.contactsDao = contactsDao;
    }

    public void setAddressDao(AddressDao addressDao) {
        this.addressDao = addressDao;
    }

    public void setItemsDao(ItemsDao itemsDao) {
        this.itemsDao = itemsDao;
    }

    // Orders
    @Override
     @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
     public void addOrder(Orders orders) {
/*        if (orderDao.findOrdersByOrderNumber(orders.getOrderNumber())!=null)
            throw new OrderAlreadyExistsException(orders.getOrderNumber());
        else*/
        orderDao.addOrder(orders);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteOrder(Orders orders) {
        orderDao.deleteOrder(orders);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateOrder(Orders orders) {
        if (orderDao.findDuplicateOrderByOrderCode(orders.getOrderNumber(), orders.getOrderId()).size() > 0)
            throw new OrderAlreadyExistsException(orders.getOrderNumber());
        else
            orderDao.updateOrder(orders);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateItemListing(OrderItems orderItems) {
        orderDao.updateOrderItems(orderItems);
    }

    @Override
    public List<Orders> findAllOrders() {
        List<Orders> orders = orderDao.findAllOrders();
        return orders;
    }

    @Override
    public List<Orders> findAllOrdersByClientId(Integer clientId) {
        return orderDao.findAllOrdersByClientId(clientId);
    }

    @Override
    public List<Orders> findAllOrdersByAging(Integer aging) {
        return orderDao.findAllOrdersByAging(aging);    }

    @Override
    public Trucks findOrderItemsByPlateNumber(String plateNumber) {
        List<Trucks> result = trucksDao.findOrderItemsByPlateNumber(plateNumber);
        if (result != null && !result.isEmpty())
            return result.get(0);
        return null;
    }

    @Override
    public List<OrderItems> findAllOrdersByOrderIdAndDestination(Integer orderId, String destinationPort) {
        return orderDao.findAllOrdersByOrderIdAndDestination(orderId, destinationPort);    }


    @Override
    public Orders findOrdersById(Integer orderId) {
        return orderDao.findOrdersById(orderId);
    }

    @Override
    public OrderItems findOrderItemByOrderId(Integer orderId) {
        return orderDao.findOrderItemByOrderId(orderId);    }

    @Override
    public Orders findOrdersByOrderNumber(String orderNumber) {
        List<Orders> result = orderDao.findOrdersByOrderNumber(orderNumber);
        if (result != null && !result.isEmpty())
            return result.get(0);
        return null;
    }

    @Override
    public void updateOrderDate(Orders orders) {
        orders.setOrderDate(new Date());
        orderDao.updateOrder(orders);
    }

// End Orders

// Customers

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Integer addCustomer(Customer customer) throws CustomerAlreadyExistsException {

        if (customerDao.findCustomerByName(customer.getCustomerName()).size() > 0)
            throw new CustomerAlreadyExistsException(customer.getCustomerName());
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
    public void updateCustomer(Customer customer) {
        customerDao.updateCustomer(customer);
    }

    @Override
    public List<Customer> findAllCustomer() {
        List<Customer> customers = customerDao.findAllCustomer();
        return customers;
    }

    @Override
    public Customer findCustomerById(Integer id) {
        return customerDao.findCustomerById(id);
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
    public List<Orders> findOrdersByCriteria(String column, String value, Integer clientId){
        return orderDao.findOrdersByCriteria(column, value, clientId);
    }

    @Override
    public List<Orders> findOrdersByBookingNumber(String column, String value, Integer clientId, String serviceRequirement) {
        return orderDao.findOrdersByBookingNumber(column, value, clientId, serviceRequirement);
    }

    @Override
    public List<Orders> findOrdersByCriteriaOnGoing(String column, String value, Integer clientId){
        return orderDao.findOrdersByCriteriaOnGoing(column, value, clientId);
    }

    @Override
    public List<Orders> findOrdersByLCLAndDestination(String serviceRequirement, String destinationPort){
        return orderDao.findOrdersByLCLAndDestination(serviceRequirement, destinationPort);
    }

    // End Customers

// Contacts

    @Override
    public Contacts findContactById(Integer contactId) {
        return contactsDao.findContactById(contactId);
    }

    @Override
    public List<Orders> findContactInBooking(Integer shipperContactId) {
        List<Orders> result = orderDao.findContactInBooking(shipperContactId);
        return result;
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
    public List<Contacts> findAllContacts() {
        List<Contacts> contacts = contactsDao.findAllContacts();
        return contacts;
    }


// End Contacts


// Address

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
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void updateAddress(Address address) {
        addressDao.updateAddress(address);
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
    public List<Orders> findAddressInBooking(Integer shipperAddressId) {
        List<Orders> result = orderDao.findAddressInBooking(shipperAddressId);
        return result;
    }

    @Override
    public List<Address> findAddressByRefIdAndType(String addressType, Integer customerId) {
        return addressDao.findAddressByRefTableAndIdAndType("CUSTOMERS", customerId, addressType);
    }


// End Address


// Items

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addItem(OrderItems orderItems) {
       /* if (itemsDao.findUserByItemName(items.getItemName()).size() > 0)
            throw new ItemAlreadyExistsException(items.getItemName());
        else
            itemsDao.addItems(items);*/
        orderItemsDao.addItems(orderItems);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteItem(OrderItems orderItems) {
        /*itemsDao.deleteItems(items);*/
        orderItemsDao.deleteItem(orderItems);
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
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public OrderItems findOrderItemByOrderItemId(Integer orderItemId) {
        /*return itemsDao.findItemByCustomerItemsId(customerItemsId);*/
        return orderItemsDao.findOrderItemByOrderItemId(orderItemId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public OrderItems findOrderItemByCode(String nameSize) {
        return orderItemsDao.findOrderItemByCode(nameSize);
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


    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<OrderItems> findAllItemByOrderId(Integer orderId) {
        return orderItemsDao.findAllItemByOrderId(orderId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<OrderItems> findOrderItemByName(String nameSize) {
        return orderItemsDao.findOrderItemByName(nameSize);
    }


    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<OrderItems> findAllOrderItemLCL() {
        return orderItemsDao.findAllOrderItemLCL();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<OrderItems> findAllOrderItemsByContainerId(Integer containerId) {
        return orderItemsDao.findAllOrderItemsByContainerId(containerId);
    }

    /**
     * @param clientId
     * @companyCode companyCode 3-character companyCode (eg., NTY, MTY)
     * @return next booking no. Eg, NTY-0007, MTY-0000
     */

    @Override
    public String findNextBookingNo(Integer clientId, String companyCode) {
        Integer nextBookingNo = orderDao.findNextBookingNo(clientId, companyCode);
        String nextBookingNoAsStr = nextBookingNo.toString();
        int zerosToAdd = 4 - nextBookingNoAsStr.length();
        if (zerosToAdd == 3)
            return companyCode + "-000" + nextBookingNoAsStr;
        else if (zerosToAdd == 2)
            return companyCode + "-00" + nextBookingNoAsStr;
        else if (zerosToAdd == 1)
            return companyCode + "-0" + nextBookingNoAsStr;
        else
            return companyCode + "-" + nextBookingNoAsStr;
    }

// End Items


    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addCounterType(Counter counter) {
        orderDao.addCounterType(counter);
    }

    @Override
    public List<Orders> findCustomerWithBooking(Integer customerId) {
        List<Orders> result = orderDao.findCustomerWithBooking(customerId);
        return result;
    }

    @Override
    public List<Orders> findConsigneeInBooking(Integer consigneeContactId) {
        List<Orders> result = orderDao.findConsigneeInBooking(consigneeContactId);
        return result;
    }

    @Override
    public List<Orders> findConsigneeContactInBooking(Integer consigneeContactPersonId) {
        List<Orders> result = orderDao.findConsigneeContactInBooking(consigneeContactPersonId);
        return result;
    }

}
