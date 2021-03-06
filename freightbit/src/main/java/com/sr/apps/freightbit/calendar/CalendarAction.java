package com.sr.apps.freightbit.calendar;

import com.dhtmlx.planner.DHXPlanner;
import com.dhtmlx.planner.DHXSkin;
import com.dhtmlx.planner.data.DHXDataFormat;
import com.opensymphony.xwork2.ActionSupport;
import com.sr.apps.freightbit.util.CommonUtils;
import com.sr.biz.freightbit.calendar.dto.CalendarDetailsDTO;
import com.sr.biz.freightbit.calendar.dto.MessageStore;
import com.sr.biz.freightbit.calendar.service.CalendarService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

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
		List <CalendarDetailsDTO> calendarDetails = calendarService.getEvents(commonUtils.getCustomerIdFromSession());
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