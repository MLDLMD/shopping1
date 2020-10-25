<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*,edu.jmi.shop.dao.*,edu.jmi.shop.bean.*"%>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	UserDAO userDAO = new UserDAO();
	User user = userDAO.selectByName(username);
	if (user == null) {
		request.setAttribute("loginerror", "用户名或者密码错误！");
		request.getRequestDispatcher("/index/login.jsp").forward(request, response);
		return;
	}
	if (user.getPwd().equals(password)==false){
		request.setAttribute("loginerror", "用户名或者密码错误！");
		request.getRequestDispatcher("/index/login.jsp").forward(request, response);
		return;
	}
	if ("ROLE_GUEST".equals(user.getRole())==false){
		request.setAttribute("loginerror", "用户角色不正确！");
		request.getRequestDispatcher("/index/login.jsp").forward(request, response);
		return;
	}
	session.setAttribute("user", user);
	
	String avoid=request.getParameter("avoid");
	if (avoid!=null){
		Cookie cookie=new Cookie("username",username);
		cookie.setMaxAge(60*60*24*10);
		cookie.setPath("/index");
		response.addCookie(cookie);
		cookie=new Cookie("password",password);
		cookie.setMaxAge(60*60*24*10);
		cookie.setPath("/index");
		response.addCookie(cookie);	
	}else{
		Cookie cookie=new Cookie("username",username);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		cookie=new Cookie("password",password);
		cookie.setMaxAge(0);
		response.addCookie(cookie);	
	}
	response.sendRedirect(request.getContextPath()+"/index/index.jsp");
%>