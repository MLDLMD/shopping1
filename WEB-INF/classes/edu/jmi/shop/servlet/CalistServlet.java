package edu.jmi.shop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jmi.shop.bean.ProductCategory;
import edu.jmi.shop.dao.ProductCategoryDAO;

/**
 * Servlet implementation class CalistServlet
 */
@WebServlet("/CalistServlet")
public class CalistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
		List<ProductCategory> list=productCategoryDAO.selectAll();
		request.setAttribute("productCategory", list);
		request.getRequestDispatcher("/admin/productcategory/productcategorylist.jsp").forward(request, response);
		
	}



}