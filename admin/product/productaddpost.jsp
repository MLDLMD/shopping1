<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../priv.jsp" %>
<%@ page import="java.util.regex.*,java.sql.*" %>
<%

    //1.提取表单数据
	//request.setCharacterEncoding("utf-8");
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
		request.getRequestDispatcher("productadd.jsp").forward(request,response);
		return;
	}
	if (sCategory==null   || sCategory.matches("^\\d{1,7}$")==false){
		request.getRequestDispatcher("productadd.jsp").forward(request,response);
		return;
	}
	if (sPrice==null   || sPrice.matches("^\\d{1,7}(\\.\\d{1,2})?$")==false){
		request.getRequestDispatcher("productadd.jsp").forward(request,response);
		return;
	}
	if (sShopPrice==null   || sShopPrice.matches("^\\d{1,7}(\\.\\d{1,2})?$")==false){
		request.getRequestDispatcher("productadd.jsp").forward(request,response);
		return;
	}
	if (sQuantity==null   || sQuantity.matches("^\\d{1,7}$")==false){
		request.getRequestDispatcher("productadd.jsp").forward(request,response);
		return;
	}
	if (sProductStatus==null   || sProductStatus.matches("^[01]$")==false){
		request.getRequestDispatcher("productadd.jsp").forward(request,response);
		return;
	}
	if (sHot==null   || sHot.matches("^[01]$")==false){
		request.getRequestDispatcher("productadd.jsp").forward(request,response);
		return;
	}
	int price=(int)Double.parseDouble(sPrice)*100;
	int shopPrice=(int)Double.parseDouble(sShopPrice)*100;
	
	//3.插入数据库
	Connection c=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		c = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/shopping?serverTimezone=UTC", "root",
				"s19990716");
		String sql = "insert into product(name,category_id,price,shop_price,quantity,product_status,hot,general_explain,update_time,update_user_id)" +
				     "values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pst = c.prepareStatement(sql);
		pst.setString(1, sName);
		pst.setString(2, sCategory);
		pst.setInt(3, price);
		pst.setInt(4,shopPrice);
		pst.setString(5, sQuantity);
		pst.setString(6, sProductStatus);
		pst.setString(7, sHot);
		pst.setString(8, sGeneralExplain);
		pst.setTimestamp(9, new Timestamp(System.currentTimeMillis()));
		pst.setString(10, session.getAttribute("userid").toString());
		pst.execute();
		response.sendRedirect(request.getContextPath()+"/admin/product/productlist.jsp");
	} catch (Exception ex) {
		ex.printStackTrace();
		request.getRequestDispatcher(request.getContextPath()+"/admin/product/productadd.jsp").forward(request,response);
	} finally {
		try {
			if (c!=null){
			  c.close();
			}
		} catch (Exception ex) {

		}
	}
	
	
%>