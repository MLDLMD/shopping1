<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../../commonCss.jsp"/>
</head>
<body>
<div class="color-line">
<div class="login-container">
    <div class="row">
        <div class="col-md-12">
            <div class="text-center m-b-md">
                <h3>订单修改</h3>
            </div>
             <div class="hpanel">
<div class="panel-body">

<form action="${pageContext.request.contextPath}/OrderModify" method="get">

<table>

<input type="hidden" name="order_num" value="<%=request.getParameter("order_num")%>">

<tr><td>价格:</td><td><input style="width:300px;font-size:20px" type="text" name="price"></td></tr>
<tr><td>付款标志:</td><td><select style="width:300px;font-size:20px" name="payment_flag">
    <option value="">全部</option>
    <option value="1">已付</option>
     <option value="0">未付</option>
    </select></td></tr>
<tr><td>订单状态:</td><td><select style="width:300px;font-size:20px" name="status">
    <option value="">全部</option>
    
    <option value="1">已下单</option>
     <option value="2">正在配送</option>
     <option value="3">已送达</option>
    </select></td></tr>
<tr><td><input type="submit" value="提交"></td><td><input type="reset" value="重置"></td></tr>

</table>
</form>
</div>
          </div>
        </div>
    </div>
</div>
</div>

</body>
</html>