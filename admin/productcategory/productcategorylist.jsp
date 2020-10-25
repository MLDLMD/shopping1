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
   function delproduct(id){
		swal({
			title : "确定删除吗?",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#62cb31",
			confirmButtonText : "删除",
			cancelButtonText : '取消',
		}, function() {
			window.location="${pageContext.request.contextPath}/CaDeleteServlet?id="+id;
		});
   }
</script>
</head>
<body class="blank">
	<jsp:include page="../main/top.jsp" />
	<jsp:include page="../main/left.jsp" />

	<div id="wrapper">
		<div class="content">
			<div class="small-header transition">

				<div class="hpanel">
					<div class="form-group col-lg-12">
						<div class="text-right m-t-xs">
							<button id="add" class="btn btn-success" type="button"
								onclick="window.location='${pageContext.request.contextPath}/admin/productcategory/productcategoryadd.jsp'">
								<strong>添加</strong>
							</button>
						</div>
					</div>

				</div>
			</div>
		</div>


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
										<th style="width: 100px;">商品类别名</th>
										<th style="width: 100px;">描述</th>
										<th style="width: 60px;">更新日期</th>
										<th style="width: 50px;">更新者</th>
										<th style="width: 64px;">操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${productCategory}" var="p">
									<tr>
										<td>${p.name}</td>
										<td>${p.description}</td>
										<td>${p.updateTime}</td>
										<td>${p.username}</td>
										<td>
											<button id="update" class="btn btn-default btn-sm"
												onclick="window.location='${pageContext.request.contextPath}/CaModifyServlet?id=${p.id}'">
												<i class="fa fa-pencil"></i>编辑
											</button>&nbsp;&nbsp;
											<button id="delete" class="btn btn-default btn-sm"
												onclick="delproduct(${p.id})"> 
												<i class="fa fa-pencil"></i>删除
											</button>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							

							
					
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