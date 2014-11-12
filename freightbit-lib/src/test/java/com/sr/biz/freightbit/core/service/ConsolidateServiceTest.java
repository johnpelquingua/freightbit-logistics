package com.sr.biz.freightbit.core.service;

import com.sr.biz.freightbit.operations.dao.ConsolidationDao;
import com.sr.biz.freightbit.operations.service.impl.ConsolidationServiceImpl;
import com.sr.biz.freightbit.order.entity.OrderItems;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@ContextConfiguration(locations = {"classpath:/conf/applicationContext-lib.xml"})
@RunWith(SpringJUnit4ClassRunner.class)

public class ConsolidateServiceTest {

	@Mock
	private ConsolidationDao consolidationDao;

	@InjectMocks
	private ConsolidationServiceImpl consolidationService;

	@Before
	public void setup() throws Exception{
		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void testFindContainerByOrderItemId(){
		Integer orderItemId = 1;
		List<OrderItems> orderItems = new ArrayList<>();
		orderItems.add(initOrders());
	}


	private OrderItems initOrders(){
		OrderItems orderItems = new OrderItems();

		orderItems = new OrderItems();
		orderItems.setOrderItemId(1);

		return orderItems;
	}

}
