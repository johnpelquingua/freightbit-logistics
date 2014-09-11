package com.sr.biz.freightbit.calendar.service;

import java.util.List;

import com.sr.biz.freightbit.calendar.dto.CalendarDetailsDTO;

public interface CalendarService  {
    
	public List<CalendarDetailsDTO> getEvents(Integer clientId);
	
}