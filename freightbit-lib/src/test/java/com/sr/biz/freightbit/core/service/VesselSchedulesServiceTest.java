package com.sr.biz.freightbit.core.service;

import com.sr.biz.freightbit.vesselSchedule.dao.VesselSchedulesDao;
import com.sr.biz.freightbit.vesselSchedule.entity.VesselSchedules;
import com.sr.biz.freightbit.vesselSchedule.service.impl.VesselSchedulesServiceImpl;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Clarence C. Victoria on 7/22/14.
 */
@ContextConfiguration(locations = {"classpath:/conf/applicationContext-lib.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class VesselSchedulesServiceTest {

    @MockitoAnnotations.Mock
    private VesselSchedulesDao vesselSchedulesDao;

    @InjectMocks
    private VesselSchedulesServiceImpl vesselSchedulesService;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void testAddExistingVesselSchedule() {
        VesselSchedules vesselSchedules = initVesselSchedules();
        List<VesselSchedules> existingVesselSchedulesList = new ArrayList<>();
        existingVesselSchedulesList.add(vesselSchedules);

        Mockito.when(vesselSchedulesDao.findVesselScheduleById(1)).thenReturn(vesselSchedules);
        vesselSchedulesDao.addVesselSchedule(vesselSchedules);
    }

    @Test
    public void testFindAllVesselSchedules() {
        VesselSchedules vesselSchedules = initVesselSchedules();
        List<VesselSchedules> vesselSchedulesList = new ArrayList<>();
        vesselSchedulesList.add(vesselSchedules);

        Mockito.when(vesselSchedulesDao.findAllVesselSchedules()).thenReturn(vesselSchedulesList);
        List<VesselSchedules> results = vesselSchedulesService.findAllVesselSchedules();
        org.junit.Assert.assertEquals(1, results.size());
    }

    private VesselSchedules initVesselSchedules() {

        VesselSchedules vesselSchedules = new VesselSchedules();

        vesselSchedules.setClientId(1);
        vesselSchedules.setModifiedBy("Clarence");
        vesselSchedules.setArrivalDate("1994-20-11");
        vesselSchedules.setArrivalTime("1994-20-11");
        vesselSchedules.setCreatedBy("Clarence");
        vesselSchedules.setCreatedTimestamp(new Date());
        vesselSchedules.setDepartureDate("1994-20-11");
        vesselSchedules.setDepartureTime("1994-20-11");
        vesselSchedules.setDestinationPort("CCC");
        vesselSchedules.setOriginPort("CCC");
        vesselSchedules.setVendorId(1);
        vesselSchedules.setVesselScheduleId(1);

        return vesselSchedules;
    }
}
