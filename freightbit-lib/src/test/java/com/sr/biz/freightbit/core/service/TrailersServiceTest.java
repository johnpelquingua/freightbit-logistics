package com.sr.biz.freightbit.core.service;

/**
 * Created with IntelliJ IDEA.
 * User: johnpel
 */

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

import com.sr.biz.freightbit.core.dao.TrailersDao;
import com.sr.biz.freightbit.core.service.impl.TrailersServiceImpl;
import com.sr.biz.freightbit.core.exceptions.TrailersAlreadyExistsException;
import com.sr.biz.freightbit.vendor.entity.Trailers;

@ContextConfiguration(locations = {"classpath:/conf/applicationContext-lib.xml"})
@RunWith(SpringJUnit4ClassRunner.class)

public class TrailersServiceTest {

    @Mock
    private TrailersDao trailersDao;

    @InjectMocks
    private TrailersServiceImpl trailersService;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Test(expected=TrailersAlreadyExistsException.class)
    public void testAddExistingTrailers() {

        Trailers trailers = initTrailers();

        List <Trailers> existingTrailerList = new ArrayList();
        existingTrailerList.add(trailers);

        Mockito.when(trailersDao.findTrailersByTrailerCode("TRAILERTEST")).thenReturn(existingTrailerList);
        trailersService.addTrailers(trailers);

    }

    // TODO VENDOR DOMAIN
    /*@Test
    public void testFindTrailerByClientId() {
        Integer clientId = 1;
        List <Trailers> trailer = new ArrayList();
        trailer.add(initTrailers());

        Mockito.when(trailersDao.findAllTrailers()).thenReturn(trailer);
        List<Trailers> results = trailersService.findAllTrailersByClientId(clientId);
        Assert.assertEquals(trailer.size(), 1);

    }*/

     //TODO VENDOR DOMAIN

    @Test
    public void testFindAllTrailers(){
        Integer vendorId = 1;
        List<Trailers> trailers = new ArrayList();
        trailers.add(initTrailers());


    }

    private Trailers initTrailers(){

        Trailers trailers = new Trailers();

        trailers.setTrailerCode("TRAILERTEST");
        trailers.setTrailerType("TOYOTA");
        trailers.setTrailerLength(100);
        trailers.setGrossWeight(10);
        trailers.setModelName("KIA");
        trailers.setModelYear(123);
        trailers.setAxle(10);
        trailers.setVin("VIN");
        trailers.setPlateNumber("2014");
        //trailers.setCreatedTimestamp();
        trailers.setCreatedBy("JOHN");
        //trailers.setModifiedTimestamp();
        trailers.setModifiedBy("PEL");

        return trailers;
    }
}
