package com.sr.biz.freightbit.calendar.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sr.biz.freightbit.calendar.dao.CalendarDao;
import com.sr.biz.freightbit.calendar.dto.CalendarDetailsDTO;
import com.sr.biz.freightbit.calendar.util.DatabaseConnection;

public class CalendarDaoImpl implements CalendarDao {
	
	@Override
	public List<CalendarDetailsDTO> getEvents() {
	
		List<CalendarDetailsDTO> events = new ArrayList<CalendarDetailsDTO>();
	    try {
	        java.sql.Connection conn = DatabaseConnection.getConnection();
			java.sql.Statement statement = conn.createStatement();
			
			String query = "SELECT originationPort, destinationPort, orderId, orderNumber, pickupDate, deliveryDate FROM Orders";
		    ResultSet resultset = statement.executeQuery(query);
			
			while (resultset.next()) {
				CalendarDetailsDTO o = new CalendarDetailsDTO();
				o.setOrderId(Integer.parseInt(resultset.getString("orderId")));
				o.setOrderDetails(resultset.getString("orderNumber") + ": " + resultset.getString("originationPort") + "-" + resultset.getString("destinationPort"));
				o.setPickUpDate(resultset.getDate("pickupDate"));
				o.setDeliveryDate(resultset.getDate("deliveryDate"));
				events.add(o);
			}
			conn.close();
		} catch (SQLException e1) {
		        e1.printStackTrace();
		}
	    return events;
	}
}