package edu.jmi.shop.controller;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

/**
 * Application Lifecycle Listener implementation class OnlineLoginUserCountListener
 *
 */
@WebListener
public class OnlineLoginUserCountListener implements HttpSessionAttributeListener {
    private static int onlineLoingUserCnt=0;
    /**
     * Default constructor. 
     */
    public OnlineLoginUserCountListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent se)  { 
    	onlineLoingUserCnt++;
    	se.getSession().getServletContext().setAttribute("onlineLoingUserCnt", onlineLoingUserCnt);
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent se)  { 
    	onlineLoingUserCnt--;
    	se.getSession().getServletContext().setAttribute("onlineLoingUserCnt", onlineLoingUserCnt);
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent se)  { 
         // TODO Auto-generated method stub
    }
	
}
