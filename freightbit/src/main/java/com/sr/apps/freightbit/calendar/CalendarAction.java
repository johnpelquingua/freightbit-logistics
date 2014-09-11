package com.sr.apps.freightbit.calendar;
 
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.dhtmlx.planner.DHXPlanner;
import com.dhtmlx.planner.DHXSkin;
import com.dhtmlx.planner.data.DHXDataFormat;
import com.opensymphony.xwork2.ActionSupport;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.biz.freightbit.calendar.dto.CalendarDetailsDTO;
import com.sr.biz.freightbit.calendar.dto.MessageStore;
import com.sr.biz.freightbit.calendar.service.CalendarService;
 
public class CalendarAction extends ActionSupport {
 
	private static final long serialVersionUID = 1L;
	private MessageStore messageStore = new MessageStore();
	private CalendarService calendarService;
	private CommonUtils commonUtils;
 
	public MessageStore getMessageStore() {
		return messageStore;
	}
 
	public void setMessageStore(MessageStore messageStore) {
		this.messageStore = messageStore;
	}
 
	
	public void setCalendarService(CalendarService calendarService) {
		this.calendarService = calendarService;
	}

	public void setCommonUtils(CommonUtils commonUtils) {
		this.commonUtils = commonUtils;
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
		//CalendarEventsService evs = new CalendarEventsService(ServletActionContext.getRequest());
		//messageStore.setData(evs.run());
		//CalendarService cal = new CalendarService();
		//messageStore.setData("[{'id':1,'text':'NTY-002: MANILA-CEBU','end_date':'07/01/2014 00:00','start_date':'06/24/2014 00:00'},{'id':3,'text':'NTY-004: MANILA-CEBU','end_date':'07/03/2014 00:00','start_date':'06/26/2014 00:00'},{'id':10,'text':'JMX-0002: MANILA-MANILA','end_date':'07/03/2014 00:00','start_date':'06/26/2014 00:00'},{'id':11,'text':'JMX-0003: MANILA-MANILA','end_date':'07/03/2014 00:00','start_date':'06/26/2014 00:00'},{'id':12,'text':'JMX-0004: MANILA-MANILA','end_date':'07/03/2014 00:00','start_date':'06/26/2014 00:00'},{'id':13,'text':'JMX-0005: MANILA-BUTUAN','end_date':'07/03/2014 00:00','start_date':'06/26/2014 00:00'},{'id':14,'text':'JMX-0006: MANILA-BACOLOD','end_date':'07/03/2014 00:00','start_date':'06/26/2014 00:00'},{'id':24,'text':'#@#-0000: MANILA-CEBU','end_date':'08/31/2014 00:00','start_date':'08/30/2014 00:00'},{'id':25,'text':'#@#-0001: MANILA-BUTUAN','end_date':'08/30/2014 00:00','start_date':'08/29/2014 00:00'},{'id':27,'text':'#@#-0003: MANILA-BUTUAN','end_date':'08/30/2014 00:00','start_date':'08/29/2014 00:00'},{'id':28,'text':'#@#-0004: MANILA-BACOLOD','end_date':'08/29/2014 00:00','start_date':'08/28/2014 00:00'},{'id':29,'text':'#@#-0005: MANILA-BUTUAN','end_date':'08/28/2014 00:00','start_date':'08/28/2014 00:00'}]");
		List <CalendarDetailsDTO> calendarDetails = calendarService.getEvents(commonUtils.getClientId());
		messageStore.setData(formatToJSON(calendarDetails));
		return SUCCESS;
	}
	
	private String formatToJSON(List <CalendarDetailsDTO> calendarDetails) {
	    JSONArray userArray = new JSONArray();
	    for (CalendarDetailsDTO detail : calendarDetails) {
	        JSONObject detailsJSON = new JSONObject();
	        detailsJSON.put("id", detail.getOrderId());
	        detailsJSON.put("text", detail.getOrderDetails());
	        
	        Date deliveryDate = detail.getDeliveryDate();
	        Date pickupDate = detail.getPickUpDate();
		    detailsJSON.put("end_date", format(deliveryDate));
		    detailsJSON.put("start_date", format(pickupDate));	        	

	        userArray.add(detailsJSON);
	    }
	    return userArray.toString();
	}
	
	 private static String format(Date date){
        SimpleDateFormat fmt = new SimpleDateFormat("MM/dd/yyyy hh:mm");
        String dateFormatted = fmt.format(date);
        return dateFormatted;
	 }
}