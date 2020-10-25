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
 * Servlet implementation class delContact
 */
@WebServlet("/delContact")
public class delContact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delContact() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		Contact c=new Contact();
		UserDAO uDAO=new UserDAO();
		c.setId(Integer.parseInt(id));
		int user_id=uDAO.user_id(Integer.parseInt(id));
		boolean b=uDAO.delete(c);
		if (b==true)
			response.sendRedirect(request.getContextPath()+"/contactServlet?id="+user_id);
		else 
			response.sendRedirect(request.getContextPath()+"/contactServlet?id="+user_id);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
