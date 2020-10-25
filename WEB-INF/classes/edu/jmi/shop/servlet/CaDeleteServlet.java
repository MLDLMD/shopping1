package edu.jmi.shop.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jmi.shop.dao.ProductCategoryDAO;

/**
 * Servlet implementation class CaDeleteServlet
 */
@WebServlet("/CaDeleteServlet")
public class CaDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Id=request.getParameter("id");
		int id=Integer.parseInt(Id);
		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
		boolean t=productCategoryDAO.delete(id);
		System.out.println(t);
		response.sendRedirect(request.getContextPath()+"/ProductCategorylistServlet");
		

	}
}
