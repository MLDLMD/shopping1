package edu.jmi.shop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jmi.shop.bean.Contact;
import edu.jmi.shop.dao.UserDAO;

/**
 * Servlet implementation class contactServlet
 */
@WebServlet("/contactServlet")
public class contactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
    	String Id=request.getParameter("id");
    	int id=Integer.parseInt(Id);
	    List<Contact> list=null;
		UserDAO uDAO=new UserDAO();
		list=uDAO.selectById_ca(id);
		request.setAttribute("Contact", list);
		request.getRequestDispatcher("/index/contact.jsp").forward(request, response);
		
	}

}
