package edu.jmi.shop.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import edu.jmi.shop.bean.Product;
import edu.jmi.shop.dao.SearchDAO;
import java.util.*;
/**
 * Servlet implementation class SeachAction
 */
@WebServlet("/SeachAction")
public class SeachAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeachAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String str=null;
		str=(String)(request.getParameter("keyword"));
		SearchDAO sh=new SearchDAO();
		ArrayList<Product> list=sh.Search(str);
		request.getSession().setAttribute("list",list);
		response.sendRedirect(request.getContextPath()+"/index/searchPage.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
