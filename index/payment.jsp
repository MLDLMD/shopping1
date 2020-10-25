<%@ page pageEncoding="UTF-8"%>
<%@page import="java.util.*,edu.jmi.shop.bean.*,edu.jmi.shop.dao.*" %>
<%
        Object o=session.getAttribute("user");
        if (o==null){
        	response.sendRedirect(request.getContextPath()+"/index/login.jsp");
        	return;
        }
        User user=(User)o;   
        OrderInfo orderInfo=new OrderInfo();
        String pat = "yyyyMMddhhmmssSSS";
        java.text.SimpleDateFormat format = new java.text.SimpleDateFormat(pat);
        String orderNum=format.format(new Date())+user.getId();		
        OrderDAO orderDao = new OrderDAO();
        List<OrderItem> list = orderDao.selectOrderItem(user.getId(), "000000");
        int total=0;
        for(OrderItem item:list){
        	item.setOrderNumber(orderNum);
        	orderDao.updateItem(item);
        	total+=item.getPrice()*item.getQuantity();
        }
        orderInfo.setOrderNumber(orderNum);
        orderInfo.setPrice(total);
        orderInfo.setUserId(user.getId());
        orderInfo.setCreateTime(new java.sql.Date(System.currentTimeMillis()));
        orderDao.insertOrder(orderInfo);      
    %>

<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8" />
<title>购物平台-支付</title>

<!-- mobile settings -->
<meta name="viewport"
	content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->

<jsp:include page="include/common.jsp"></jsp:include>
</head>
<body class="smoothscroll enable-animation">
	<!-- wrapper -->
	<div id="wrapper">
		<jsp:include page="include/head.jsp"></jsp:include>
		<section class="page-header page-header-xs">
			<div class="container">
				<h1>支付</h1>

				<ol class="breadcrumb">
					<li><a href="<%=request.getContextPath()%>/index/index.jsp">首页</a></li>
					<li>支付</li>
				</ol>
			</div>
		</section>
		<!-- /PAGE HEADER -->
		<!-- 购物车 -->
		<section>
			<div class="container">
				
				<!-- CART -->
				<div class="row">
					<!-- LEFT -->
					<div class="col-lg-9 col-sm-8">
						<!-- CART -->
						<form class="cartContent clearfix" method="post" action="#">
							<input type="hidden" name="orderNum" value="<%=orderInfo.getOrderNumber()%>">
							<!-- cart content -->
							<div id="cartContent">
								<!-- cart header -->
								<div class="item head clearfix">
									<span class="cart_img"></span> <span
										class="product_name size-13 bold">产品名称</span> <span
										class="remove_item size-13 bold"></span> <span
										class="total_price size-13 bold">合计价格</span> <span
										class="qty size-13 bold">数量</span>
								</div>
								<!-- /cart header -->
								<%							
								    for(OrderItem orderItem:list){	
								%>
									<div class="item">
										<div class="cart_img pull-left width-100 padding-10 text-left">
											<img src="<%=request.getContextPath()%>/<%=orderItem.getProductImg()%>" alt=""
												width="40" />
										</div>
										<a href="<%=request.getContextPath() %>/index/product.jsp?id=<%=orderItem.getProductName()%>"
											class="product_name"> <span>
												<%=orderItem.getProductName()%></span> 
										</a>
										<div name="total_price" class="total_price">
											¥<span><%=orderItem.getQuantity()*orderItem.getPrice()/100.00%>
											</span>
										</div>
										<div class="qty">
										  							    
											<%=orderItem.getQuantity()%>&times;¥<%=orderItem.getPrice()/100.00 %>  
										</div>
										<div class="clearfix"></div>
									</div>
								<%} %>
								<div class='padding-20'>
									<strong style='font-size: 20px'>选择常用联系人</strong>
									<hr/>
									
									<!-- 联系人 -->
								</div>

								<div class='padding-20'>
									<strong style='font-size: 20px'>请选择支付方式</strong>
									<hr />
									<div>
										<a onclick="payTreasure(1)" href="javascript:void(0);"><img src='<%=request.getContextPath()%>/resources/pc/assets/images/pay/pc_wxqrpay.png' /></a> 
										<a onclick="payTreasure(0)" href="javascript:void(0);"><img src='<%=request.getContextPath()%>/resources/pc/assets/images/pay/alipaypcnew.png' /></a>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<!-- /cart content -->
						</form>
						<!-- /CART -->
					</div>
					<!-- RIGHT -->
					<div class="col-lg-3 col-sm-4">
					<c:if test="${!empty payment.contectList}">
						<div class="toggle active">
							<div class='toggle-content' style='display: block;'>
								<div>
									<span class="clearfix"> <span id="sumCart" class="pull-right">￥<%=orderInfo.getPrice()/100.00 %></span>
										<strong class="pull-left">商品总价:</strong>
									</span> <span class="clearfix"> <span class="pull-right">包邮</span>
										<span class="pull-left">物流费用:</span>
									</span>

									<hr />
					
									<span class="clearfix"> <span class="pull-right size-20">￥<%=orderInfo.getPrice()/100.00 %></span>
										<strong class="pull-left">合计金额:</strong>
									</span>
								</div>
							</div>
						</div>
					</c:if>
					</div>
				</div>
			</div>
		</section>
		<jsp:include page="include/footer.jsp"></jsp:include>
	</div>
	<!-- /wrapper -->
	<!-- JAVASCRIPT FILES -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/pc/assets/js/common.js"></script>
	<script src="<%=request.getContextPath()%>/resources/pc/assets/js/toastr/build/toastr.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/pc/assets/js/swiper.min.js"></script>
</body>
<script type="text/javascript">
//支付功能
function payTreasure(Obj){
	//收集联系人数据 
	var val = $('input:radio[name=product-review-vote]:checked').val();
	var orderItem={};
	var order = {};
	var contect = {};
	contect["id"]=val;
	contect["paymentType"]=Obj;
	order["contect"]=contect;
	$.ajax({
		type : "POST",
		contentType : 'application/json;charset=utf-8',
		url : "${pageContext.request.contextPath}/pc/payment/order?${_csrf.parameterName}=${_csrf.token}",
		data: JSON.stringify(order),
		dataType : "json", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）  
		async : false,
		success : function(json) {
			//errorCode为0则为成功
			if(json.errorCode==0){
				toastr.success("支付成功，2秒钟后跳转到订单历史");
				setTimeout(function(){
					window.location.href="${pageContext.request.contextPath}/pc/account/order/list?${_csrf.parameterName}=${_csrf.token}";	
				}, 2000);
			}else{
				toastr.success("支付失败");
			}
		},
		error : function(json) {
			toastr.success("支付失败");
		}
	});
}
</script>
</html>
