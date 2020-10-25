package edu.jmi.shop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jmi.shop.bean.ProductCategory;
import edu.jmi.shop.dao.*;

/**
 * Servlet implementation class ProductCategorylistServlet
 */
@WebServlet("/ProductCategorylistServlet")
public class ProductCategorylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductCategorylistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<ProductCategory> list=null;
		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
		list=productCategoryDAO.select();
		request.setAttribute("productCategory", list);
		request.getRequestDispatcher("/admin/productcategory/productcategorylist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
