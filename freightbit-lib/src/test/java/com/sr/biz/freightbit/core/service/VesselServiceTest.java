package com.sr.biz.freightbit.core.service;

/**
 * Created by ADMIN on 5/16/2014.
 */
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

import com.sr.biz.freightbit.vendor.dao.VesselDao;
import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.vendor.exceptions.VesselAlreadyExistsException;
import com.sr.biz.freightbit.vendor.service.impl.VesselServiceImpl;
import com.sr.biz.freightbit.vendor.entity.Vessel;

@ContextConfiguration(locations = {"classpath:/conf/applicationContext-lib.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class VesselServiceTest {

    @Mock
    private VesselDao vesselDao;
    @InjectMocks
    private VesselServiceImpl vesselService;
    @Before
    public void setUp(){ MockitoAnnotations.initMocks(this);}


    @Test(expected = VesselAlreadyExistsException.class)
    public void testAddExistingVessel(){
            Vessel vessel = initVessel();
            List<Vessel> existingVesselList = new ArrayList();
            existingVesselList.add(vessel);

            Mockito.when(vesselDao.findVesselByName("admin")).thenReturn(existingVesselList);
            vesselService.addVessel(vessel);
    }


    @Test
    public void testFindAllVessel(){
        Integer clientId = 1;

        List<Vessel> vessels = new ArrayList<>();
        vessels.add(initVessel());



    }

    @Test
    public void testFindVesselByClientId(){
        Integer clientId = 1;
        List<Vessel> vessels = new ArrayList();
        vessels.add(initVessel());

        Mockito.when(vesselDao.findAllVessel()).thenReturn(vessels);
        List<Vessel> results = vesselService.findVesselByClientId(clientId);
        Assert.assertEquals(vessels.size(), 1);

    }

    @Test
    public void testAddVessel(){


    }

    private Vessel initVessel(){

    Client client = new Client("Ernest", new Date(), "Juno", new Date(), "Juno");

    Vessel vessel = new Vessel();

    vessel.setClientId(client);
    vessel.setVesselId(31);
   // vessel.setVendorId("afaf");
    vessel.setVesselNumber("1323");
    vessel.setVesselName("aaa");
    vessel.setVesselNumber("12345");
    vessel.setModelYear(1901);
    vessel.setModelNumber("12341");
    vessel.setCreatedTimestamp(new Date());
    vessel.setCreatedBy("admin");
    vessel.setModifiedTimestamp(new Date());
    vessel.setModifiedBy("user");
    return vessel;
    }

}
