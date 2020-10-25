package edu.jmi.shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jmi.shop.bean.Product;
import edu.jmi.shop.bean.ProductCategory;
import edu.jmi.shop.dao.ProductCategoryDAO;
import edu.jmi.shop.dao.ProductDAO;

@WebServlet("/servlet/productadd")
public class ProductAddServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title>商品添加</title>");
		out.println("<meta charset=\"utf-8\" />");
		out.println("</head>");
		out.println("<body>");
        //输出表单标签，
		out.println("<form name=\"form_productInfo\" action=\"" + request.getContextPath() + "/servlet/productadd\""
				+ " method=\"post\" >");
		out.println("<label>商品名称</label> <input name=\"name\"" + " type=\"text\" placeholder=\"商品名称\" /><br>");
		//商品分类，商品分类列表项是从数据库取出
		out.println("	<label>所属分类</label> " + "<select  name=\"categoryId\">");
		
		ProductCategoryDAO productCategoryDao = new ProductCategoryDAO();
		List<ProductCategory> list = productCategoryDao.selectAll();
		//遍历商品分类，每条记录作为一个列表项
		for (ProductCategory productCategory : list) {
			out.println("<option value=\"" + productCategory.getId() + "\">" + productCategory.getName() + "</option>");
		}
		out.println("</select><br>");
		out.println("<label>市场价格</label> <input name=\"price\"" + " type=\"text\" placeholder=\"市场价格\" /><br>");
		out.println("<label>店内价格</label> <input name=\"shopPrice\"" + " type=\"text\" placeholder=\"店内价格\" /><br>");
		out.println("<label>商品库存</label> <input name=\"quantity\"" + " type=\"text\" placeholder=\"商品库存\" /><br>");
		out.println("<label>状态</label>" + "	<select name=\"productStatus\">"
				+ " <option value=\"0\" selected>上架</option>" + "	<option value=\"1\">下架</option>" + "</select><br>");
		out.println("<label>是否热销</label>" + "   <div>" + "	<label>" +
				"	<input type=\"radio\" value=\"0\""
				+ "	name=\"hot\" checked />&nbsp;&nbsp;非热门商品"
				+ "	</label>&nbsp;&nbsp; <label> <input type=\"radio\" value=\"1\""
				+ "	 name=\"hot\" />&nbsp;&nbsp;热门商品" + "	</label><br>");
		out.println("<label>商品概要说明</label> <input name=\"generalExplain\""
				+ "	type=\"text\" placeholder=\"商品概要说明\" /><br>");
		out.println("<button type=\"submit\"><strong>保存</strong></button>"
				+ "<button id=\"back\" class=\"btn btn-success\" type=\"button\"\r\n"
				+ "	onclick=\"window.location='history.go(-1)'\">\r\n" + "	<strong>返回</strong>\r\n" + "	</button>");

		out.println("</form>");
		out.println("</body>");
		out.println("</html>");
		out.flush();
	}
	
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

		
		//2.表单数据验证
		if (sName==null   || sName.matches("^.{1,100}$")==false){
			request.getRequestDispatcher("/servlet/productadd").forward(request,response);
			return;
		}
		if (sCategory==null   || sCategory.matches("^\\d{1,7}$")==false){
			request.getRequestDispatcher("/servlet/productadd").forward(request,response);
			return;
		}
		if (sPrice==null   || sPrice.matches("^\\d{1,7}(\\.\\d{1,2})?$")==false){
			request.getRequestDispatcher("/servlet/productadd").forward(request,response);
			return;
		}
		if (sShopPrice==null   || sShopPrice.matches("^\\d{1,7}(\\.\\d{1,2})?$")==false){
			request.getRequestDispatcher("/servlet/productadd").forward(request,response);
			return;
		}
		if (sQuantity==null   || sQuantity.matches("^\\d{1,7}$")==false){
			request.getRequestDispatcher("/servlet/productadd").forward(request,response);
			return;
		}
		if (sProductStatus==null   || sProductStatus.matches("^[01]$")==false){
			request.getRequestDispatcher("/servlet/productadd").forward(request,response);
			return;
		}
		if (sHot==null   || sHot.matches("^[01]$")==false){
			request.getRequestDispatcher("/servlet/productadd").forward(request,response);
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

		// 建立一个DAO对象，将商品插入到数据库中
		ProductDAO productDAO = new ProductDAO();
		boolean b = productDAO.insert(product);
		if (b == true) {
			response.sendRedirect(request.getContextPath() + "/servlet/productlist");
		} else {
			response.sendRedirect(request.getContextPath() + "/servlet/productadd");
		}
	}
}
