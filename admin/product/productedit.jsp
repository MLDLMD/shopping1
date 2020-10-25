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
<%
	Connection c = null;
	try {

		Class.forName("com.mysql.jdbc.Driver");
		c = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/shopping?serverTimezone=UTC", "root",
				"s19990716");
		//1、根据传入的ID号获取商品记录
		String sId = request.getParameter("id");
		String sql = "select * from product where id=?";
		PreparedStatement pst = c.prepareStatement(sql);
		pst.setString(1, sId);
		ResultSet rsProduct = pst.executeQuery();
		if (rsProduct.next() == false) {
			response.sendRedirect("productadd.jsp");
			return;
		}
%>
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
									<form name="form_productInfo"
										action="${pageContext.request.contextPath}/admin/product/producteditwithimage"
										method="POST" onsubmit="return validate();"
										enctype="multipart/form-data">
										<input type="hidden" name="id" value="<%=sId%>" />
										<div class="row" style="padding: 20px">
											<div class="row">
												<div class="form-group col-lg-6">
													<label>商品名称</label> <input name="name" class="form-control"
														type="text" placeholder="商品名称"
														value="<%=rsProduct.getString("name")%>" /> <label
														id="name-error" class="error" for="name"
														style="display: none;"></label>
												</div>
												<div class="form-group col-lg-6">
													<label>所属分类</label> <select class="form-control"
														name="categoryId">
														<%
															String sqlCategory = "select * from product_category";
																PreparedStatement pstCategory = c.prepareStatement(sqlCategory);
																ResultSet rs = pstCategory.executeQuery();
																while (rs.next()) {
														%>
														<option value="<%=rs.getInt("id")%>"
															<%if (rsProduct.getInt("category_id") == rs.getInt("id")) {%>
															selected <%}%>><%=rs.getString("name")%></option>
														<%
															}
														%>
													</select>
												</div>
											</div>
											<div class="row">

												<div class="form-group col-lg-6">
													<label>市场价格</label> <input name="price"
														class="form-control" type="text" placeholder="市场价格"
														value="<%=rsProduct.getDouble("price") / 100%>" />
												</div>
												<div class="form-group col-lg-6">
													<label>店内价格</label> <input name="shopPrice"
														class="form-control" type="text" placeholder="店内价格"
														value="<%=rsProduct.getDouble("shop_price") / 100%>">
												</div>
											</div>
											<div class="row">

												<div class="form-group col-lg-6">
													<label>商品库存</label> <input name="quantity"
														class="form-control" type="text" placeholder="商品库存"
														value="<%=rsProduct.getString("quantity")%>" />
												</div>
												<div class="form-group col-lg-6">
													<label>状态</label> <select name="productStatus"
														class="form-control">
														<option value="0"
															<%if (rsProduct.getInt("product_status") == 0) {%>
															selected <%}%>>上架</option>
														<option value="1"
															<%if (rsProduct.getInt("product_status") == 1) {%>
															selected <%}%>>下架</option>
													</select>
												</div>

											</div>

											<div class="row">
												<div class="form-group col-lg-6">
													<label>是否热销</label>
													<div>
														<label> <input type="radio" value="0"
															class="i-checks" name="hot"
															<%if (rsProduct.getInt("hot") == 0) {%> checked <%}%> />&nbsp;&nbsp;非热门商品
														</label>&nbsp;&nbsp; <label> <input type="radio" value="1"
															class="i-checks" name="hot"
															<%if (rsProduct.getInt("hot") == 1) {%> checked <%}%> />&nbsp;&nbsp;热门商品
														</label>
													</div>
												</div>
												<div class="form-group col-lg-6">
													<label>商品概要说明</label> <input name="generalExplain"
														class="form-control" type="text" placeholder="商品概要说明"
														value="<%=rsProduct.getString("general_explain")%>" />
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
<%
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
</html>