package com.sr.biz.freightbit.core.service;

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

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sr.biz.freightbit.core.dao.DriverDao;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.core.exceptions.DriverAlreadyExistsException;
import com.sr.biz.freightbit.core.service.impl.DriverServiceImpl;
import com.sr.biz.freightbit.vendor.entity.Driver;

@ContextConfiguration(locations = {"classpath:/conf/applicationContext-lib.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class DriverServiceTest {

    @Mock
    private DriverDao driverDao;

    @InjectMocks
    private DriverServiceImpl driverService;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Test(expected=DriverAlreadyExistsException.class)
    public void testAddExistingDriver() {
        Driver driver = initDriver();
        List<Driver> existingDriverList = new ArrayList<>();
        existingDriverList.add(driver);

        Mockito.when(driverDao.findDriverByLastName("Go")).thenReturn(existingDriverList);
        driverService.addDriver(driver);
    }

    @Test
    public void testFindAllDriversByClientId() {
        Integer clientId = 1;
        List <Driver> drivers = new ArrayList();
        drivers.add(initDriver());

        Mockito.when(driverDao.findAllDrivers()).thenReturn(drivers);
        List<Driver> results = driverService.findAllDriversByClientId(clientId);
        Assert.assertEquals(drivers.size(), 1);
    }

    @Test
    public void testFindAllDrivers() {
        Integer clientId = 1;
        List <Driver> drivers = new ArrayList();
        drivers.add(initDriver());


    }

    private Driver initDriver() {
        Client client = new Client("Ernest", new Date(), "JMX", new Date(), "JMX");

        Driver driver = new Driver();
        driver.setClient(client);
        driver.setDateHired(new Date());
        driver.setDriverCode("DC1");
        driver.setLicenseNumber("ABC");
        driver.setFirstName("John Michael");
        driver.setMiddleName("Castor");
        driver.setLastName("Go");
        driver.setTitle("Driver");
        driver.setStatus("active");
        driver.setCreatedBy("anonymous");
        driver.setModifiedBy("anonymous2");
        driver.setCreatedTimestamp(new Date());
        driver.setDateTerminated(new Date());
        driver.setModifiedTimestamp(new Date());

        return driver;
    }

}
