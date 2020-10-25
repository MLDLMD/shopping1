package edu.jmi.shop.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class ManagePrivlegeFilter
 */
@WebFilter("/admin/*")
public class ManagePrivlegeFilter implements Filter {

    /**
     * Default constructor. 
     */
    public ManagePrivlegeFilter() {
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
		HttpServletRequest req=(HttpServletRequest)request;
		String uri=req.getRequestURI();
		if (uri.indexOf("/login/")>=0) {
			chain.doFilter(request, response);
			return;
		}
		Object user=req.getSession().getAttribute("user");
		if(user==null) {
			HttpServletResponse resp=(HttpServletResponse)response;
			resp.sendRedirect(req.getContextPath()+"/admin/login/login.jsp");
			return;
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
