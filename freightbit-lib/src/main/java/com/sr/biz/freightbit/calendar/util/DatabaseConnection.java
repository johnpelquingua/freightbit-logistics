package com.sr.biz.freightbit.calendar.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
 
public class DatabaseConnection {
 
       public static java.sql.Connection getConnection() {
              java.sql.Connection conn = null;
              try {
            	  Properties props = new Properties();
            	  InputStream is = null;
            	 
            	  try {
            	      File f = new File("jdbc.properties");
            	      is = new FileInputStream( f );
            	   } catch ( Exception e ) { is = null; }
            	 
            	    try {
            	        if ( is == null ) {
            	        	ClassLoader loader = Thread.currentThread().getContextClassLoader();   
            	            is = loader.getResourceAsStream("jdbc.properties");
            	        }
            	        props.load( is );
            	    } catch ( Exception e ) { }
            	 
            	    String url = props.getProperty("jdbc.databaseurl");
            	    String user = props.getProperty("jdbc.username");
            	    String password = props.getProperty("jdbc.password");
	                Class.forName("com.mysql.jdbc.Driver");
	                //String url = "jdbc:mysql://localhost:3306/freightbit";
			       //String user = "root";
			       //String password = "admin";
			       conn = DriverManager.getConnection(url, user, password);
              } catch (ClassNotFoundException e1) {
                            e1.printStackTrace();
              } catch (SQLException e1) {
                            e1.printStackTrace();
              }
              return conn;
       }
 
}