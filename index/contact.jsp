<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>常用联系人</title>
<style type="text/css">
        .top{
            
            height: 50px;
            width:100%;
            top: 0;
        }
        .top ul{
            width: 80%;
            list-style-type: none;
            margin: 0;            
            padding: 0;
            overflow: hidden;
        }
        .top li {    
            float:left; 
            margin-right:10px;
        }
        .top li a{
            display: block;
            color:white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .top li a:hover{
            background-color: black;
        }

       </style>
</head>
<jsp:include page="include/common.jsp"></jsp:include>
<body class="smoothscroll enable-animation">
	<!-- wrapper -->
	<div id="wrapper">
		<jsp:include page="include/head.jsp"></jsp:include>
		
		<div style="background-color:#a8a8a8;padding:10px";align="left">
		
		<h2><b>个人中心</b></h2>
		<h5 align="right">首页·个人中心·个人信息设置</h5>
		<div class="top">
                   <center> 
                    <ul>
                    <li><a href="${pageContext.request.contextPath}/myOrderServlet?id=${user.id }">历史订单</a><>
                    <li><a href="${pageContext.request.contextPath}/favoriteServlet?id=${user.id }">收藏夹</a><>
                    <li><a href="${pageContext.request.contextPath}/contactServlet?id=${user.id }">常用联系人</a><>
                    <li><a href="${pageContext.request.contextPath}/index/user_setting.jsp?id=${user.id }"><b>个人信息设置</b></a><>
                    </ul>
                    </center>      
           </div>
		</div>
		<br><br>
		<table align="center" style="width: 900px" border="1" rules="none">
			<tr>
				<td bgcolor="#a8a8a8" colspan="5" height="40px">
					&nbsp;&nbsp;&nbsp;<font size=4 color="black">常用联系人</font>
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;&nbsp;&nbsp;默认联系人
				</td>
				<td>
					联系人姓名
				</td>
				<td>
					联系人电话
				</td>
				<td>
					联系人地址
				</td>
				<td>
					操作
				</td>
			</tr>
			<c:forEach items="${Contact}" var="c">
			<tr>
				<td>
					&nbsp;&nbsp;&nbsp;<input type="checkbox">
				</td>
				<td>
					${c.name }
				</td>
				<td>
					${c.mobile }
				</td>
				<td>
					${c.address }
				</td>
				<td>
					<button id="update" class="btn btn-default btn-sm"
					onclick="window.location='${pageContext.request.contextPath}/updateContact?id=${c.id}'">
					<i class="fa fa-pencil"></i>编辑
					</button>&nbsp;&nbsp;
					<button id="delete" class="btn btn-default btn-sm"
					onclick="window.location='${pageContext.request.contextPath}/delContact?id=${c.id}'">
					<i class="fa fa-pencil"></i>删除
					</button>
				</td>
			</tr>
			</c:forEach>
			<form action="${pageContext.request.contextPath}/addContact?id=${user.id}" method="post">
			
			<tr>
				<td colspan="3">
					&nbsp;&nbsp;&nbsp;姓名*
				</td>
				<td colspan="2">
					电话*
				</td>
			</tr>
			<tr>
				<td colspan="3">
					&nbsp;&nbsp;&nbsp;<input type="text" name="name" style="width: 400px">
				</td>
				<td colspan="2">
					<input type="text" name="mobile" style="width: 400px">
				</td>
			</tr>
			<tr>
				<td colspan="5">&nbsp;&nbsp;&nbsp;地址*</td>
			</tr>
			<tr>
				<td colspan="5">&nbsp;&nbsp;&nbsp;<input type="text" name="address" style="width: 845px"></td>
			</tr>
			<tr>
				<td colspan="5" align="right"><br><br><input type="submit" value="保存联系人" style="background-color: green;color: white;border: 0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			</form>
		</table>
		
		<jsp:include page="include/footer.jsp"></jsp:include>
	   <div style="position:fixed;top:200px;z-index:1000;right:5px;width:180px;">			
	 </div>
</div>
</body>
</html>