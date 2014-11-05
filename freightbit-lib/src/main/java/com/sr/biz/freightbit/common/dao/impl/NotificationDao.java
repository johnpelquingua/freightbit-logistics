package com.sr.biz.freightbit.common.dao.impl;

import com.sr.biz.freightbit.common.entity.Notification;

import java.math.BigInteger;

/**
 * Created by user on 9/29/2014.
 */
public interface NotificationDao {

    public void addNotification(Notification notification);

    public void addNotificationCustomer(Notification notification);

    public void addNotificationUser(Notification notification);

    public void addNotificationVendor(Notification notification);

    public BigInteger CountAll();

    public BigInteger CountAllCustomer();

    public BigInteger CountAllUser();

    public BigInteger CountAllVendor();

    public BigInteger CountAllNotification();

    public Integer clearNewBooking();

    public Integer clearNewCustomer();

    public Integer clearNewUser();

    public Integer clearNewVendor();




}
