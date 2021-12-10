package com.gdu.voyage.commons;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

//세션의 유무에 따라 마리아db를 연결, 해제 하는 리스너

/*
@WebListener
public class DBUtil implements HttpSessionListener {
	public static Connection conn = null;

    public void sessionCreated(HttpSessionEvent se)  { 
    	try {
    		Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://3.36.52.11:3306/voyage", "root", "java1004");
			if (conn != null) {
				System.out.println("MariaDB Connect");
			}
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("MariaDB Connect Faild");
			e.printStackTrace();
		}
    }

    public void sessionDestroyed(HttpSessionEvent se)  { 
    	try {
      	   conn.close();
  		} catch (SQLException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
    }
    
}
*/
