package com.sr.apps.freightbit.core.action;

import com.opensymphony.xwork2.ActionSupport;
import com.sr.biz.freightbit.common.service.NotificationService;
import com.sr.biz.freightbit.core.service.UserService;
import com.sr.biz.freightbit.order.service.OrderService;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import java.math.BigInteger;
import java.util.Map;

/**
 * Created by JMXPSX on 4/23/14.
 */
public class DashboardAction extends ActionSupport implements SessionAware {
    private static final Logger log = Logger.getLogger(LoginAction.class);

    private String username;
    private String password;
    private Map<String, Object> sessionAttributes = null;

    private UserService userService;
    private OrderService orderService;
    private NotificationService notificationService;
    BigInteger Booking , Customer,User,Vendor, AllNotification ;


    public NotificationService getNotificationService() {
        return notificationService;
    }

    public void setNotificationService(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    public OrderService getOrderService() {
        return orderService;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String home() {
        Booking = notificationService.CountAll();
        Customer = notificationService.CountAllCustomer();
        User = notificationService.CountAllUser();
        Vendor = notificationService.CountAllVendor();
        AllNotification = notificationService.CountAllNotification();
        System.out.println("The number of  new booking is "+Booking);
        System.out.println("The number of  new Customer is "+Customer);
        System.out.println("The number of  new User is "+User);
        System.out.println("The number of  new Vendor is "+Vendor);
        System.out.println("The Number of all Notification is "+AllNotification);
        return SUCCESS;
    }




    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public void setSession(Map<String, Object> sessionAttributes) {
        this.sessionAttributes = sessionAttributes;
    }

    public BigInteger getBooking() {
        return Booking;
    }

    public void setBooking(BigInteger Booking) {
        this.Booking = Booking;
    }

    public BigInteger getCustomer() {
        return Customer;
    }

    public void setCustomer(BigInteger customer) {
        Customer = customer;
    }

    public BigInteger getUser() {
        return User;
    }

    public void setUser(BigInteger user) {
        User = user;
    }

    public BigInteger getVendor() {
        return Vendor;
    }

    public void setVendor(BigInteger vendor) {
        Vendor = vendor;
    }

    public BigInteger getAllNotification() {
        return AllNotification;
    }

    public void setAllNotification(BigInteger allNotification) {
        AllNotification = allNotification;
    }
}
