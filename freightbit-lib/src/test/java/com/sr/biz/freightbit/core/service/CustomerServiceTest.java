package com.sr.biz.freightbit.core.service;

/**
* Created by ADMIN on 5/13/14.
*/

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sr.biz.freightbit.core.dao.CustomerDao;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.entity.Customer;
import com.sr.biz.freightbit.core.exceptions.CustomerAlreadyExistsException;
import com.sr.biz.freightbit.core.service.impl.CustomerServiceImpl;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;

import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.MockitoAnnotations.Mock;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ContextConfiguration(locations = {"classpath:/conf/applicationContext-lib.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class CustomerServiceTest {

    @Mock
    private CustomerDao customerDao;

    @InjectMocks
    private CustomerServiceImpl customerService;

    @Before
    public void setUp() throws Exception{
        MockitoAnnotations.initMocks(this);
    }

    @Test(expected=CustomerAlreadyExistsException.class)
    public void testAddExistingCustomer(){

        Customer customer = initCustomer();
        List<Customer> existingCustomerList = new ArrayList<Customer>();
        existingCustomerList.add(customer);

        Mockito.when(customerDao.findCustomerByName("admin")).thenReturn(new ArrayList<Customer>());
        customerService.addCustomer(customer);

    }
    public void addCustomer(){
        Customer customer = initCustomer();

        customerDao.addCustomer(customer);
    }
    @Test
    public void testFindAllCustomers(){
        Integer clientId = 1;
        List <Customer> customers = new ArrayList<>();
        customers.add(initCustomer());

        Mockito.when(customerDao.findCustomerByClientId(clientId)).thenReturn(customers);
        List<Customer> results = customerService.findCustomerByClientId(clientId);
        Assert.assertEquals(1, results.size());

    }

    @Test
    public void testFindAllCustomerByClientId(){
        Integer clientId = 1;

        List<Customer> customers = new ArrayList<>();
        customers.add(initCustomer());
        Mockito.when(customerDao.findAllCustomer(clientId)).thenReturn(customers);

        List<Customer> results = customerService.findCustomerByClientId(clientId);
        Assert.assertEquals(customers.size(), 1);

    }

    private Customer initCustomer(){

        Client client = new Client("Ernest", new Date(), "Juno", new Date(), "Juno");
        Customer customer = new Customer();
        customer.setCustomerId(13);
        customer.setClient(client);
        customer.setCustomerCode("afafa");
        customer.setCustomerName("abasd");
        customer.setCustomerType("aaa");
        customer.setWebsite("test.com");
        customer.setPhone("12324");
        customer.setMobile("23541");
        customer.setFax("efaefa1231f");
        customer.setEmail("tes@testing.com");
        customer.setDti(1);
        customer.setMayorsPermit(1);
        customer.setAaf(1);
        customer.setSignatureCard(1);
        customer.setCreatedTimestamp(new Date());
        customer.setCreatedBy("admin");
        customer.setModifiedTimestamp(new Date());
        customer.setModifiedBy("admin");
        return customer;
    }
}
