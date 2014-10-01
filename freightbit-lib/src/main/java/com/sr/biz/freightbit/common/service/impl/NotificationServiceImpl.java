package com.sr.biz.freightbit.common.service.impl;

import com.sr.biz.freightbit.common.dao.impl.NotificationDao;
import com.sr.biz.freightbit.common.entity.Notification;
import com.sr.biz.freightbit.common.service.NotificationService;
import com.sr.biz.freightbit.core.dao.UserDao;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigInteger;
//import javax.mail.MessagingException;


public class NotificationServiceImpl implements NotificationService {
	private UserDao userDao;
    private NotificationDao notificationDao;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

    public NotificationDao getNotificationDao() {
        return notificationDao;
    }

    public void setNotificationDao(NotificationDao notificationDao) {
        this.notificationDao = notificationDao;
    }

    @Override
	public void sendEmailNotification(String username, String emailContent, String emailSubject) {
/*		User user = userDao.findUserByUserName(username); 
		String recipientEmail = user.getEmail();
		if (recipientEmail != null && "".equals(recipientEmail)) {
	      	  Properties props = new Properties();
	      	  InputStream is = null;
	      	 
	      	  try {
      	        if ( is == null ) {
	   	        	ClassLoader loader = Thread.currentThread().getContextClassLoader();   
	   	            is = loader.getResourceAsStream("mail.properties");
	              }
	      	      props.load( is );
	      	  } catch ( Exception e ) { }

		      String from = props.getProperty("mail.from");
		      String host = props.getProperty("mail.host");

		      // Get system properties
		      Properties properties = System.getProperties();
		      properties.setProperty("mail.smtp.host", host);
		      Session session = Session.getDefaultInstance(properties);

		      try{
		         MimeMessage message = new MimeMessage(session);
		         message.setFrom(new InternetAddress(from));
		         message.addRecipient(Message.RecipientType.TO,
		                                  new InternetAddress(recipientEmail));
		         message.setSubject(emailSubject);
		         message.setText(emailContent);

		         Transport.send(message);
		         System.out.println("Sent message successfully....");
		      }catch (Exception mex) {
		         mex.printStackTrace();
		      }
		} */
		
	}

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addNotification(Notification notification){

        notificationDao.addNotification(notification);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addNotificationCustomer(Notification notification){

         notificationDao.addNotificationCustomer(notification);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addNotificationUser(Notification notification){

        notificationDao.addNotificationUser(notification);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addNotificationVendor(Notification notification){

        notificationDao.addNotificationVendor(notification);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public BigInteger CountAll(){
        return notificationDao.CountAll();

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public BigInteger CountAllCustomer(){
        return notificationDao.CountAllCustomer();

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public BigInteger CountAllUser(){
        return notificationDao.CountAllUser();

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public BigInteger CountAllVendor(){
        return notificationDao.CountAllVendor();

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Integer clearNewBooking(){
        return notificationDao.clearNewBooking();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Integer clearNewCustomer(){
        return notificationDao.clearNewCustomer();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Integer clearNewUser(){
        return notificationDao.clearNewUser();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Integer clearNewVendor(){
        return notificationDao.clearNewVendor();
    }
}