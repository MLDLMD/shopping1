<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"  %>
<%@ page import="java.util.*,edu.jmi.shop.bean.*,edu.jmi.shop.dao.*"%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物平台</title>
<jsp:include page="include/common.jsp"></jsp:include>

</head>

<body class="smoothscroll enable-animation">
	
	<!-- wrapper -->
	<div id="wrapper">
	
		<jsp:include page="include/head.jsp"></jsp:include>
		<section class="page-header page-header-xs">
			<div class="container">
				
				
				
	
				
				
				<table width="500px" height="150px">
				<tr><td colspan="4"><h1>个人中心</h1></td></tr>
				<tr>
				<td><a href="${pageContext.request.contextPath}/myOrderServlet?id=${user.id }">历史订单</a></td>
				<td><a href="${pageContext.request.contextPath}/favoriteServlet?id=${user.id }">收藏夹</a></td>
				<td><a href="${pageContext.request.contextPath}/contactServlet?id=${user.id }">常用联系人</a></td>
				<td><a href="${pageContext.request.contextPath}/index/user_setting.jsp?id=${user.id }"><b>个人信息设置</b></a></td>
				</tr>
				</table>
				
			</div>
		</section>
		<!-- /PAGE HEADER -->
		<!-- -->
		<section>
			<div class="container">
		
				<div class="row">
				
					<!-- RIGHT -->
					<div class="col-lg-9 col-md-9 col-sm-9">
					
						<div class="row">
				
							<!-- IMAGE -->
							<div class="col-lg-6 col-sm-6">
							
	
<br>
<div style="width:1000px;padding:0">
	<table class="table table-hover" >
		   <caption>我的订单</caption>
		   <thead>
			<tr><th colspan="5">
<a href="myOrderServlet?user_id=${page.user_id}&page_num=${page.page_num}">全部订单</a>&nbsp;&nbsp;
<a href="myOrderServlet?user_id=${page.user_id}&page_num=${page.page_num}&payment_flag=${0}&Spage=${1}">未支付订单</a>&nbsp;&nbsp;
<a href="myOrderServlet?user_id=${page.user_id}&page_num=${page.page_num}&payment_flag=${1}&Spage=${1}">支付订单</a>
				</th></tr>
			<tr> 
				<th>订单编号</th>
				<th>联系人</th>		
				<th>联系电话</th>		
				<th>订单状态</th>
				<th>总价</th>
			</tr>
		    </thead>
	
		<tbody>
			<c:forEach items="${list}" var="list">
               <tr>
                    <td>${list.orderNumber}</td>
                    <td>${list.contactName}</td>
                    <td>${list.contactMobile}</td>
                    <c:if test="${list.status==0}">
                    <td>未付款</td>
                    </c:if>
                    <c:if test="${list.status==1}">
                    <td>已下单</td>
                    </c:if>
                    <c:if test="${list.status==2}">
                    <td>正在配送</td>
                    </c:if>
                    <c:if test="${list.status==3}">
                    <td>已寄到</td>
                    </c:if>
                    <td>${list.price}</td>
                    </tr>
              </c:forEach>
    		</tbody>  
 		</table>
	</div>
<table><tr>
<td><a href="myOrderServlet?user_id=${page.user_id}&page_num=${page.page_num}&payment_flag=${page.payment_flag}&Spage=${page.first}">首页</a></td>
<c:if test="${page.pageNow>1}">
<td><a href="myOrderServlet?user_id=${page.user_id}&payment_flag=${page.payment_flag}&Spage=${page.pageBefore}">上一页</a></td>
</c:if>
<c:if test="${page.pageNow<page.last}">
<td><a href="myOrderServlet?user_id=${page.user_id}&page_num=${page.page_num}&payment_flag=${page.payment_flag}&Spage=${page.pageNext}">下一页</a></td>
</c:if>

<td><a href="myOrderServlet?user_id=${page.user_id}&page_num=${page.page_num}&payment_flag=${page.payment_flag}&Spage=${page.last}">末页</a></td>
</tr></table>
<p>总共${page.last}页，当前第${page.pageNow }页，跳转至<select name= "select2" onchange="window.location=this.value;">
	<option value=""></option>
	<c:forEach var="i" begin="1" end="${page.last }">
	<option value="${pageContext.request.contextPath }/myOrderServlet?user_id=${page.user_id}&page_num=${page.page_num }&payment_flag=${page.payment_flag}&Spage=${i}">${i}</option>
	
	</c:forEach>
</select>
页</p>	
								<!-- Thumbnails (required height:100px) -->
								<div data-for="zoom-primary"
									class="zoom-more owl-carousel owl-padding-3 featured"
									data-plugin-options='{"singleItem": false, "autoPlay": false, "navigation": true, "pagination": false}'></div>
								<!-- /Thumbnails -->
							</div>
							<!-- /IMAGE -->
							
						</div>
						
					<!-- LEFT -->
					<div class="col-lg-3 col-md-3 col-sm-3">

						<!-- HTML BLOCK -->
					</div>
				</div>
			</div>
		</section>
		<!-- / -->
		<jsp:include page="include/footer.jsp"></jsp:include>
	</div>
	<!-- /wrapper -->
	
	

</body>

</html>
