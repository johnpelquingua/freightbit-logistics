package com.sr.biz.freightbit.core.dao;

/**
 * Created by Jimmy on 5/13/14.
 */

import java.util.List;
import com.sr.biz.freightbit.core.entity.Customer;

public interface CustomerDao {

    public void addCustomer(Customer customer);

    public void deleteCustomer(Customer customer);

    public void updateCustomer(Customer customer);

    public List<Customer> findAllCustomer(Integer clientId);

    public Customer findCustomerById(Integer id);

    public List<Customer> findCustomerByClientId(Integer clientId);

    public List<Customer> findCustomerByName(String customer);
}