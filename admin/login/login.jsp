<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
    <title>商城后台</title>
	<jsp:include page="../../commonCss.jsp"/> 
</head>
<body class="blank" onload='document.loginForm.username.focus();' >
<div class="color-line"></div>
<div class="login-container">
    <div class="row">
        <div class="col-md-12">
            <div class="text-center m-b-md">
                <h3>商城后台</h3>
                <small></small>
            </div>
		    
			
            <div class="hpanel">
            <% 
               Object error=session.getAttribute("error");
               if (error!=null)
               {
            %>
              <span style="color:red"><%=error %> </span>
            <%} %>
                <div class="panel-body">
       
                        <form class="form-signin" name='loginForm' action="${pageContext.request.contextPath}/admin/login/loginpost.jsp" method='POST'>
						     <div class="form-group">
                                <label class="control-label" for="username">用户名</label>
                                <input type="text" placeholder="用户名" title="请输入用户名" required="" value="" name="username" id="username" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="password">密码</label>
                                <input type="password" title="请输入用户名" placeholder="******" required="" value="" name="password" id="password" class="form-control">
                            </div>
                            <button class="btn btn-success btn-block" type="submit">登录</button>
                            <input type="hidden" name="_csrf" value="15ce0815-df52-435a-b115-2d5df1e65623" />
                        </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>