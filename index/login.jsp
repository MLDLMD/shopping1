<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>购物平台-登录</title>

<!-- mobile settings -->
<meta name="viewport"
	content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />


<jsp:include page="include/common.jsp"></jsp:include>
</head>

<body class="smoothscroll enable-animation">
	<!-- wrapper -->
	<div id="wrapper">
		<jsp:include page="include/head.jsp"></jsp:include>
		<section class="page-header page-header-xs">
			<div class="container">
				<h1>用户登录</h1>

				<ol class="breadcrumb">
					<li><a href="${root}/pc/index">首页</a></li>
					<li>登录</li>
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
							src="<%=request.getContextPath() %>/resources/pc/assets/images/shop/login-png.png">

					</div>
					<!-- /LEFT TEXT -->

					<!-- LOGIN -->
					<form id="infoForm" method="post">
						<div class="col-md-4">

							<h2 class="size-16">登录</h2>

							<div style='color:red'>
							  <%
							     Object error=request.getAttribute("loginerror");
							     if (error!=null){
							    	out.println(error);
							    }

							    %></div>
							<!-- login form -->
							<form method="post" action="#" autocomplete="off">
								<div class="clearfix">

									<!-- ALERT -->
									<div class="alert alert-mini alert-danger margin-bottom-30" style="display: none">
										<strong>手机验证码错误!</strong>
									</div>
									<!-- /ALERT -->
									<div id="message" style="display: none">
									</div>
									
									<!-- mobile -->
									<div class="form-group">
										<input type="text" name="username" class="form-control"
											placeholder="手机号码" required="">
										
									</div>

									<!-- Password -->
									<div class="form-group">
										<input type="password" name="password" class="form-control"
											placeholder="密码" required="">
										
									</div>

								</div>

								<div class="row">

									<div class="col-md-12 col-sm-12 col-xs-12 text-right">
										<button type="button" id="perform" class="btn btn-primary noradius"  style="width:100%">登录</button>
									</div>
									
								</div>

								<div class="row">
								<div class="col-md-6 col-sm-6 col-xs-6">
								<input type="checkbox" name="avoid" value="1"/>十天内免登录&nbsp;&nbsp;
								<a href="<%=request.getContextPath()%>/index/forget.jsp">忘记密码</a>
								</div>
								<div class="col-md-6 col-sm-6 col-xs-6">
								</div>
								</div>
							</form>
							<!-- /login form -->



						</div>
					</form>
					<!-- /LOGIN -->
				</div>


			</div>
		</section>
		<!-- / -->
		<input type="hidden" id="btnFlag"/>
		<jsp:include page="include/footer.jsp"></jsp:include>

	</div>
	<!-- /wrapper -->

	<!-- JAVASCRIPT FILES -->
	<script src="<%=request.getContextPath()%>/resources/pc/assets/js/jquery.validate.js"></script>

</body>
<script type="text/javascript">
var validate
$(document).ready(function (){
	 validate = $("#infoForm").validate({
		onsubmit : false,
		focusInvalid : false,
		errorClass : "error",
		onfocusout : false,
		onkeyup : false,
		onclick : false,
		ignoreTitle : true,
		rules : {
			userName: {
                required: true,
                maxlength : 11,
                isMobile : true
            },
            smsCode: {
                required:  function(element){
                	return ($('#btnFlag').val()=="1");
                },
            	maxlength : 6
            },
            pwd: {
                required:  function(element){
                	return ($('#btnFlag').val()=="1");
                },
                maxlength : 20
            }
		},
		messages : {
			userName: {
                required: "请输入手机号码！",
                maxlength : "手机号码不能超过11位！",
                isMobile : "请正确填写您的手机号码"
            },
            pwd : {
				required : "请输入密码！",
				maxlength : "密码不能超过20位！"
			}
		}
	});
	jQuery.validator.addMethod("isMobile", function(value, element) {
		var length = value.length;
		var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
		return this.optional(element) || (length == 11 && mobile.test(value));
	}, "请正确填写您的手机号码");
});
$("#perform").bind('click',function(){
	$('#btnFlag').val("1");	 
	if($("#infoForm").valid() == false){
        return;
   	};
   	$('#infoForm').attr("action","<%=request.getContextPath()%>/index/loginpost.jsp")
   	$('#infoForm').submit();
});
</script>
</html>
