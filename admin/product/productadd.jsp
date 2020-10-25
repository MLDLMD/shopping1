<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
			document.getElementById("name-error").innerHTML = '请输入商品名!';
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
									href="#tab-1">商品信息</a></li>

							</ul>
							<div class="tab-content">
								<div id="tab-1" class="tab-pane active">
									<form name="form_productInfo" action="${pageContext.request.contextPath}/admin/product/productaddwithimage"
										method="POST" onsubmit="return validate();" enctype="multipart/form-data">

										<div class="row" style="padding: 20px">
											<div class="row">
												<div class="form-group col-lg-6">
													<label>商品名称</label> 
													<input name="name" class="form-control"
														type="text" placeholder="商品名称" />
														 <label id="name-error"
														class="error" for="name" style="display: none;"></label>
												</div>
												<div class="form-group col-lg-6">
													<label>所属分类</label> 
													<select class="form-control" name="categoryId">
														<%
															Connection c = null;
															try {

																Class.forName("com.mysql.jdbc.Driver");
																c = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/shopping?serverTimezone=UTC", "root",
																		"s19990716");
																String sql = "select * from product_category";
																PreparedStatement st = c.prepareStatement(sql);
																ResultSet rs = st.executeQuery();
																while (rs.next()) {
														%><option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>
														<%
															}
															} catch (Exception ex) {
																ex.printStackTrace();
															} finally {
																try {
																	if (c != null) {
																		c.close();
																	}
																} catch (Exception ex) {

																}
															}
														%>
													</select>
												</div>
											</div>
											<div class="row">

												<div class="form-group col-lg-6">
													<label>市场价格</label> <input name="price"
														class="form-control" type="text" placeholder="市场价格" />
												</div>
												<div class="form-group col-lg-6">
													<label>店内价格</label> <input name="shopPrice"
														class="form-control" type="text" placeholder="店内价格" />
												</div>
											</div>
											<div class="row">

												<div class="form-group col-lg-6">
													<label>商品库存</label> <input name="quantity"
														class="form-control" type="text" placeholder="商品库存" />
												</div>
												<div class="form-group col-lg-6">
													<label>状态</label>
													 <select name="productStatus"
														class="form-control">
														<option value="0" selected>上架</option>
														<option value="1">下架</option>
													</select>
												</div>

											</div>

											<div class="row">
												<div class="form-group col-lg-6">
													<label>是否热销</label>
													<div>
														<label>
														 <input type="radio" value="0"
															class="i-checks" name="hot" checked />&nbsp;&nbsp;非热门商品
														</label>&nbsp;&nbsp; <label> <input type="radio" value="1"
															class="i-checks" name="hot" />&nbsp;&nbsp;热门商品
														</label>
													</div>
												</div>
												<div class="form-group col-lg-6">
													<label>商品概要说明</label> <input name="generalExplain"
														class="form-control" type="text" placeholder="商品概要说明" />
												</div>
											</div>
											<div class="form-group col-lg-6">
													<label>上传图片</label> <input name="defaultImg"
														class="form-control" type="file" placeholder="商品图片" />
											</div>
										  </div>
										</div>
										<div class="row" style="padding: 20px">
											<div class="text-left m-t-xs">
												<button id="saveProductInfo" class="btn btn-success"
													type="submit">
													<strong>保存</strong>
												</button>
												<button id="back" class="btn btn-success" type="button"
													onclick="window.location='${pageContext.request.contextPath}/admin/product/productlist.jsp'">
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