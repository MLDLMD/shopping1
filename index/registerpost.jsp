<%@page import="edu.jmi.shop.bean.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*,edu.jmi.shop.dao.UserDAO"%>

<jsp:useBean id="user" class="edu.jmi.shop.bean.User"/>
<jsp:setProperty property="*" name="user"/>
<%
	String path = request.getContextPath();
    user.setRegisterTime(new Date(System.currentTimeMillis()));
    user.setRole("ROLE_GUEST");
    UserDAO userDAO=new UserDAO();
    User u=userDAO.selectByName(user.getUserName());
    int flag=0;
    if(u==null){
    	if (userDAO.insert(user)==true){
    		out.println("alert('注册成功！')");
    		response.sendRedirect(request.getContextPath()+"/index/login.jsp");
    	}else{
    		out.println("alert('用户存在！')");
    		response.sendRedirect(request.getContextPath()+"/index/register.jsp?i="+flag);
    }}
    else{
    	flag=1;
    	response.sendRedirect(path+"/index/register.jsp?i="+flag);
    }
%>


<%--

	Connection c = null;
	try {

		Class.forName("com.mysql.jdbc.Driver");
		c = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/shopping?serverTimezone=UTC", "root", "s19990716");
		String sql = "insert into user(user_name,pwd,register_time,role) values(?,?,?,'ROLE_GUEST')" ;
		PreparedStatement pst = c.prepareStatement(sql);
		
		pst.setString(1, user.getUserName());
		pst.setString(2, user.getPwd());
		pst.setDate(3, new Date(System.currentTimeMillis()));
		pst.execute();
		response.sendRedirect(request.getContextPath()+"/index/login.jsp");
	} catch (Exception ex) {
		ex.printStackTrace();
		response.sendRedirect(request.getContextPath()+"/index/register.jsp");
	} finally {
		try {
			c.close();
		} catch (Exception ex) {

		}
	}

--%>
