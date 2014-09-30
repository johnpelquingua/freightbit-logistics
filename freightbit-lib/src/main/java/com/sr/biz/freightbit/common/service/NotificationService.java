package com.sr.biz.freightbit.common.service;

import com.sr.biz.freightbit.common.entity.Notification;

public interface NotificationService {

	public void sendEmailNotification(String username, String emailContent,
			String emailSubject);

    public void addNotification (Notification notification);
}