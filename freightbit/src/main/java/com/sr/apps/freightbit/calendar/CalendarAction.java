package com.sr.apps.freightbit.calendar;
 
import java.util.Calendar;
import java.util.GregorianCalendar;

import org.apache.struts2.ServletActionContext;

import com.dhtmlx.planner.DHXPlanner;
import com.dhtmlx.planner.DHXSkin;
import com.dhtmlx.planner.data.DHXDataFormat;
import com.opensymphony.xwork2.ActionSupport;
import com.sr.biz.freightbit.calendar.dto.MessageStore;
import com.sr.biz.freightbit.calendar.service.CalendarEventsService;
 
public class CalendarAction extends ActionSupport {
 
	private static final long serialVersionUID = 1L;
	private MessageStore messageStore = new MessageStore();
 
	public MessageStore getMessageStore() {
		return messageStore;
	}
 
	public void setMessageStore(MessageStore messageStore) {
		this.messageStore = messageStore;
	}
 
	public String loadCalendar() throws Exception {
		Calendar today = new GregorianCalendar();
		int year = today.get(GregorianCalendar.YEAR);
		int month = today.get(GregorianCalendar.MONTH);
		int day = today.get(GregorianCalendar.DATE);
		
		DHXPlanner p = new DHXPlanner("./codebase/", DHXSkin.TERRACE);
		p.setWidth(900);
		p.setInitialDate(year, month, day);
		p.load("events", DHXDataFormat.JSON);
        p.config.setReadonlyForm(true);
   		p.config.setDblClickCreate(false);
   		p.config.setDragCreate(false);
   		p.config.setDragMove(false);
   		p.config.setDragLightbox(false);
   		p.config.setDragResize(false);
   		p.config.setCascadeEventDisplay(true);
   		p.setInitialView("month");
   		p.xy.setBarHeight(30);
		messageStore.setPlanner(p.render());
		return SUCCESS;
	}
 
	public String events() throws Exception {
		CalendarEventsService evs = new CalendarEventsService(ServletActionContext.getRequest());
		messageStore.setData(evs.run());
		return SUCCESS;
	}
}