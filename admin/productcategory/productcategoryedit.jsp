<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@page session="true"%>
<%@include file="../priv.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>商城后台</title>
<jsp:include page="../../commonCss.jsp" />
<jsp:include page="../../commonJs.jsp" />
<script>
	function validate() {

		var name = document.form_productInfo.name.value;
		if (name == null || name.length == 0) {
			document.getElementById("name-error").innerHTML = '请输入商品类别名!';
			document.getElementById("name-error").style.display = 'block';
			return false;
		}
		return true;
	}
</script>
</head>
<body class="blank">
	<jsp:include page="../main/top.jsp" />
	<jsp:include page="../main/left.jsp" />

	<div id="wrapper">
		<div class="small-header transition animated fadeIn">
			<div class="content animate-panel">
				<div class="hpanel">
					<div class="panel-body">
						<div class="hpanel">
							<ul class="nav nav-tabs">
								<li class="active"><a id="liProduct" data-toggle="tab"
									href="#tab-1">商品类别信息</a></li>

							</ul>
							<div class="tab-content">
								<div id="tab-1" class="tab-pane active">
									<form name="form_productInfo" action="${pageContext.request.contextPath}/CaModifyPostServlet"
										method="POST" onsubmit="return validate();">
										<div class="row" style="padding: 20px">
											<div class="row">
												<div class="form-group col-lg-6">
													<label>商品类别名称</label> 
													<input name="name" class="form-control"
														type="text" value="${pc.name }" />
														 <label id="name-error"
														class="error" for="name" style="display: none;"></label>
												</div>
												<div class="form-group col-lg-6">
													<label>商品类别描述</label> <input name="description"
														class="form-control" type="text" value="${pc.description }" />
												</div>
												<div>
													<input name="id" type="hidden" value="${pc.id }" />
												</div>
											
											</div>
										
										<div align= class="row" style="padding: 20px">
											<div class="text-left m-t-xs">
												<button id="saveProductInfo" class="btn btn-success"
													type="submit">
													<strong>保存</strong>
												</button>
												<button id="resetProductInfo" class="btn btn-success"
													type="reset">
													<strong>重置</strong>
												</button>
												<button id="back" class="btn btn-success" type="button"
													onclick="window.location='<%=request.getContextPath()%>/ProductCategorylistServlet'">
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