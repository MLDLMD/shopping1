<%@ page pageEncoding="UTF-8"%>
<%@page import="java.util.*,edu.jmi.shop.bean.*,edu.jmi.shop.dao.*"%>
<jsp:include page="priv.jsp"/>
<%
	String Path = request.getContextPath();
	Object o = session.getAttribute("user");
	if (o == null) {
		response.sendRedirect(request.getContextPath() + "/index/login.jsp");
		return;
	}
	User user = (User) o;
	OrderDAO orderDao = new OrderDAO();
	List<OrderItem> list = orderDao.selectOrderItem(user.getId(), "000000");
%>

<!DOCTYPE html>
<!--[if IE 8]>			<html class="ie ie8"> <![endif]-->
<!--[if IE 9]>			<html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html>
<!--<![endif]-->
<head>
<meta charset="utf-8" />
<title>购物平台</title>

<!-- mobile settings -->
<meta name="viewport"
	content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />


<jsp:include page="include/common.jsp"></jsp:include>
</head>
<body class="smoothscroll enable-animation">
	<!-- wrapper -->
	<div id="wrapper">
		<jsp:include page="include/head.jsp"></jsp:include>
		<section class="page-header page-header-xs">
			<div class="container">
				<h1>我的购物车</h1>
				<ol class="breadcrumb">
					<li><a href="<%=request.getContextPath()%>/index/index.jsp">首页</a></li>
					<li>购物车</li>
				</ol>
			</div>
		</section>
		<!-- /PAGE HEADER -->
		<!-- 购物车 -->
		<section>
			<div class="container">

				<!-- 如果购物车为空 -->
				<!-- CART -->
				<div class="row">
					<!-- LEFT -->
					<div class="col-lg-9 col-sm-8">
						<!-- CART -->
						<form class="cartContent clearfix" method="post" action="#">
							<!-- cart content -->
							<div id="cartContent">
								<!-- cart header -->
								<%
									if (list.size() > 0) {
								%>

								<div class="item head clearfix">
									<span class="cart_img"></span>
									<span class="product_name size-13 bold">产品名称</span>
									<span class="remove_item size-13 bold"></span> 
									<span class="total_price size-13 bold">合计价格</span>
									<span class="qty size-13 bold">数量</span>
								</div>
								<%
									} else {
								%>
								<!-- /cart header -->

								<div id="msgDiv" class="panel panel-default">
									<div class="panel-body">
										<strong style='font-size: 25px'>购物车里无商品!</strong><br />
										随便看看，优惠多多，赶紧抢购吧！
									</div>
								</div>
								<%
									}
								    double total=0;
								    for(OrderItem orderItem:list){
								    	total+=orderItem.getPrice()*orderItem.getQuantity()/100.00;
								    	
								%>
								
									<div class="item">
										<div class="cart_img pull-left width-100 padding-10 text-left">
											<img src="<%=request.getContextPath()%>/<%=orderItem.getProductImg()%>" alt=""
												width="40" />
										</div>
										<a href="<%=request.getContextPath() %>/index/product.jsp?id=<%=orderItem.getProductName()%>"
											class="product_name"> 
											<span><%=orderItem.getProductName()%></span> 
										</a> 
										<a href="<%=Path%>/OrderItemDeleteAction?id=<%= orderItem.getId() %>" 
											name="removeItem" 
											zid="<%=orderItem.getId() %>"
											zprice="<%=orderItem.getPrice()/100.00%>" class="remove_item">
											<i class="fa fa-times"></i>
										</a>
										<div name="total_price" class="total_price">
											¥<span><%=orderItem.getQuantity()*orderItem.getPrice()/100.00%></span>
										</div>
										<div class="qty">
											<input type="number" value="<%=orderItem.getQuantity()%>"
												zprice="<%=orderItem.getQuantity()*orderItem.getPrice()/100.00%>" 
												zid="<%=orderItem.getId()%>"
												zpid="<%=orderItem.getProductId()%>" 
												name="qty" maxlength="3"
												max="999" min="1" /> &times; ¥
												<%=orderItem.getPrice()/100.00 %>
										</div>
										<div class="clearfix"></div>
									</div>
								<%} %>
								<%
									if (list.size() > 0) {
								%>
									<button id="updateCart" type="button"
										onclick="window.location='<%=request.getContextPath() %>/';"
										class="btn btn-success margin-top-20 pull-right noradius">
										<i class="glyphicon glyphicon-ok"> </i> 更新购物车
									</button>
									<button id="removeCart" type="button"
										onclick="window.location='<%=Path%>/OrderItemDeleteAllAction';"
										class="btn btn-danger margin-top-20 pull-right noradius">
										<i class="glyphicon glyphicon-remove"> </i> 清空购物车
									</button>
								<%} %>
								<!-- /update cart -->
								<div class="clearfix"></div>
							</div>
							<!-- /cart content -->

						</form>
						<!-- /CART -->
					</div>
					<!-- RIGHT -->
					<div class="col-lg-3 col-sm-4">
						<div>
							<div>
								<%
									if (list.size() > 0) {
								%>
									<div class="hideDiv">
										<span class="clearfix"> <span id="sumCart"
											class="pull-right"> ¥<%=total %>
										</span> <strong class="pull-left">商品总价:</strong>
										</span> <span class="clearfix"> <span class="pull-right">包邮</span>
											<span class="pull-left">物流费用:</span>
										</span>
										<hr />
										<span class="clearfix"> <span
											class="pull-right size-20"> ¥<%=total %></span> <strong class="pull-left">合计金额:</strong>
										</span>
										<hr />
										<button id="payCart" type="button" onclick="window.location='<%=request.getContextPath() %>/index/payment.jsp';"
											class="btn btn-success margin-top-20 pull-right noradius">
											<i class="glyphicon glyphicon-ok"> </i> 立即支付
										</button>
									</div>
							<%} %>
							</div>
						</div>
					</div>
				</div>
				<!-- /CART -->
			</div>
		</section>
		<!-- /购物车 -->
		<jsp:include page="include/footer.jsp"></jsp:include>
	</div>
	<!-- /wrapper -->
	<!-- JAVASCRIPT FILES -->
	<script
		src="<%=request.getContextPath()%>/resources/pc/assets/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/pc/assets/js//bootstrap-touchspin-master/src/jquery.bootstrap-touchspin.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/pc/assets/js/swiper.min.js"></script>
	<script>
		<script type="text/javascript">
		$('input[name="number"]').TouchSpin({
			min : 1,
			max : 999,
			step : 1,
			boostat : 5,
			maxboostedstep : 10
		});
	</script>
</body>
</html>