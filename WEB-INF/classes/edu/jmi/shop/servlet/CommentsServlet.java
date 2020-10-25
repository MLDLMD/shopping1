package edu.jmi.shop.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jmi.shop.bean.User;

/**
 * Servlet implementation class CommentsServlet
 */
@WebServlet("/CommentsServlet")
public class CommentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String comment=request.getParameter("content");
		String Productid=request.getParameter("productid");
		int productid=Integer.parseInt(Productid);
		String Stars=request.getParameter("stars");
		int stars=Integer.parseInt(Stars);
		Connection connection=null;
		
		User user= (User)request.getSession().getAttribute("user");
		int userid=user.getId();
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(
		            "jdbc:mysql://127.0.0.1:3306/shopping?serverTimezone=UTC&characterEncoding=utf-8",
		            "root",
		            "s19990716");
			String sql="insert into comments(user_id,product_id,content,stars,create_time) values(?,?,?,?,?)";
			PreparedStatement pst= connection.prepareStatement(sql);
			pst.setInt(1, userid);
			pst.setInt(2, productid);
			pst.setString(3, comment);
			pst.setInt(4, stars);
			pst.setDate(5, new Date(System.currentTimeMillis()));
			pst.execute();
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		response.sendRedirect(request.getContextPath()+"/ProductServlet?id="+productid);
		
	}

}
