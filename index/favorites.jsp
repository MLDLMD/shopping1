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
							
	
							<p>显示<select name= "select1" onchange="window.location=this.value;">
	<option value="">${page.page_num}</option>
	<option value="${pageContext.request.contextPath }/wish?user_id=${page.user_id}page_num=${10}&payment_flag=${page.payment_flag}&status=${page.status}&Spage=${1}">10</option>
	<option value="${pageContext.request.contextPath }/wish?user_id=${page.user_id}page_num=${11}&payment_flag=${page.payment_flag}&status=${page.status}&Spage=${1}">11</option>
	<option value="${pageContext.request.contextPath }/wish?user_id=${page.user_id}page_num=${12}&payment_flag=${page.payment_flag}&status=${page.status}&Spage=${1}">12</option>
	<option value="${pageContext.request.contextPath }/wish?user_id=${page.user_id}page_num=${13}&payment_flag=${page.payment_flag}&status=${page.status}&Spage=${1}">13</option>
	<option value="${pageContext.request.contextPath }/wish?user_id=${page.user_id}page_num=${14}&payment_flag=${page.payment_flag}&status=${page.status}&Spage=${1}">14</option>
	<option value="${pageContext.request.contextPath }/wish?user_id=${page.user_id}page_num=${15}&payment_flag=${page.payment_flag}&status=${page.status}&Spage=${1}">15</option>
</select>
项结果</p>
<br>

	<div style="width:1000px;padding:0">
	<table class="table table-hover" >
		   <caption>个人收藏</caption>
		   <thead>

			<tr> 
				<th>商品名称</th>
				<th>市场价格</th>		
				<th>店内价格</th>		
				<th>操作</th>
			</tr>
		    </thead>
	
		<tbody>
			<c:forEach items="${list}" var="list">
			<tr>
    			<td><img src="${pageContext.request.contextPath}${list.defaultImg}">${list.name}</td>
    			<td>${list.price }</td>
    			<td>${list.shopPrice }</td>
    			<td><a href="${pageContext.request.contextPath}/WishDelete?user_id=${page.user_id}&product_id=${list.id}&page_num=${page.page_num}&Spage=${page.pageNow}">删除||</a><a href="${pageContext.request.contextPath}/ProductServlet?id=${list.id }">查看</a></td>
                                                    </tr>
                                                    </c:forEach>
    		</tbody>
	
	  
 		</table>
	</div>
<table><tr>
<td><a href="wish?user_id=${page.user_id}page_num=${page.page_num}&payment_flag=${page.payment_flag}&Spage=${page.first}">首页</a></td>


<c:if test="${page.pageNow>1}">
<td><a href="wish?user_id=${page.user_id}page_num=${page.page_num}&payment_flag=${page.payment_flag}&Spage=${page.pageBefore}">上一页</a></td>
</c:if>



<c:if test="${page.pageNext<=page.last}">
<td><a href="wish?user_id=${page.user_id}page_num=${page.page_num}&payment_flag=${page.payment_flag}&Spage=${page.pageNext}">下一页</a></td>
</c:if>

<td><a href="wish?user_id=${page.user_id}page_num=${page.page_num}&payment_flag=${page.payment_flag}&Spage=${page.last}">末页</a></td>
</tr></table>
<p>总共${page.last}页，当前第${page.pageNow }页，跳转至<select name= "select2" onchange="window.location=this.value;">
	<option value=""></option>
	<c:forEach var="i" begin="1" end="${page.last }">
	<option value="${pageContext.request.contextPath }/wish?user_id=${page.user_id}page_num=${page.page_num }&payment_flag=${page.payment_flag}&Spage=${i}">${i}</option>
	
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
