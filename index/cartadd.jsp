<%@ page pageEncoding="UTF-8"%>
<%@page import="java.util.*,edu.jmi.shop.bean.*,edu.jmi.shop.dao.*" %>
<%
    Object o=session.getAttribute("user");
    if (o==null){
    	response.sendRedirect(request.getContextPath()+"/index/login.jsp");
    	return;
    }
    User user=(User)o;
    
    String s=request.getParameter("productid");
    int productId=Integer.parseInt(s);
    s=request.getParameter("price");
    int price=Integer.parseInt(s);
    s=request.getParameter("number");
    int quantity=Integer.parseInt(s);
    
    OrderItem orderItem=new OrderItem();
    orderItem.setId(System.currentTimeMillis()+"");
    orderItem.setOrderNumber("000000");
    orderItem.setProductId(productId);
    orderItem.setPrice(price);
    orderItem.setQuantity(quantity);
    orderItem.setUserId(user.getId());
    OrderDAO orderDao=new OrderDAO();
    
  
    boolean bSave=orderDao.insertItem(orderItem);
    if (bSave==true){
    	s=request.getParameter("flag");
    	if ("1".equals(s)){
    		response.sendRedirect(request.getContextPath()+"/index/product.jsp?id="+productId);
        	return;
    	}else{
    		response.sendRedirect(request.getContextPath()+"/index/cartview.jsp");
        	return;	
    	}
    }else{
    	response.sendRedirect(request.getContextPath()+"/index/product.jsp?id="+productId);
    	return;
    }
%>