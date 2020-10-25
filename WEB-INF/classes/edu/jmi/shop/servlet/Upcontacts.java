package edu.jmi.shop.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jmi.shop.bean.Contact;
import edu.jmi.shop.dao.UserDAO;

/**
 * Servlet implementation class Upcontacts
 */
@WebServlet("/Upcontacts")
public class Upcontacts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upcontacts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String Id=request.getParameter("id");
    	int id=Integer.parseInt(Id);
		String mobile = request.getParameter("mobile");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		Contact c=new Contact();
		UserDAO uDAO=new UserDAO();
		c.setUserid(id);
		c.setAddress(address);
		c.setMobile(mobile);
		c.setName(name);
		boolean b=uDAO.update(c);
		if (b==true)
			response.sendRedirect(request.getContextPath()+"/contactServlet?id="+id);
		else 
			response.sendRedirect(request.getContextPath()+"/contactServlet?id="+id);
	}
	}

