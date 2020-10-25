package edu.jmi.shop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jmi.shop.bean.User;
import edu.jmi.shop.dao.UserDAO;

/**
 * Servlet implementation class userServlet
 */
@WebServlet("/userServlet")
public class userServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		final int recCountInPage=10;//每页的记录数
	    int pageIndex=1;//当前页面
	    int recordCount=0;//总记录数
	    int pageCount=0;//总页数
	    int start=0;//当页开始记录数
	    int end=0;//当页结束记录数
	    List<User> list=null;
		
		String s=request.getParameter("pageIndex");			//获取当前页码
		if (s!=null){
			pageIndex=Integer.parseInt(s);
		}
		UserDAO uDAO=new UserDAO();
		recordCount=uDAO.recordCount();
			
		pageCount=recordCount/recCountInPage+(recordCount%recCountInPage==0?0:1);   //计算分页信息
		start=(pageIndex-1)*recCountInPage+1;
		end=pageIndex*recCountInPage;
		end=end>recordCount?recordCount:end;
			
		list=uDAO.selectAll(start, recCountInPage);
			
		request.setAttribute("recCountInPage", recCountInPage);//数据传回
		request.setAttribute("pageIndex", pageIndex);
		request.setAttribute("recordCount", recordCount);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("userList", list);
		request.getRequestDispatcher("admin/user/User.jsp").forward(request, response);
		
	}


}
