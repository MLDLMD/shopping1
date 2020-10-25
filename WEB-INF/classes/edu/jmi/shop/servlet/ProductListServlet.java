package edu.jmi.shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.jmi.shop.bean.Product;
import edu.jmi.shop.dao.ProductDAO;
import edu.jmi.shop.util.DBPage;

@WebServlet("/servlet/productlist")
public class ProductListServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        //首先获取商品列表访问页的编号，默认为1
		String s = request.getParameter("pageIndex");
		int pageIndex = 1;
		if (s != null) {
			pageIndex = Integer.parseInt(s);
		}
		
		//然后通过Dao对象获取商品列表的分页信息和分页数据
		ProductDAO productDao = new ProductDAO();
		DBPage dbPage = productDao.getPage(pageIndex);
		List<Product> list = productDao.select(dbPage);

		
		//页面的输出
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		out.println("<html>");
		out.println("<head>");
		out.println("<title>产品列表</title>");
		out.println("<meta charset=\"utf-8\" />");
		out.println("</head>");
		out.println("<body>");
		out.println("<a href=" + request.getContextPath() + "/servlet/productadd>增加</a>");
		
		//输出表格，商品列表信息显示在表格上
		out.println("<table width=\"80%\" border=\"1\">");
		//标题列
		out.println("<tr role=\"row\">\r\n" + "<th style=\"width: 20%;\">商品名</th>\r\n"
				+ "<th style=\"width: 8%;\">商品分类</th>\r\n" + "<th style=\"width: 8%;\">店内价格</th>\r\n"
				+ "<th style=\"width: 8%;\">市场价格</th>\r\n" + "<th style=\"width: 8%;\">数量</th>\r\n"
				+ "<th style=\"width: 8%\">热门商品</th>\r\n" + "<th style=\"width: 8%;\">状态</th>\r\n"
				+ "<th style=\"width: 8%;\">更新时间</th>\r\n" + "<th style=\"width: 8%;\">更新者</th>\r\n"
				+ "<th style=\"width: 20%;\">操作</th>\r\n" + "</tr>");
	   //循环遍历商品列表，将每次循环获得的商品对象显示在一行中
		for (Product product : list) {
			out.println("<tr>");
			out.println("<td>" + product.getName() + "</td>");
			out.println("<td>" + product.getCategoryName() + "</td>");
			out.println("<td>" + (product.getShopPrice() / 100.00) + "</td>");
			out.println("<td>" + (product.getPrice() / 100.00) + "</td>");
			out.println("<td>" + product.getQuantity() + "</td>");
			if (product.getHot() == 0) {
				out.println("<td>否</td>");
			} else {
				out.println("<td>是</td>");
			}
			if (product.getProductStatus() == 0) {
				out.println("<td>已上架</td>");
			} else {
				out.println("<td>已下架</td>");
			}
			out.println("<td>" + product.getUpdateTime() + "</td>");
			out.println("<td>" + product.getUpdateUserName() + "</td>");
			out.println("<td><a href=\"" + request.getContextPath() + "/servlet/productedit?id=" + product.getId()
					+ "\">修改</a>&nbsp;&nbsp;<a href=\"" + request.getContextPath() + "/servlet/productdel?id="
					+ product.getId() + "\">删除" + "</a></td>");
			out.println("</tr>");
		}
		out.println("</table>");
	    //输出分页信息
		//如果当前访问页的编号大于1，则显示首页和上一页
		if (pageIndex > 1) {
			out.println(
					"<a href=" + request.getContextPath() + "/servlet/productlist?pageIndex=1>首页" + "</a>&nbsp;");
			out.println("<a href=" + request.getContextPath() + "/servlet/productlist?pageIndex="
					+ (pageIndex - 1) + ">上一页" + "</a>");
			
		}
		//如果当前访问页编号小于总页数，则显示下一页和末页
		if (pageIndex < dbPage.getPageCount()) {
			out.println("<a href=" + request.getContextPath() + "/servlet/productlist?pageIndex="
					+ (pageIndex + 1) + ">下一页" + "</a>");
			out.println(
					"<a href=" + request.getContextPath() + "/servlet/productlist?pageIndex="+dbPage.getPageCount()
							+ ">末页" + "</a>&nbsp;");
		}
		out.println("</body>");
		out.println("</html>");
		out.flush();

	}
}
