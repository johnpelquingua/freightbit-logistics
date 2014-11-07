package com.sr.biz.freightbit.common.service;

import com.sr.biz.freightbit.common.entity.Notification;

import java.math.BigInteger;

public interface NotificationService {

	public void sendEmailNotification(String username, String emailContent,
			String emailSubject);

    public void addNotification (Notification notification);

    public void addNotificationCustomer(Notification notification);

    public void addNotificationUser(Notification notification);

    public void addNotificationVendor(Notification notification);

    public BigInteger countAll();

    public BigInteger countAllCustomer();

    public BigInteger countAllUser();

    public BigInteger countAllVendor();

    public BigInteger countAllNotification();

    public Integer clearNewBooking();

    public Integer clearNewCustomer();

    public Integer clearNewUser();

    public Integer clearNewVendor();



    }