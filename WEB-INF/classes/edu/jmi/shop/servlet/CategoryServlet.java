package edu.jmi.shop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jmi.shop.bean.Product;
import edu.jmi.shop.bean.ProductCategory;
import edu.jmi.shop.dao.ProductCategoryDAO;
import edu.jmi.shop.dao.ProductDAO;
/**
 * Servlet implementation class CategoryServlet
 */
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			String ID=request.getParameter("id");
			String name=request.getParameter("name");
			ProductCategoryDAO productCategoryDao = new ProductCategoryDAO();
			List<ProductCategory> categoryList = productCategoryDao.selectAll();
			int id=Integer.parseInt(ID);
			ProductDAO productDAO =new ProductDAO();
			List<Product> list=productDAO.selectByCategoryId(id, 100);
			request.setAttribute("name", name);
			request.setAttribute("categoryList", categoryList);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/index/category.jsp").forward(request, response);
	}
}
