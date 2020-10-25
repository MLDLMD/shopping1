package edu.jmi.shop.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jmi.shop.bean.ProductCategory;
import edu.jmi.shop.dao.ProductCategoryDAO;

/**
 * Servlet implementation class CaModifyServlet
 */
@WebServlet("/CaModifyServlet")
public class CaModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ID=request.getParameter("id");
		int id=Integer.parseInt(ID);
		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
		ProductCategory productcategory=productCategoryDAO.selectById(id);
		request.setAttribute("pc", productcategory);
		request.getRequestDispatcher("/admin/productcategory/productcategoryedit.jsp").forward(request, response);
	}


}
