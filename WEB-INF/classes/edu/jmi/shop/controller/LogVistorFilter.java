package edu.jmi.shop.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import edu.jmi.shop.bean.User;
import edu.jmi.shop.bean.VistorLog;
import edu.jmi.shop.dao.VistorLogDAO;

/**
 * Servlet Filter implementation class LogVistorFilter
 */
@WebFilter("/index/*")
public class LogVistorFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LogVistorFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		VistorLog log=new VistorLog();
		HttpServletRequest req=(HttpServletRequest)request;
		String host=req.getRemoteHost();
		String uri=req.getRequestURI();
		String param=req.getQueryString();
		User user=(User)req.getSession().getAttribute("user");
		String userName="";
		if (user!=null) {
			userName=user.getUserName();
		}
		Timestamp vistorTime=new Timestamp(System.currentTimeMillis());
		log.setVistorHost(host);
		log.setVistorURL(uri);
		log.setVistorParam(param);
		log.setVistorUser(userName);
		log.setVistorTime(vistorTime);
		
		VistorLogDAO logDAO=new VistorLogDAO();
		logDAO.insert(log);
		
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
