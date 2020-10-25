<%@page import="java.util.Random"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>商城后台</title>
	<jsp:include page="../../commonCss.jsp"/>
	<jsp:include page="../../commonJs.jsp"/> 
<style type="text/css">
    .container {
        width: 500px;
        clear: both;
    }
    .container input {
        width: 100%;
        clear: both;
    }

    </style>
</head>
<body class="blank">
<jsp:include page="../main/top.jsp"/> 
<jsp:include page="../main/left.jsp"/>

<div id="wrapper">
<br>
  <!-- 每个页面的功能模块填写在这里 -->
 <h3 style="text-align:center"> 欢迎使用购物平台后台管理功能</h3>
 	<table width="800px" align="center">
 		<tr>
 		<td>
 		<div class="container">
 		<form action="${pageContext.request.contextPath}/addUserServlet" method="post">
 			<font size="4">
 			<input type="hidden" name="id" value="<%=(int)(Math.random()*100) %>">
 			 <label>(必填)请输入用户名:</label>
 			 <input type="text" name="name"><br>
 			 <label>(必填)请输入密码:</label>
 			<input type="password" name="pwd"><br>
 			 <label>电子邮箱:</label>
 			<input type="text" name="email"><br>
 			</font><br>
 			<button class="btn btn-success btn-block" type="submit">注册</button>
 		</form>
 		</div>
 		</td>
 		</tr>
 		
 		<div class="content">
			<div class="row">
				<div class="col-lg-12">
					<div class="hpanel">
						<div class="panel-body">
							<table id="productInfoList" style="width: 100%;"
								class="table table-striped table-bordered table-hover dataTable no-footer"
								role="grid" aria-describedby="productInfoList_info">
								<thead>
									<tr role="row">
										<th style="width: 25px;">序号</th>
										<th style="width: 35px;">用户名</th>
										<th style="width: 35px;">密码</th>
										<th style="width: 35px;">昵称</th>
										<th style="width: 35px;">电子邮箱</th>
										
										
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${userList}" var="u">
									<tr>
										<td>${u.id}</td>
										<td>${u.userName}</td>
										<td>${u.pwd}</td>
										<td>${u.nickName}</td>
										<td>${u.email}</td>
										
										<td>
											<button id="update" class="btn btn-default btn-sm"
												onclick="window.location='${pageContext.request.contextPath}/updateUser?id=${u.id}'">
												<i class="fa fa-pencil"></i>编辑
											</button>&nbsp;&nbsp;
											<button id="delete" class="btn btn-default btn-sm"
												onclick="window.location='${pageContext.request.contextPath}/delUser?id=${u.id}'">
												<i class="fa fa-pencil"></i>删除
											</button>
										</td>
									</tr>
									
									</c:forEach>
								</tbody>
							</table>


					       <div>
					        <!-- 6.显示分页信息 -->
							<div class="col-sm-6"><div class="dataTables_info" id="productInfoList_info" role="status" aria-live="polite"> 
							            显示第${start}至${end}项结果，共${recordCount}项
							       </div>
							  </div>
							<div class="col-sm-6"><div class="dataTables_paginate paging_simple_numbers" id="productInfoList_paginate">
							<ul class="pagination">
							<c:choose>
   							<c:when test="${pageIndex==1}">
							  <li class="paginate_button  disabled" aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="#"> 首页 </a></li>
							   <li class="paginate_button  disabled" aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="#"> 上页 </a></li>
							</c:when>
							<c:otherwise>
							   <li class="paginate_button " aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="${pageContext.request.contextPath}/userServlet?pageIndex=1"> 首页 </a></li>
							   <li class="paginate_button " aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="${pageContext.request.contextPath}/userServlet?pageIndex=${pageIndex-1}"> 上页 </a></li>
							</c:otherwise>
							</c:choose>
							<c:choose>
   							<c:when test="${pageIndex==pageCount}">
							
							    <li class="paginate_button  disabled" aria-controls="productInfoList" tabindex="0" id="productInfoList_next"><a href="#"> 下页 </a></li>
							     <li class="paginate_button  disabled" aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="#"> 末页 </a></li>
							</c:when>
							<c:otherwise>
							  	 <li class="paginate_button next" aria-controls="productInfoList" tabindex="0" id="productInfoList_next"><a href="${pageContext.request.contextPath}/userServlet?pageIndex=${pageIndex+1}"> 下页 </a></li>
							     <li class="paginate_button previous" aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="${pageContext.request.contextPath}/userServlet?pageIndex=${pageCount}"> 末页 </a></li>
							</c:otherwise>
							</c:choose>
							  </ul>
							  </div>
							  </div>
					
						</div>
	    			</div>

				</div>

			</div>
	         	
	
		  
		</div>
	</div>
 		
</div>

</body>
</html>