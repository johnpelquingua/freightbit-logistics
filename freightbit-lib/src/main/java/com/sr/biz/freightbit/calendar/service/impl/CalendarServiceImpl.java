package com.sr.biz.freightbit.calendar.service.impl;

import com.sr.biz.freightbit.calendar.dto.CalendarDetailsDTO;
import com.sr.biz.freightbit.calendar.service.CalendarService;
import com.sr.biz.freightbit.order.dao.OrderDao;
import com.sr.biz.freightbit.order.entity.Orders;

import java.util.ArrayList;
import java.util.List;

public class CalendarServiceImpl implements CalendarService {

	private OrderDao orderDao;

	@Override
	public List<CalendarDetailsDTO> getEvents(Integer customerId) {
		List <Orders> orderList = orderDao.findAllOrders();
		List <CalendarDetailsDTO> calDetails = new ArrayList<CalendarDetailsDTO>();
		for (Orders order:orderList) {
            if (order.getCustomerId() != customerId && customerId != null){
                continue;
            }
			CalendarDetailsDTO detail = new CalendarDetailsDTO();
			detail.setOrderId(order.getOrderId());
			detail.setOrderDetails(order.getOrderNumber() + ": " + order.getOriginationPort() + "-" + order.getDestinationPort());
			if (order.getDeliveryDate() == null)
				detail.setDeliveryDate(order.getPickupDate());
			else
				detail.setDeliveryDate(order.getDeliveryDate());

			if (order.getPickupDate() == null)
				detail.setPickUpDate(order.getDeliveryDate());
			else
				detail.setPickUpDate(order.getPickupDate());

			calDetails.add(detail);
		}
		return calDetails;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}


}