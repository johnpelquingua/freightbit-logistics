package com.sr.apps.freightbit.common.action;

import com.opensymphony.xwork2.ActionSupport;
import com.sr.biz.freightbit.common.service.NotificationService;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.math.BigInteger;
import java.nio.charset.Charset;

public class NotificationAction extends ActionSupport {
	private InputStream inputStream = new ByteArrayInputStream(count.toString().getBytes(Charset.forName("UTF-8")));
	private NotificationService notificationService;

	public String getNotifications() {
		notificationService.countAll();
		BigInteger count = notificationService.countAll();
		System.out.println("getNotifications() is called");
		byte[] bArray;

		if(count != null) {
			inputStream = new ByteArrayInputStream(count.toString().getBytes(Charset.forName("UTF-8")));
		} else {
			inputStream = new ByteArrayInputStream("0".getBytes(Charset.forName("UTF-8")));
		}
		return SUCCESS;
	}

	public NotificationService getNotificationService() {
		return notificationService;
	}

	public void setNotificationService(NotificationService notificationService) {
		this.notificationService = notificationService;
	}
}