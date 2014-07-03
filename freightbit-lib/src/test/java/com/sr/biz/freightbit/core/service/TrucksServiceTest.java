package com.sr.biz.freightbit.core.service;

import com.sr.biz.freightbit.vendor.dao.TrucksDao;
import com.sr.biz.freightbit.vendor.entity.Trucks;
import com.sr.biz.freightbit.vendor.exceptions.TrucksAlreadyExistsException;
import com.sr.biz.freightbit.vendor.service.impl.TrucksServiceImpl;
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
import java.util.List;

@ContextConfiguration(locations = {"classpath:/conf/applicationContext-lib.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class TrucksServiceTest {

    @Mock
    private TrucksDao trucksDao;

    @InjectMocks
    private TrucksServiceImpl trucksService;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Test(expected = TrucksAlreadyExistsException.class)
    public void testAddExistingTrucks() {

        Trucks trucks = initTrucks();

        Mockito.when(trucksDao.findTrucksByTruckCode("TRUCK")).thenReturn(new ArrayList<Trucks>());
        trucksService.addTrucks(trucks);

    }

    // TODO VENDOR DOMAIN
    @Test
    public void testFindAllTrucksByVendorId() {


    }

    // TODO VENDOR DOMAIN
    @Test
    public void testFindAllTrucks() {
        Integer vendorId = 1;
        List<Trucks> trucks = new ArrayList<>();
        trucks.add(initTrucks());


    }

    private Trucks initTrucks() {

        Trucks trucks = new Trucks();

        trucks.setTruckCode("TEST");
        trucks.setTruckType("CARGO");
        trucks.setPlateNumber("ERN");
        trucks.setModelYear(2014);
        trucks.setEngineNumber("12451");
        trucks.setGrossWeight(10000);
        trucks.setCreatedBy("JOHN");
        trucks.setModifiedBy("PEL");

        return trucks;
    }
}
