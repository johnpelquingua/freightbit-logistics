package com.sr.biz.freightbit.core.service;

import com.sr.biz.freightbit.core.entity.Client;
import com.sr.biz.freightbit.operations.dao.OrderStatusLogsDao;
import com.sr.biz.freightbit.operations.entity.OrderStatusLogs;
import com.sr.biz.freightbit.operations.service.impl.OrderStatusLogsServiceImpl;
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

/**
 * Created by Clarence C. Victoria on 7/30/14.
 */
@ContextConfiguration(locations = {"classpath:/conf/applicationContext-lib.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class OrderStatusLogsTest {

    @Mock
    private OrderStatusLogsDao orderStatusLogsDao;

    @InjectMocks
    private OrderStatusLogsServiceImpl orderStatusLogsService;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    private OrderStatusLogs initOrderStatus() {
        OrderStatusLogs orderStatusLogs = new OrderStatusLogs();
        orderStatusLogs.setStatusId(1);
        orderStatusLogs.setOrderItemId(1);
        orderStatusLogs.setOrderId(1);
        orderStatusLogs.setCreatedBy("admin");
        orderStatusLogs.setCreatedTimestamp("");
        orderStatusLogs.setStatus("APPROVED");

        return orderStatusLogs;
    }

    @Test
    public void TestAddOrderStatusLogs() {
        OrderStatusLogs orderStatusLogs = initOrderStatus();

        orderStatusLogsService.addStatus(orderStatusLogs);
    }
}
