package com.sr.biz.freightbit.order.service;

import com.sr.biz.freightbit.common.entity.Address;
import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.core.exceptions.ContactAlreadyExistsException;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.entity.Items;
import com.sr.biz.freightbit.customer.exceptions.CustomerAlreadyExistsException;
import com.sr.biz.freightbit.operations.entity.OrderStatusLogs;
import com.sr.biz.freightbit.order.entity.Counter;
import com.sr.biz.freightbit.order.entity.OrderItems;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.vendor.entity.Trucks;

import java.util.List;

public interface OrderService {

    public void addOrder(Orders orders);

    public void deleteOrder(Orders orders);

    public void updateOrder(Orders orders);

    public void updateItemListing(OrderItems orderItems);

    public List<Orders> findAllOrders();

    public List<Orders> findAllOrdersByClientId(Integer clientId);

    public Orders findOrdersById(Integer orderId);

    public OrderItems findOrderItemByOrderId(Integer orderId);

    public Orders findOrdersByOrderNumber(String orderNumber);

    public List<Orders> findOrdersByBookingNumber(String column, String value, Integer clientId);

    public List<Orders> findOrdersByCriteria(String column, String value, Integer clientId);

    public List<Orders> findOrdersByCriteriaOnGoing(String column, String value, Integer clientId);

    public List<Orders> findOrdersByLCLAndDestination(String serviceRequirement, String destinationPort);

    public void updateOrderDate(Orders orders);

    public Integer addCustomer(Customer customer) throws CustomerAlreadyExistsException;

    public void deleteCustomer(Customer customer);

    public void updateCustomer(Customer customer);

    public List<Customer> findAllCustomer();

    public Customer findCustomerById(Integer id);

    public List<Customer> findCustomerByClientId(Integer clientId);

    public List<Customer> findCustomersByCriteria(String column, String value, Integer clientId);

    public Contacts findContactById(Integer contactId);

    public List<Orders> findContactInBooking(Integer shipperContactId);

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

    public List<Orders> findAddressInBooking(Integer shipperAddressId);

    public List<Address> findAddressByRefIdAndType(String addressType, Integer customerId);

    public void addItem(OrderItems orderItems);

    public void deleteItem(OrderItems orderItems);

    public List<Items> findAllItems(Integer customerItemsId);

    public List<Items> findAllItemsByClientId(Integer clientId);

    public List<Items> findUserByItemName(String itemName);

    public OrderItems findOrderItemByOrderItemId(Integer orderItemId);

    public List<Items> findItemByCustomerId(Integer customerId);

    public void updateItems(Items items);

    public List<OrderItems> findAllItemByOrderId(Integer orderId);

    public List<OrderItems> findOrderItemByName(String nameSize);

    public String findNextBookingNo(Integer clientId, String companyCode);

    public void addCounterType(Counter counter);

    public List<Orders> findCustomerWithBooking (Integer customerId);

    public List<Orders> findConsigneeInBooking (Integer consigneeContactId);

    public List<Orders> findConsigneeContactInBooking (Integer consigneeContactPersonId);

    public List<Orders> findAllOrdersByAging(Integer aging);

    public List<OrderItems> findAllOrdersByOrderIdAndDestination(Integer orderId, String destinationPort);

    public List<OrderItems> findAllOrderItemLCL();

    public List<OrderItems> findAllOrderItemsByContainerId(Integer containerId);

    public Trucks findOrderItemsByPlateNumber(String plateNumber);
}

