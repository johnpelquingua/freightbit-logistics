package com.sr.apps.freightbit.common.action;

import com.opensymphony.xwork2.ActionSupport;
import com.sr.biz.freightbit.common.service.NotificationService;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.math.BigInteger;

public class NotificationAction extends ActionSupport {
    private InputStream inputStream;
	private NotificationService notificationService;
	
    public String getNotifications() {
    	notificationService.CountAll();
        BigInteger count = notificationService.CountAll();
        System.out.println("getNotifications() is called");
        byte[] bArray;

        if(count != null) {
            inputStream = new ByteArrayInputStream(count.toString().getBytes());
        } else {
            inputStream = new ByteArrayInputStream("0".getBytes());
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
