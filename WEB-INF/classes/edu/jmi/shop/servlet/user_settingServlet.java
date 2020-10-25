package edu.jmi.shop.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jmi.shop.bean.User;
import edu.jmi.shop.dao.UserDAO;

/**
 * Servlet implementation class user_settingServlet
 */
@WebServlet("/user_settingServlet")
public class user_settingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_settingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s=request.getParameter("id");
		int id =Integer.parseInt(s);
		String nickName=request.getParameter("nickName");
		String email=request.getParameter("email");
		User u = new User();
		UserDAO uDAO=new UserDAO();
		u.setId(id);
		u.setNickName(nickName);
		u.setEmail(email);
		boolean b = uDAO.update_pc(u);
		if (b==true)
			response.sendRedirect("index/user_setting.jsp?id="+id);
		else 
			response.sendRedirect("index/user_setting.jsp?id="+id);
	}

}
