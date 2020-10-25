<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>
<jsp:include page="../../commonCss.jsp"/> 
</head>
<body bgcolor="blank">
<jsp:include page="../main/top.jsp"/> 
<jsp:include page="../main/left.jsp"/>
<div style="padding:1%;background:#F0F8FF;position:relative;left:15%;top:10px;width:75%;height:auto;float:left;display:inline">
<div style="padding:6%;background:white;position:relative;left:1%;top:1px;width:99%;height:auto;float:left;display:inline">

<form action="${pageContext.request.contextPath}/OrderManager" method="post">
<table>

    <tr><td colspan="2"><strong>订单编号</strong><td></tr>
    <tr><td colspan="2"><input style="width:600px;height:25px" type="text"name="order_num"></td></tr>
    <tr><td><strong>付款标志</strong></td><td><strong>订单状态</strong><td></tr>
    <tr><td><select style="width:300px;font-size:20px" name="payment_flag">
    <option value="">全部</option>
    <option value="1">已付</option>
     <option value="0">未付</option>
    </select></td>
     <td><select style="width:300px;font-size:20px" name="status">
    <option value="">全部</option>
    
    <option value="1">已下单</option>
     <option value="2">正在配送</option>
     <option value="3">已送达</option>
    </select></td></tr>
    
    <tr><td><strong>总价</strong></td><td><strong>至</strong></td></tr>
    <tr><td><input style="width:300px;font-size:20px" type="text" name="low"></td>
    	<td><input style="width:300px;font-size:20px" type="text" name="high"></td></tr>
    	
    	
    <tr><td><strong>下单时间</strong></td><td><strong>至</strong></td></tr>
    <tr><td><input style="width:300px;font-size:15px" type="datetime-local" step="1" name="start" /></td><td><input style="width:300px;font-size:15px" type="datetime-local" type="datetime-local" step="1" name="end" /></td></tr>
    <tr><td><input type="hidden" name="page_num"></td><td><input type="hidden" name="Spage"></td></tr>
    <tr><td colspan="2" ><input style="background:#FA8258;margin-left:500px;" type="submit"name="submit"value="查询"><input style="background:#FA8258;margin-left:10px;" type="reset" name="reset" value="重置"></td></tr>



</table>
</form>
</div>
<div class="table-d" style="padding:6%;background:white;position:relative;left:1%;top:20px;width:99%;height:auto;float:left;display:inline">
<p>显示<select name= "select1" onchange="window.location=this.value;">
	<option value="">${page.page_num}</option>
	<option value="${pageContext.request.contextPath }/OrderManager?page_num=${10}&order_num=${page.order_num}&payment_flag=${page.payment_flag}&status=${page.status}&low=${page.low}&high=${page.high}&start=${page.start}&end=${page.end}&Spage=${1}">10</option>
	<option value="${pageContext.request.contextPath }/OrderManager?page_num=${11}&order_num=${page.order_num}&payment_flag=${page.payment_flag}&status=${page.status}&low=${page.low}&high=${page.high}&start=${page.start}&end=${page.end}&Spage=${1}">11</option>
	<option value="${pageContext.request.contextPath }/OrderManager?page_num=${12}&order_num=${page.order_num}&payment_flag=${page.payment_flag}&status=${page.status}&low=${page.low}&high=${page.high}&start=${page.start}&end=${page.end}&Spage=${1}">12</option>
	<option value="${pageContext.request.contextPath }/OrderManager?page_num=${13}&order_num=${page.order_num}&payment_flag=${page.payment_flag}&status=${page.status}&low=${page.low}&high=${page.high}&start=${page.start}&end=${page.end}&Spage=${1}">13</option>
	<option value="${pageContext.request.contextPath }/OrderManager?page_num=${14}&order_num=${page.order_num}&payment_flag=${page.payment_flag}&status=${page.status}&low=${page.low}&high=${page.high}&start=${page.start}&end=${page.end}&Spage=${1}">14</option>
	<option value="${pageContext.request.contextPath }/OrderManager?page_num=${15}&order_num=${page.order_num}&payment_flag=${page.payment_flag}&status=${page.status}&low=${page.low}&high=${page.high}&start=${page.start}&end=${page.end}&Spage=${1}">15</option>
</select>
项结果</p>
<br>
<table class="table table-hover">
 <thead>
			<tr> 
				<th>订单编号</th>
				<th>总价</th>		
				<th>付款标志</th>		
				<th>订单状态</th>
				<th>联系人</th>
				<th>联系电话</th>
				<th>订单时间</th>
				<th>操作</th>
			</tr>
		    </thead>
<tbody>
<c:forEach items="${list }" var="list">
<tr>
<td>${list.orderNumber }</td>
<td>${list.price}</td>
<c:if test="${list.paymentFlag==1}">
<td>已付款</td>
</c:if>
<c:if test="${list.paymentFlag==0}">
<td>未付款</td>
</c:if>
<c:if test="${list.status==0}">
<td>0</td>
</c:if>
<c:if test="${list.status==1}">
<td>已下单</td>
</c:if>
<c:if test="${list.status==2}">
<td>正在配送</td>
</c:if>
<c:if test="${list.status==3}">
<td>已寄到</td>
</c:if>

<td>${list.contactName}</td>
<td>${list.contactMobile}</td>
<td>${list.createTime}</td>
<td><a href="${pageContext.request.contextPath}/admin/order/orderModify.jsp?order_num=${list.orderNumber }">修改</a><a href="${pageContext.request.contextPath}/OrderDelete?order_num=${list.orderNumber }">删除</a></td>
</tr>
</c:forEach>
</table>
<table><tr>
<td><a href="order?page_num=${page.page_num}&order_num=${page.order_num}&payment_flag=${page.payment_flag}&status=${page.status}&low=${page.low}&high=${page.high}&start=${page.start}&end=${page.end}&Spage=${page.first}">首页</a></td>


<c:if test="${page.pageNow>1}">
<td><a href="order?page_num=${page.page_num}&order_num=${page.order_num}&payment_flag=${page.payment_flag}&status=${page.status}&low=${page.low}&high=${page.high}&start=${page.start}&end=${page.end}&Spage=${page.pageBefore}">上一页</a></td>
</c:if>



<c:if test="${page.pageNext<=page.last}">
<td><a href="OrderManager?page_num=${page.page_num}&order_num=${page.order_num}&payment_flag=${page.payment_flag}&status=${page.status}&low=${page.low}&high=${page.high}&start=${page.start}&end=${page.end}&Spage=${page.pageNext}">下一页</a></td>
</c:if>

<td><a href="OrderManager?page_num=${page.page_num}&order_num=${page.order_num}&payment_flag=${page.payment_flag}&status=${page.status}&low=${page.low}&high=${page.high}&start=${page.start}&end=${page.end}&Spage=${page.last}">末页</a></td>
</tr></table>
<p>总共${page.last}页，当前第${page.pageNow }页，跳转至<select name= "select2" onchange="window.location=this.value;">
	<option value=""></option>
	<c:forEach var="i" begin="1" end="${page.last }">
	<option value="${pageContext.request.contextPath }/order?page_num=${page.page_num }&OrderManager_num=${page.order_num}&payment_flag=${page.payment_flag}&status=${page.status}&low=${page.low}&high=${page.high}&start=${page.start}&end=${page.end}&Spage=${i}">${i}</option>
	
	</c:forEach>
</select>
页</p>
</div>

</div>
</body>
</html>