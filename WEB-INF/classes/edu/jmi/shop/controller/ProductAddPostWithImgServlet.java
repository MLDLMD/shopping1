package edu.jmi.shop.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import edu.jmi.shop.bean.Product;
import edu.jmi.shop.dao.ProductDAO;

@WebServlet("/admin/product/productaddwithimage")
@MultipartConfig
public class ProductAddPostWithImgServlet extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.提取表单数据
		request.setCharacterEncoding("utf-8");
		String sName = request.getParameter("name");
		String sCategory = request.getParameter("categoryId");
		String sPrice = request.getParameter("price");
		String sShopPrice = request.getParameter("shopPrice");
		String sQuantity = request.getParameter("quantity");
		String sProductStatus = request.getParameter("productStatus");
		String sHot = request.getParameter("hot");
		String sGeneralExplain = request.getParameter("generalExplain");
       
	
		// 2.表单数据验证
		if (sName==null   || sName.matches("^.{1,100}$")==false){
			request.getRequestDispatcher("/admin/product/productadd.jsp").forward(request,response);
			return;
		}
		if (sCategory==null   || sCategory.matches("^\\d{1,7}$")==false){
			request.getRequestDispatcher("/admin/product/productadd.jsp").forward(request,response);
			return;
		}
		if (sPrice==null   || sPrice.matches("^\\d{1,7}(\\.\\d{1,2})?$")==false){
			request.getRequestDispatcher("/admin/product/productadd.jsp").forward(request,response);
			return;
		}
		if (sShopPrice==null   || sShopPrice.matches("^\\d{1,7}(\\.\\d{1,2})?$")==false){
			request.getRequestDispatcher("/admin/product/productadd.jsp").forward(request,response);
			return;
		}
		if (sQuantity==null   || sQuantity.matches("^\\d{1,7}$")==false){
			request.getRequestDispatcher("/admin/product/productadd.jsp").forward(request,response);
			return;
		}
		if (sProductStatus==null   || sProductStatus.matches("^[01]$")==false){
			request.getRequestDispatcher("/admin/product/productadd.jsp").forward(request,response);
			return;
		}
		if (sHot==null   || sHot.matches("^[01]$")==false){
			request.getRequestDispatcher("/admin/product/productadd.jsp").forward(request,response);
			return;
		}

		int price = (int) (Double.parseDouble(sPrice) * 100);
		int shopPrice = (int) (Double.parseDouble(sShopPrice) * 100);
		int categoryId = Integer.parseInt(sCategory);
		int quantity = Integer.parseInt(sQuantity);
		int hot = Integer.parseInt(sHot);
		int productStatus = Integer.parseInt(sProductStatus);
       
		
		// 将用户的输入封装到Product对象中
		Product product = new Product();
		product.setName(sName);
		product.setCategoryId(categoryId);
		product.setPrice(price);
		product.setShopPrice(shopPrice);
		product.setQuantity(quantity);
		product.setHot(hot);
		product.setProductStatus(productStatus);
		product.setGeneralExplain(sGeneralExplain);
		
		int userid = (int) request.getSession().getAttribute("userid");
		product.setUpdateUserId(userid);
		product.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		 
		Part part=request.getPart("defaultImg");
		if (part!=null) {
			String realPath=request.getServletContext().getRealPath("/resources/upload");
			String fileName=System.currentTimeMillis()+".jpg";
			part.write(realPath+"/"+fileName);
			product.setDefaultImg("/resources/upload/"+fileName);
		}

		// 建立一个DAO对象，将商品插入到数据库中
		ProductDAO productDAO = new ProductDAO();
		boolean b = productDAO.insert(product);
		if (b == true) {
			response.sendRedirect(request.getContextPath() + "/admin/product/productlist.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/admin/product/productadd.jsp");
		}
	}
}
