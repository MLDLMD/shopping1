<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>SHOP-注册</title>
<!-- mobile settings -->
<meta name="viewport"
	content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />

<jsp:include page="include/common.jsp"></jsp:include>
<style type="text/css">
.error {
	font-weight: bold;
}
</style>
</head>
<script>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String loginFlag=request.getParameter("i"); 
if(loginFlag==null){ //无登录失败标识，是正常访问登录页面
	loginFlag="";
}
if(loginFlag.equals("1")){
	out.println("alert('用户存在！')");
}else if(loginFlag.equals("0")){
	out.println("alert('注册成功！')");
}
%>
</script>
<body class="smoothscroll enable-animation">
	<!-- wrapper -->
	<div id="wrapper">
		<jsp:include page="include/head.jsp"></jsp:include>
		<section class="page-header page-header-xs">
			<div class="container">
				<h1>用户注册</h1>
				<ol class="breadcrumb">
					<li><a href="index">首页</a></li>
					<li>用户注册</a>
					</li>
				</ol>
			</div>
		</section>
		<!-- /PAGE HEADER -->
		<!-- -->
		<section>
			<div class="container">
				<div class="row">
					<!-- LEFT TEXT -->
					<div class="col-md-5 col-md-offset-1">
						<img class="img-responsive"
							src="<%=request.getContextPath()%>/resources/pc/assets/images/shop/login-png.png">
					</div>
					<!-- /LEFT TEXT -->
					<!-- LOGIN -->
					<div class="col-md-4">
						<h2 class="size-16">用户注册</h2>
						<!-- login form -->
					<form  id="registerForm" action="<%=request.getContextPath()%>/index/registerpost.jsp" method="post">
							<div class="clearfix">
								<!-- ALERT -->
								<div id="error" class="alert alert-mini alert-danger margin-bottom-30" style="display: none">
									<strong>手机验证码错误!</strong>
								</div>
								<!-- /ALERT -->
								<div id="message" style="display: none"></div>
								
								<!-- mobile -->
								<div class="form-group">
									<input id="userName" name="userName" placeholder="手机号码" class="form-control" type="text" value="" maxlength="11"/>
									
								</div>
						
								
								<!-- Password -->
								<div class="form-group">
									<input id="pwd" name="pwd" placeholder="密码" class="form-control" type="password" value="" maxlength="20"/>
									
								</div>
								<!-- Password -->
								<div class="form-group">
									<input id="confirmPassword" name="confirmPassword" placeholder="确认密码" class="form-control" type="password" value="" maxlength="20"/>
									
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 col-sm-6 col-xs-6">
									<!-- Inform Tip -->
									<div class="form-tip pt-20">
										<button id="smsBtn" class="btn btn-info noradius" type="button">发送手机验证码</button>
									</div>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-6 text-right">
									<button id="registerBtn" class="btn btn-primary noradius" type="button">注册</button>
								</div>
							</div>
						
						</form>
						<!-- /login form -->
					</div>
					<!-- /LOGIN -->
				</div>
			</div>
		</section>
		<!-- / -->
		<jsp:include page="include/footer.jsp"></jsp:include>
	</div>
	<!-- /wrapper -->
	<!-- JAVASCRIPT FILES -->
	<input type="hidden" id="btnFlag" />
</body>
<script type="text/javascript">

	$(document).ready(
					function() {
						
						var abc = {
							onsubmit : false,
							focusInvalid : false,
							errorClass : "error",
							onfocusout : false,
							onkeyup : false,
							onclick : false,
							ignoreTitle : true,
							rules : {
								userName : {
									required : true,
									maxlength : 11,
									isMobile : true
								},
								smsCode : {
									required : function(element) {
										return ($('#btnFlag').val() == "1");
									},
									maxlength : 6
								},
								pwd : {
									required : function(element) {
										return ($('#btnFlag').val() == "1");
									},
									maxlength : 20
								},
								confirmPassword : {
									required : function(element) {
										return ($('#btnFlag').val() == "1");
									},
									maxlength : 20,
									equalTo : "#pwd"
								},
							},
							messages : {
								userName : {
									required : "请输入手机号码！",
									maxlength : "手机号码不能超过11位！",
									isMobile : "请正确填写您的手机号码"
								},
								smsCode : {
									required : "请输入手机验证码！",
									maxlength : "手机验证码必须是6位！"
								},
								pwd : {
									required : "请输入密码！",
									maxlength : "密码不能超过20位！"
								},
								confirmPassword : {
									required : "请输入确认密码！",
									maxlength : "确认密码不能超过20位！",
									equalTo : "密码与确认密码不一致！"
								}
							}
						};
						validate = $("#registerForm").validate(abc);

						jQuery.validator
								.addMethod(
										"isMobile",
										function(value, element) {
											var length = value.length;
											var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
											return this.optional(element)
													|| (length == 11 && mobile
															.test(value));
										}, "请正确填写您的手机号码");
					});
	
	$("#registerBtn").bind('click',
			function() {
			 
				if($("#registerForm").valid() == false){
				
					return;
				};
				$('#registerForm').attr("action", "<%=request.getContextPath()%>/index/registerpost.jsp")
				$('#registerForm').submit();
			});
</script>
	

</html>
