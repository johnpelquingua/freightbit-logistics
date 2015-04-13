package com.sr.biz.freightbit.customer.dao;

/**
 * Created by Jimmy on 5/13/14.
 */

import com.sr.biz.freightbit.common.entity.Contacts;
import com.sr.biz.freightbit.customer.entity.Customer;
import com.sr.biz.freightbit.customer.entity.Items;

import java.util.List;

public interface CustomerDao {

    public Integer addCustomer(Customer customer);

    public void deleteCustomer(Customer customer);

    public void updateCustomer(Customer customer);

    public List<Customer> findAllCustomer();

    public List<Items> findAllItemsInTable();

    public Customer findCustomerById(Integer customerId);

    public List<Customer> findCustomerByClientId(Integer clientId);

    public List<Customer> findCustomerByName(String customer);

    public List<Customer> findCustomerByType(String customer);

    public Customer findCustomerByEmail(String customer);

    public List<Customer> findCustomersByCriteria(String column, String value, Integer clientId);

    public List<Contacts> findConsigneeByCriteria(String column, String value, Integer clientId);

    public List<Customer> findCustomerByCustomerCode(String customerCode);

    public List<Customer> findDuplicateCustomerByCodeAndId(String customerCode, Integer customerId);


}