<%@page import="edu.jmi.shop.bean.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>个人设置</title>
<style type="text/css">
        .top{
            /* 设置宽度高度背景颜色 */
            height: 50px;
            width:100%;
            
            /*固定在顶部*/
            top: 0;/*离顶部的距离为0*/
        }
        .top ul{
            /* 清除ul标签的默认样式 */
            width: 80%;
            list-style-type: none;
            margin: 0;            
            padding: 0;
            overflow: hidden;
        }
        .top li {    
            float:left; /* 使li内容横向浮动，即横向排列  */
            margin-right:10px;  /* 两个li之间的距离*/
        }
        .top li a{
           /* 设置链接内容显示的格式*/
            display: block; /* 把链接显示为块元素可使整个链接区域可点击 */
            color:white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none; /* 去除下划线 */
        }
        .top li a:hover{
            /* 鼠标选中时背景变为黑色 */
            background-color: black;
        }
        table{
		    border-collapse:collapse
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
				<td bgcolor="#a8a8a8" colspan="2" height="40px">
					&nbsp;&nbsp;&nbsp;<font size=4 color="black">个人信息设置</font>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<b><font size=5>个人信息</font></b>
				</td>
			</tr>
			<tr>
				<td width="450px">
				&nbsp;&nbsp;&nbsp;&nbsp;昵称
				</td>
				<td>
				电子邮箱
				</td>
			</tr>
			<form action="userset.jsp" method="post">
			<tr>
				<td>
					&nbsp;&nbsp;&nbsp;<input type="text" name="nickName" style="width: 430px" value="">
				</td>
				<td>
					<input type="text" name="email" style="width: 430px" value="">
				</td>
			</tr>
			<tr>
				<td align="right" colspan="2">
					<input type="submit" value="保存" style="background-color: green;color: white;border: 1px;height: 30px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			</form>
		</table>
		
		<jsp:include page="include/footer.jsp"></jsp:include>
	   <div style="position:fixed;top:200px;z-index:1000;right:5px;width:180px;">			
	 </div>
</div>
</body>
</html>