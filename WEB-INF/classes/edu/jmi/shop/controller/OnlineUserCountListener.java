package edu.jmi.shop.controller;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class OnlineUserCountListener
 *
 */
@WebListener
public class OnlineUserCountListener implements HttpSessionListener {

	private static int cnt=0;
    /**
     * Default constructor. 
     */
    public OnlineUserCountListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  { 
         cnt++;
         se.getSession().getServletContext().setAttribute("cnt", cnt);
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
    	 cnt--;
    	 se.getSession().getServletContext().setAttribute("cnt", cnt);
    }
	
}
