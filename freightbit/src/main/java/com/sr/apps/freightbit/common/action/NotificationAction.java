package com.sr.apps.freightbit.common.action;

import com.opensymphony.xwork2.ActionSupport;
import com.sr.biz.freightbit.common.service.NotificationService;

public class NotificationAction extends ActionSupport {

	private NotificationService notificationService;
	
    public String getNotifications() {
    	notificationService.CountAll();
        return SUCCESS;
    }

	public NotificationService getNotificationService() {
		return notificationService;
	}

	public void setNotificationService(NotificationService notificationService) {
		this.notificationService = notificationService;
	}
    
    
}
