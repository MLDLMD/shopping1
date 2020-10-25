package edu.jmi.shop.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jmi.shop.bean.ProductCategory;
import edu.jmi.shop.dao.ProductCategoryDAO;

/**
 * Servlet implementation class CaModifyPostServlet
 */
@WebServlet("/CaModifyPostServlet")
public class CaModifyPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		String description=request.getParameter("description");
		String ID=request.getParameter("id");
		int id=Integer.parseInt(ID);
		ProductCategory pc=new ProductCategory();
		pc.setName(name);
		pc.setDescription(description);
		pc.setId(id);
		pc.setUpdateTime(new Date(System.currentTimeMillis()));
		pc.setUpdateUserId((Integer)request.getSession().getAttribute("userid"));
		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
		productCategoryDAO.update(pc);
		response.sendRedirect(request.getContextPath()+"/ProductCategorylistServlet");
	}

}
