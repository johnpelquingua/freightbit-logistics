package com.sr.biz.freightbit.common.service.impl;

import com.sr.biz.freightbit.common.service.NotificationService;
import com.sr.biz.freightbit.core.dao.UserDao;
//import javax.mail.MessagingException;


public class NotificationServiceImpl implements NotificationService {
	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public void sendEmailNotification(String username, String emailContent, String emailSubject) {
	/**	User user = userDao.findUserByUserName(username); 
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
		} **/
		
	}
}