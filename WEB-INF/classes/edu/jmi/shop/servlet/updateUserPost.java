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
 * Servlet implementation class updateUserPost
 */
@WebServlet("/updateUserPost")
public class updateUserPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateUserPost() {
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
		String uName = request.getParameter("userName");
		String email = request.getParameter("email");
		String nName = request.getParameter("nickname");
		String ID=request.getParameter("id");
		int id=Integer.parseInt(ID);
		String pwd=request.getParameter("pwd");
		UserDAO uDAO=new UserDAO();
		User u=new User();
		u.setUserName(uName);
		u.setEmail(email);
		u.setNickName(nName);
		u.setId(id);
		u.setPwd(pwd);
		boolean b=uDAO.update(u);
		if(b==true)
		{
			response.sendRedirect(request.getContextPath()+"/userServlet");
		}
		else 
		{
			response.sendRedirect(request.getContextPath()+"/userServlet");
		}
	}

	
}
