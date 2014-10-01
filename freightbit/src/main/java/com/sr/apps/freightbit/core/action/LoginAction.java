package com.sr.apps.freightbit.core.action;

import java.math.BigInteger;
import java.security.Principal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sr.biz.freightbit.common.service.NotificationService;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.sr.biz.freightbit.core.entity.User;
import com.sr.biz.freightbit.core.service.UserService;

/**
 * Created by JMXPSX on 4/23/14.
 */
public class LoginAction extends ActionSupport implements SessionAware {
    private static final Logger log = Logger.getLogger(LoginAction.class);

    private String username;
    private String password;
    private Map<String, Object> sessionAttributes = null;

    private UserService userService;
    private NotificationService notificationService;
    public BigInteger Booking, Customer , User , Vendor;

    public NotificationService getNotificationService() {
        return notificationService;
    }

    public void setNotificationService(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public String execute() throws Exception {

        log.debug("execute login...");
        HttpServletRequest request = ServletActionContext.getRequest();  
        Principal user = request.getUserPrincipal();
        this.setUsername(request.getUserPrincipal().getName());  
/*		if (sessionAttributes.get("USER")!= null){
            return SUCCESS;
		}*/

        User userEntity = userService.findUserByUserName(username);
        if (userEntity != null) {
        	userService.updateLastVisitDate(userEntity);
            sessionAttributes.put("clientId", userEntity.getClient().getClientId());
            sessionAttributes.put("user", userEntity);
            sessionAttributes.put("loggedinUser", userEntity.getFirstName() + " " + userEntity.getLastName());
            Booking = notificationService.CountAll();
            Customer = notificationService.CountAllCustomer();
            User = notificationService.CountAllUser();
            Vendor = notificationService.CountAllVendor();
            System.out.println("The number of  new booking is "+Booking);
            System.out.println("The number of  new Customer is "+Customer);
            System.out.println("The number of  new User is "+User);
            System.out.println("The number of  new Vendor is "+Vendor);
            return SUCCESS;
        } else {
            log.debug("clearing errors and messages...");
            clearErrorsAndMessages();
            addActionError(getText("error.login"));
            return INPUT;
        }
    }

    public void validate() {
/*        if (getUsername().length() == 0) {
            addFieldError("username", "User Name is required");
        }

        if (getPassword().length() == 0) {
            addFieldError("password", getText("password.required"));
        }*/

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

    public void setBooking(BigInteger booking) {
        Booking = booking;
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
}
