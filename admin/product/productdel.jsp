<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../priv.jsp" %>
<%@ page import="java.util.regex.*,java.sql.*" %>
<%

    //1.提取表单数据
	request.setCharacterEncoding("utf-8");
   

	
	//3.插入数据库
	Connection c=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		c = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/shopping?serverTimezone=UTC", "root",
				"s19990716");
		String sql = "delete from product where id=?";
		String sId=request.getParameter("id");
		PreparedStatement pst = c.prepareStatement(sql);
		pst.setString(1,sId);
		pst.execute();
		response.sendRedirect(request.getContextPath()+"/admin/product/productlist.jsp");
	} catch (Exception ex) {
		ex.printStackTrace();
		request.getRequestDispatcher(request.getContextPath()+"/admin/product/productlist.jsp").forward(request,response);
	} finally {
		try {
			if (c!=null){
			  c.close();
			}
		} catch (Exception ex) {

		}
	}
		
%>
