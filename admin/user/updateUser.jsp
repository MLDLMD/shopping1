<%@page import="java.util.Random"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
</head>
<body>
	<div id="wrapper">
		<div class="small-header transition animated fadeIn">
			<div class="content animate-panel">
				<div class="hpanel">
					<div class="panel-body">
						<div class="hpanel">
							<ul class="nav nav-tabs">
								<li class="active"><a id="liUser" data-toggle="tab"
									href="#tab-1">用户信息</a></li>

							</ul>
							<div class="tab-content">
								<div id="tab-1" class="tab-pane active">							
									<form name="form_productInfo" action="${pageContext.request.contextPath}/updateUserPost"
										method="POST" onsubmit="return validate();">
										
										<input type="hidden" name="id" value="${u.id}" />
										
										<div class="row" style="padding: 20px">
											<div class="row">
												<div class="form-group col-lg-6">
													<label>用户名</label> <input name="userName" class="form-control"
														type="text" placeholder="用户名"
														value="${u.userName}" /> <label
														id="name-error" class="error" for="name"
														style="display: none;"></label>
														
												</div>
												
											</div>
											
											<div class="row">

												<div class="form-group col-lg-6">
													<label>密码</label> <input name="pwd"
														class="form-control" type="text" placeholder="密码"
														value="${u.pwd}" />
												</div>
												
											</div>
											<div class="row">

												<div class="form-group col-lg-6">
													<label>昵称</label> <input name="nickname"
														class="form-control" type="text" placeholder="昵称"
														value="${u.nickName}" />
												</div>
												
											</div><div class="row">

												<div class="form-group col-lg-6">
													<label>电子邮箱</label> <input name="email"
														class="form-control" type="text" placeholder="电子邮箱"
														value="${u.email}" />
												</div>
												
											</div>

											
										</div>
										<div class="row" style="padding: 20px">
											<div class="text-left m-t-xs">
												<button id="saveUserInfo" class="btn btn-success"
													type="submit">
													<strong>保存</strong>
												</button>
												<button id="back" class="btn btn-success" type="button"
													onclick="window.location='${pageContext.request.contextPath}/userServlet?id'">
													<strong>返回</strong>
												</button>
											</div>
										</div>
										
									</form>
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