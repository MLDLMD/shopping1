<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>常用联系人</title>
</head>
<body>
	<div id="wrapper">
		<div class="small-header transition animated fadeIn">
			<div class="content animate-panel">
				<div class="hpanel">
					<div class="panel-body">
						<div class="hpanel">
							<ul class="nav nav-tabs">
								<li class="active"><a id="liProduct" data-toggle="tab"
									href="#tab-1">常用联系人信息</a></li>

							</ul>
							<div class="tab-content">
								<div id="tab-1" class="tab-pane active">
									<form name="form_productInfo" action="${pageContext.request.contextPath}/updateContactPost"
										method="POST" onsubmit="return validate();">
										<input type="hidden" name="id" value="${c.id}" />
										<input type="hidden" name="user_id" value="${user.id}" />
										<div class="row" style="padding: 20px">
										
											<div class="row">
												<div class="form-group col-lg-6">
													<label>商品名称</label> <input name="name" class="form-control"
														type="text" placeholder="姓名"
														value="${c.name}" /> <label
														id="name-error" class="error" for="name"
														style="display: none;"></label>
												</div>
												
											</div>
											
											<div class="row">

												<div class="form-group col-lg-6">
													<label>电话</label> <input name="mobile"
														class="form-control" type="text" placeholder="电话"
														value="${c.mobile}" />
												</div>
												
											</div>
											<div class="row">

												<div class="form-group col-lg-6">
													<label>地址</label> <input name="address"
														class="form-control" type="text" placeholder="地址"
														value="${c.address}" />
												</div>
												
											</div>

											
										</div>
										<div class="row" style="padding: 20px">
											<div class="text-left m-t-xs">
												<button id="saveContactInfo" class="btn btn-success"
													type="submit">
													<strong>保存</strong>
												</button>
												<button id="back" class="btn btn-success" type="button"
													onclick="window.location='${pageContext.request.contextPath}/contactServlet'">
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