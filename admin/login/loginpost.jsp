<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%

    //步骤1，是获取用户输入的用户名和密码
	String username = request.getParameter("username");
	String password = request.getParameter("password");
    //System.out.println(username);
    //System.out.println(password);

	//步骤2，就是根据获得的用户名到数据库查找该用户
	Connection c = null;
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		c = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/shopping?serverTimezone=UTC", "root", "s19990716");
		String sql = "select * from user where user_name='" + username+"'" ;
		//System.out.println(sql);
		
		PreparedStatement st = c.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		//步骤3 判断用户是否存在
		if (rs.next()) {
			//获取该用户的密码
			String pwd=rs.getString("pwd");
			//判断该用户的密码和输入的密码是否相等
			if (pwd.equals(password)){
				session.setAttribute("user", username);
				session.setAttribute("userid",rs.getInt("id"));
				response.sendRedirect(request.getContextPath()+"/admin/main.jsp");
			}else{
				session.setAttribute("error", "用户名或者密码错误");
				response.sendRedirect(request.getContextPath()+"/admin/login/login.jsp");
			}
		} else {
			session.setAttribute("error", "用户名或者密码错误");
			response.sendRedirect(request.getContextPath()+"/admin/login/login.jsp");
		}
	} catch (Exception ex) {
		ex.printStackTrace();
		session.setAttribute("error", "程序出现未知异常");
		response.sendRedirect(request.getContextPath()+"/admin/login/login.jsp");
	} finally {
		try {
			c.close();
		} catch (Exception ex) {

		}
	}
%>