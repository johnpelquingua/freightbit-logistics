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

    public BigInteger CountAll();

    public BigInteger CountAllCustomer();

    public BigInteger CountAllUser();

    public BigInteger CountAllVendor();

    public Integer clearNewBooking();

    public Integer clearNewCustomer();

    public Integer clearNewUser();

    public Integer clearNewVendor();



    }