package edu.jmi.shop.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jmi.shop.bean.Comments;
import edu.jmi.shop.bean.Product;
import edu.jmi.shop.dao.ProductDAO;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sId = request.getParameter("id");
		int id = Integer.parseInt(sId);

		Cookie[] cookies = request.getCookies();
		boolean bFind = false;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("browsehistory")) {
				String value = cookie.getValue();
				if (value.indexOf(sId) < 0) {
					Cookie co = new Cookie("browsehistory", sId + "-" + value);
					co.setMaxAge(60 * 60 * 24 * 30);
					response.addCookie(co);
					break;
				}
				bFind = true;
			}
		}
		if (bFind == false) {
			Cookie co = new Cookie("browsehistory", sId);
			co.setMaxAge(60 * 60 * 24 * 30);
			response.addCookie(co);
		}
		Connection c=null;
		List<Comments> list=new ArrayList();
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			c = DriverManager.getConnection(
		            "jdbc:mysql://127.0.0.1:3306/shopping?serverTimezone=UTC&characterEncoding=utf8",
		            "root",
		            "s19990716");
			String sql="select shopping.comments.*,shopping.user.user_name from shopping.comments,shopping.user where product_id=? and shopping.user.id=shopping.comments.user_id";
			PreparedStatement pst= c.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				Comments comment=new Comments();
				comment.setProductid(rs.getInt("product_id"));
				comment.setUserid(rs.getInt("user_id"));
				comment.setStars(rs.getInt("stars"));
				comment.setContent(rs.getString("content"));
				comment.setUsername(rs.getString("user_name"));
				list.add(comment);
				
			}
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally
		{
			
			try {
				c.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
				
		}
		

		ProductDAO productDAO = new ProductDAO();
		Product product = productDAO.selectById(id);
		request.setAttribute("p", product);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/index/product.jsp").forward(request, response);
		
	}

}