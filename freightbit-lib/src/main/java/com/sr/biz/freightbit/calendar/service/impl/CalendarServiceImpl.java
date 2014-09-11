package com.sr.biz.freightbit.calendar.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.sr.biz.freightbit.calendar.dto.CalendarDetailsDTO;
import com.sr.biz.freightbit.order.dao.OrderDao;
import com.sr.biz.freightbit.order.entity.Orders;
import com.sr.biz.freightbit.calendar.service.CalendarService;

public class CalendarServiceImpl implements CalendarService {

    private OrderDao orderDao;
    
    @Override
	public List<CalendarDetailsDTO> getEvents(Integer clientId) {
		List <Orders> orderList = orderDao.findAllOrders();
		List <CalendarDetailsDTO> calDetails = new ArrayList<CalendarDetailsDTO>();
		for (Orders order:orderList) {
			CalendarDetailsDTO detail = new CalendarDetailsDTO();
			detail.setOrderId(order.getOrderId());
			detail.setOrderDetails(order.getOrderNumber() + ": " + order.getOriginationPort() + "-" + order.getDestinationPort());
			detail.setDeliveryDate(order.getDeliveryDate());
			detail.setPickUpDate(order.getPickupDate());
			calDetails.add(detail);
		}
		return calDetails;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	
	
}