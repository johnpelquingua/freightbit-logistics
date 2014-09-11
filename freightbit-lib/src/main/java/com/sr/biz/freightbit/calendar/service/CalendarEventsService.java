package com.sr.biz.freightbit.calendar.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEvent;
import com.dhtmlx.planner.DHXEventsManager;
import com.dhtmlx.planner.DHXStatus;
import com.sr.biz.freightbit.calendar.dao.CalendarDao;
import com.sr.biz.freightbit.calendar.dao.impl.CalendarDaoImpl;
import com.sr.biz.freightbit.calendar.dto.CalendarDetailsDTO;

public class CalendarEventsService extends DHXEventsManager {

	public CalendarEventsService(HttpServletRequest request) {
		super(request);
	}
 
	public Iterable<DHXEv> getEvents() {
		CalendarDao bookingCalendarDao = new CalendarDaoImpl();
        DHXEventsManager.date_format = "yyyy-MM-dd HH:mm:ss";
        List <DHXEv> events = new ArrayList<DHXEv>();
        try {
        	List<CalendarDetailsDTO> orderDTOList = bookingCalendarDao.getEvents();
        	for (CalendarDetailsDTO orderDTO:orderDTOList) {
				DHXEvent e = new DHXEvent();
				e.setId(orderDTO.getOrderId());
				e.setText(orderDTO.getOrderDetails());
				e.setStart_date(orderDTO.getPickUpDate());
				e.setEnd_date(orderDTO.getDeliveryDate());
				events.add(e);
			}
        } catch (Exception e1) {
             e1.printStackTrace();
        }
        DHXEventsManager.date_format = "MM/dd/yyyy HH:mm";//"MM/dd/yyyy HH:mm";

        return events;
	}

	@Override
	public DHXStatus saveEvent(DHXEv event, DHXStatus status) {
/*		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
 
			if (status == DHXStatus.UPDATE)
				session.update(event);
			else if (status == DHXStatus.DELETE)
				session.delete(event);
			else if (status == DHXStatus.INSERT)
				session.save(event);
 
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			e.printStackTrace();
		} finally{
			session.flush();
			session.close();
		}
		return status;*/
		return DHXStatus.UPDATE;
	}
 
	@Override
	public DHXEv createEvent(String id, DHXStatus status) {
		return new DHXEvent();
	}
}