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
   function delproduct(id){
		swal({
			title : "确定删除吗?",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#62cb31",
			confirmButtonText : "删除",
			cancelButtonText : '取消',
		}, function() {
			window.location="${pageContext.request.contextPath}/admin/product/productdel.jsp?id="+id;
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
								onclick="window.location='productadd.jsp'">
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
										<th style="width: 25px;">商品名</th>
										<th style="width: 35px;">商品分类</th>
										<th style="width: 35px;">店内价格</th>
										<th style="width: 35px;">市场价格</th>
										<th style="width: 16px;">数量</th>
										<th style="width: 36px;">热门商品</th>
										<th style="width: 16px;">状态</th>
										<th style="width: 36px;">更新时间</th>
										<th style="width: 27px;">更新者</th>
										<th style="width: 64px;">操作</th>
									</tr>
								</thead>
								<tbody>
									<%
										Connection c = null;
									    int pageIndex=1;
									    final int recCountInPage=10;
									    int recordCount=0;
									    int pageCount=0;
									    int start=0;
									    int end=0;
									  
									    
										try {
											//1.获取当前页码
											String s=request.getParameter("pageIndex");
											if (s!=null){
												pageIndex=Integer.parseInt(s);
											}
                                             
											Class.forName("com.mysql.jdbc.Driver");
											c = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/shopping?serverTimezone=UTC", "root",
													"s19990716");
											
											//2.获取记录数量
											String sqlCount="select count(*) as reccount from product";
											PreparedStatement pstCount=c.prepareStatement(sqlCount);
											ResultSet rsCount=pstCount.executeQuery();
											rsCount.next();
											recordCount=rsCount.getInt("reccount");
											
											
										    //3.计算分页信息
											pageCount=recordCount/recCountInPage+(recordCount%recCountInPage==0?0:1);
											start=(pageIndex-1)*recCountInPage+1;
											end=pageIndex*recCountInPage;
											end=end>recordCount?recordCount:end;
											
											
											//4.分页查询
											String sql = "select product.*,product_category.name as category_name,user.user_name from product "
													+ "left join product_category on product.category_id =product_category.id   "
													+ "left join user ON  product.update_user_id = user.id   "
													+ "order by product.id desc limit "+(start-1)+" , "+ recCountInPage;

											PreparedStatement pst = c.prepareStatement(sql);
											ResultSet rs = pst.executeQuery();
											//5.显示记录
											while (rs.next()) {
									     %>
									<tr>
										<td><%=rs.getString("name")%></td>
										<td><%=rs.getString("category_name")%></td>
										<td><%=rs.getDouble("shop_price") / 100%></td>
										<td><%=rs.getDouble("price") / 100%></td>
										<td><%=rs.getString("quantity")%></td>
										<td>
											<%
												if (rs.getInt("hot") == 0) {
											%> 否  <%
												} else {
											%>是 <%
												}
									         %>
							          </td>
										<td>
											<%
												if (rs.getInt("product_status") == 0) {
					           				%> 已上架 <%
												} else {
											%> 已下架 <%
												}
											%>
										</td>
										<td><%=rs.getString("update_time")%></td>
										<td><%=rs.getString("user_name")%></td>
										<td>
											<button id="update" class="btn btn-default btn-sm"
												onclick="window.location='<%=request.getContextPath()%>/admin/product/productedit.jsp?id=<%=rs.getInt("id")%>'">
												<i class="fa fa-pencil"></i>编辑
											</button>&nbsp;&nbsp;
											<button id="delete" class="btn btn-default btn-sm"
												onclick="delproduct(<%=rs.getInt("id")%>)">
												<i class="fa fa-pencil"></i>删除
											</button>
										</td>
									</tr>
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
								</tbody>
							</table>


					       <div>
					        <!-- 6.显示分页信息 -->
							<div class="col-sm-6"><div class="dataTables_info" id="productInfoList_info" role="status" aria-live="polite"> 
							            显示第<%=start%>至<%=end%>项结果，共<%=recordCount %>项
							       </div>
							  </div>
							<div class="col-sm-6"><div class="dataTables_paginate paging_simple_numbers" id="productInfoList_paginate">
							<ul class="pagination">
							<%if (pageIndex==1) {%>
							  <li class="paginate_button  disabled" aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="#"> 首页 </a></li>
							   <li class="paginate_button  disabled" aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="#"> 上页 </a></li>
							<%}else{ %>
							   <li class="paginate_button " aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="productlist.jsp?pageIndex=1"> 首页 </a></li>
							   <li class="paginate_button " aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="productlist.jsp?pageIndex=<%=pageIndex-1%>"> 上页 </a></li>
							<%} %>
							<%if (pageIndex==pageCount) {%>
							    <li class="paginate_button  disabled" aria-controls="productInfoList" tabindex="0" id="productInfoList_next"><a href="#"> 下页 </a></li>
							     <li class="paginate_button  disabled" aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="#"> 末页 </a></li>
							  <%}else{ %>
							  	 <li class="paginate_button next" aria-controls="productInfoList" tabindex="0" id="productInfoList_next"><a href="productlist.jsp?pageIndex=<%=pageIndex+1%>"> 下页 </a></li>
							     <li class="paginate_button previous" aria-controls="productInfoList" tabindex="0" id="productInfoList_previous"><a href="productlist.jsp?pageIndex=<%=pageCount%>"> 末页 </a></li>
							 <%} %> 
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
	</div>


	</div>



</body>
</html>