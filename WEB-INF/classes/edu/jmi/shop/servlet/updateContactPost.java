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
 * Servlet implementation class updateContactPost
 */
@WebServlet("/updateContactPost")
public class updateContactPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateContactPost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String sName = request.getParameter("name");
		String sMobile = request.getParameter("mobile");
		String sAddress = request.getParameter("address");
		String USER_ID=request.getParameter("user_id");
		int user_id=Integer.parseInt(USER_ID);
		String ID=request.getParameter("id");
		int id=Integer.parseInt(ID);
		UserDAO uDAO=new UserDAO();
		Contact c=new Contact();
		c.setName(sName);
		c.setMobile(sMobile);
		c.setAddress(sAddress);
		c.setId(id);
		boolean b=uDAO.update(c);
		if(b==true)
		{
			response.sendRedirect(request.getContextPath()+"/contactServlet?id="+user_id);
		}
		else 
		{
			response.sendRedirect(request.getContextPath()+"/contactServlet?id="+user_id);
		}
	}
}
