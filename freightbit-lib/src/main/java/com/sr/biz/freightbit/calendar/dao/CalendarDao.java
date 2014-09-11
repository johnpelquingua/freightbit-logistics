package com.sr.biz.freightbit.calendar.dao;

import java.util.List;

import com.sr.biz.freightbit.calendar.dto.CalendarDetailsDTO;


public interface CalendarDao {

	public List<CalendarDetailsDTO> getEvents();
	
}