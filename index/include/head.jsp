<%@page import="com.sun.org.apache.xpath.internal.compiler.Keywords"%>
<%@ page pageEncoding="UTF-8" import="edu.jmi.shop.bean.User"%>

<%
    Object o=session.getAttribute("user");
    User user=(User)o;
   
%>
<!-- Top Bar -->
<div id="topBar">
	<div class="container">
		<!-- rightttt -->
		<ul class="top-links list-inline pull-right">
		<li class="text-welcome hidden-xs">在线人数：<strong><%=application.getAttribute("cnt")%></strong></li>
		<li class="text-welcome hidden-xs">在线登录人数：<strong>
		<%
		   if (application.getAttribute("onlineLoingUserCnt")==null){
			   out.println(0);
		   }else{
			   out.println(application.getAttribute("onlineLoingUserCnt"));
		   }
		%>
		</strong>
		</li>
		<%if (user!=null){ %>
			<li class="text-welcome hidden-xs">欢迎 <strong><%=user.getUserName()%></strong></li>
			<li>
					<a class="dropdown-toggle no-text-underline"
						data-toggle="dropdown" href="#"><i class="fa fa-user hidden-xs"></i>
							会员中心</a>
			   
				<ul class="dropdown-menu pull-right">
					<li><a tabindex="-1" href="${pageContext.request.contextPath}/myOrderServlet"><i class="fa fa-history"></i>订单历史</a></li>
					<li class="divider"></li>
					<li><a tabindex="-1" href="${pageContext.request.contextPath}/favoriteServlet"><i class="fa fa-bookmark"></i>收藏夹</a></li>
					<li><a tabindex="-1" href="${pageContext.request.contextPath}/contactServlet"><i class="fa fa-edit"></i>常用联系人</a></li>
					<li><a tabindex="-1" href="${pageContext.request.contextPath}/index/user_setting.jsp"><i class="fa fa-cog"></i>个人设置</a></li>
					<li class="divider"></li>  
					<li><a tabindex="-1" href="${pageContext.request.contextPath}/index/logout.jsp"><i class="glyphicon glyphicon-off"></i>退出</a></li>
				</ul></li>
			 <%}else{ %>
				<li class="hidden-xs"><a class='sysBuilding' href="${pageContext.request.contextPath}/index/register.jsp">注册</a></li>
				<li class="hidden-xs"><a class='sysBuilding'
					href="${pageContext.request.contextPath}/index/login.jsp">登录</a></li>
			<%} %>
		</ul>
	</div>
</div>
<!-- /Top Bar -->

<div id="header" class="sticky clearfix">
	<!-- TOP NAV -->
	<header id="topNav">
		<div class="container">

			<!-- Mobile Menu Button -->
			<button class="btn btn-mobile" data-toggle="collapse"
				data-target=".nav-main-collapse">
				<i class="fa fa-bars"></i>
			</button>

			<!-- BUTTONS -->
			<ul class="pull-right nav nav-pills nav-second-main">

				<!-- QUICK SHOP CART -->
				<li class="quick-cart"><a href="${pageContext.request.contextPath}/index/cartview.jsp"> <span
						id="cartItems" class="badge badge-aqua btn-xs badge-corner"></span>
							<%if (user!=null){ %>
							<i class="fa fa-shopping-cart"></i>
					   <%} %>
				</a>
					</li>
			</ul>
			<div class='row'>
				<div class='col-lg-3 col-sm-3'>
					<a class="logo pull-left" href="${pageContext.request.contextPath}/index/index.jsp"> <img
						src="${pageContext.request.contextPath}/resources/pc/assets/images/logo.jpg" />
					</a>
				</div>
				<div class='col-lg-6 col-sm-6' style='padding-top: 30px'>

					<div class="search-box" style="display: block;">
						<form id='searchForm'
							onkeydown="if(event.keyCode==13)return false;"
							action="<%=request.getContextPath()%>/SeachAction?" method="get">
							<div class="input-group">
								<input type="text" name='keyword' placeholder="请输入查询关键字"
									class="form-control">
									 <span
									class="input-group-btn">
									<button id="searchButton" class="btn btn-primary" type="submit">搜索</button>
								</span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</header>
<%-- 	<script src="${pageContext.request.contextPath}/resources/pc/assets/js/jquery.js"></script> --%>
	<script src="${pageContext.request.contextPath}/resources/pc/assets/js/common.js"></script>


</div>