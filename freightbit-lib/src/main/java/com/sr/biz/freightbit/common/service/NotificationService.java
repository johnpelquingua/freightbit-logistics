package com.sr.biz.freightbit.common.service;

public interface NotificationService {

	public void sendEmailNotification(String username, String emailContent,
			String emailSubject);
}