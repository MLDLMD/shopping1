package edu.jmi.shop.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jmi.shop.bean.Page;
import edu.jmi.shop.bean.Product;
import edu.jmi.shop.dao.WishDAO;

/**
 * Servlet implementation class favoriteServlet
 */
@WebServlet("/favoriteServlet")
public class favoriteServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		try{
		Page page=new Page();
		String user_id=request.getParameter("user_id");
		WishDAO wish=new WishDAO();
		List<Product> list=wish.wishList(user_id);
		List<Product> list2=new ArrayList<Product>();
		String c=request.getParameter("page_num");
		String d=request.getParameter("Spage");//跳转到第...页
		int page_num;
		int Spage;
		if(c.equals("")){
			page_num=10;
		}else
			page_num=Integer.parseInt(c);
		if(d.equals("")){
			Spage=1;
		}else
			Spage=Integer.parseInt(d);
		int pageCount=list.size()/page_num+1;
		int pageNow=Spage;
		
		int pageBefore=Spage-1;
		int pageNext;
		if(list.size()<=10){
			pageNext=1;
		}else
    	pageNext=Spage+1;
		int first=1;
		int last;
		if(list.size()%page_num==0){
			last=list.size()/page_num;
		}else
			last=list.size()/page_num+1;
		page.setPage_num(page_num);
		page.setFirst(first);
		page.setLast(last);
		page.setPageBefore(pageBefore);
		page.setPageNext(pageNext);
		page.setPageNow(pageNow);
		page.setPageCount(pageCount);
		page.setUser_id(user_id);
		if(list.size()<Spage*page_num)
			for(int i=(Spage-1)*page_num;i<list.size();i++){
				Product e=(Product)list.get(i);
				list2.add(e);
			}else
			for(int i=(Spage-1)*page_num;i<Spage*page_num;i++){
				Product e=(Product)list.get(i);
			list2.add(e);
			}
		request.setAttribute("list", list2);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/index/NewFile1.jsp").forward(request,response);
		}catch(Exception ex){
			ex.printStackTrace();
	
			Page page=new Page();
			String user_id=request.getParameter("user_id");
			WishDAO wish=new WishDAO();
			List<Product> list=wish.wishList("123486");
			List<Product> list2=new ArrayList<Product>();
			String c=request.getParameter("page_num");
			String d=request.getParameter("Spage");//跳转到第...页
			int page_num=10;
			int Spage=1;
			
			int pageCount=list.size()/page_num+1;
			int pageNow=Spage;
			
			int pageBefore=Spage-1;
			int pageNext;
			if(list.size()<=10){
				pageNext=1;
			}else
	    	pageNext=Spage+1;
			int first=1;
			int last;
			if(list.size()%page_num==0){
				last=list.size()/page_num;
			}else
				last=list.size()/page_num+1;
			page.setPage_num(page_num);
			page.setFirst(first);
			page.setLast(last);
			page.setPageBefore(pageBefore);
			page.setPageNext(pageNext);
			page.setPageNow(pageNow);
			page.setPageCount(pageCount);
			page.setUser_id(user_id);
			if(list.size()<Spage*page_num)
				for(int i=(Spage-1)*page_num;i<list.size();i++){
					Product e=(Product)list.get(i);
					list2.add(e);
				}else
				for(int i=(Spage-1)*page_num;i<Spage*page_num;i++){
					Product e=(Product)list.get(i);
				list2.add(e);
				}
			request.setAttribute("list", list2);
			request.setAttribute("page", page);
			request.getRequestDispatcher("/index/favorites.jsp").forward(request,response);
		}
	}
}
