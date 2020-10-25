package edu.jmi.shop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jmi.shop.dao.ProductDAO;

@WebServlet("/servlet/productdel")
public class ProductDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        //首先获取商品的ID
		String sId = request.getParameter("id");
		int id = Integer.parseInt(sId);
		//其次通过Dao对象删除商品
		ProductDAO productDAO = new ProductDAO();
		productDAO.delete(id);
		//最后跳转回商品列表页面
		response.sendRedirect(request.getContextPath() + "/servlet/productlist");
	}
}
