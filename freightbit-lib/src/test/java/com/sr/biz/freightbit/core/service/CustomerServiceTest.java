//package com.sr.biz.freightbit.core.service;
//
///**
// * Created by ADMIN on 5/13/14.
// */
//
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
//import com.sr.biz.freightbit.core.dao.CustomerDao;
//import com.sr.biz.freightbit.core.entity.Client;
//import com.sr.biz.freightbit.core.entity.Customer;
//import com.sr.biz.freightbit.core.exceptions.CustomerAlreadyExistsException;
//import com.sr.biz.freightbit.core.service.impl.CustomerServiceImpl;
//import org.junit.Assert;
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.mockito.InjectMocks;
//import org.mockito.Mock;
//import org.mockito.Mockito;
//import org.mockito.MockitoAnnotations;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//@ContextConfiguration(locations = {"classpath:/conf/applicationContext-lib.xml"})
//@RunWith(SpringJUnit4ClassRunner.class)
//public class CustomerServiceTest {
//
//    @Mock
//    private CustomerDao customerDao;
//
//    @InjectMocks
//    private CustomerServiceImpl customerService;
//
//    @Before
//    public void setUp() throws Exception{
//        MockitoAnnotations.initMocks(this);
//    }
//
//    @Test(expected=CustomerAlreadyExistsException.class)
//    public void testAddExistingCustomer(){
//
//        Customer customer = initCustomer();
//
//        Mockito.when(customerDao.findCustomerByName("admin")).thenReturn(new ArrayList<Customer>());
//        customerService.addCustomer(customer);
//
//    }
//    public void addCustomer(){
//        Customer customer = initCustomer();
//
//        customerDao.addCustomer(customer);
//    }
//    @Test
//    public void testFindAllCustomers(){
//        long clientId = 1L;
//        List <Customer> customers = new ArrayList<>();
//        customers.add(initCustomer());
//
//        Mockito.when(customerDao.findCustomerByClientId(clientId)).thenReturn(customers);
//        List<Customer> results = customerService.findCustomerByClientId(clientId);
//        Assert.assertEquals(1, results.size());
//
//    }
//
//    @Test
//    public void testFindAllCustomerByClientId(){
//        long clientId = 1L;
//
//        List<Customer> customers = new ArrayList<>();
//        customers.add(initCustomer());
//        Mockito.when(customerDao.findAllCustomer()).thenReturn(customers);
//
//        List<Customer> results = customerService.findCustomerByClientId(clientId);
//        Assert.assertEquals(customers.size(), 1);
//
//    }
//
//    private Customer initCustomer(){
//
//        Client client = new Client("Ernest", new Date(), "Juno", new Date(), "Juno");
//        Customer customer = new Customer();
//        customer.setCustomerId(13L);
//        customer.setClient(client);
//        customer.setCustomerCode("afafa");
//        customer.setCustomerName("abasd");
//        customer.setCustomerType("aaa");
//        customer.setWebsite("test.com");
//        customer.setPhone("12324");
//        customer.setMobile("23541");
//        customer.setFax("efaefa1231f");
//        customer.setEmail("tes@testing.com");
//        customer.setDti(true);
//        customer.setMayorsPermit(true);
//        customer.setAaf(true);
//        customer.setSignatureCard(true);
//        customer.setCreatedTime("10:00 PM");
//        customer.setCreatedBy("admin");
//        customer.setModifiedTimeStamp("11:00 AM");
//        customer.setModifiedBy("admin");
//        return customer;
//    }
//}
