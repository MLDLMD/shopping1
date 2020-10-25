<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.util.*,edu.jmi.shop.bean.*,edu.jmi.shop.dao.*"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title>购物平台</title>
<jsp:include page="include/common.jsp"></jsp:include>

</head>

<body class="smoothscroll enable-animation">
	<%
		String sId = request.getParameter("id");
		int id = Integer.parseInt(sId);

		Cookie[] cookies = request.getCookies();
		boolean bFind = false;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("browsehistory")) {
				String value = cookie.getValue();
				if (value.indexOf(sId) < 0) {
					Cookie co = new Cookie("browsehistory", sId + "-" + value);
					co.setMaxAge(60 * 60 * 24 * 30);
					response.addCookie(co);
					break;
				}
				bFind = true;
			}
		}
		if (bFind == false) {
			Cookie co = new Cookie("browsehistory", sId);
			co.setMaxAge(60 * 60 * 24 * 30);
			response.addCookie(co);
		}

		ProductDAO productDao = new ProductDAO();
		Product product = productDao.selectById(id);
	%>
	<!-- wrapper -->
	<div id="wrapper">
		<jsp:include page="include/head.jsp"></jsp:include>
		<section class="page-header page-header-xs">
			<div class="container">
				<h1><%=product.getName()%></h1>
			</div>
		</section>
		<!-- /PAGE HEADER -->
		<!-- -->
		<section>
			<div class="container">
				<div class="row">
					<!-- RIGHT -->
					<div class="col-lg-9 col-md-9 col-sm-9">
						<div class="row">
							<!-- IMAGE -->
							<div class="col-lg-6 col-sm-6">
								<div class="thumbnail relative margin-bottom-3">
									<figure id="zoom-primary" class="zoom" data-mode="mouseover">
										<div class="swiper-container swiper-container-horizontal"
											data-space-between='10'>
											<div class="swiper-wrapper">
												<div class="swiper-slide">
													<img
														src="<%=request.getContextPath()%>/<%=product.getDefaultImg()%>" />"
													/>
												</div>

											</div>
											<div class="swiper-pagination"></div>
										</div>
									</figure>
								</div>
								<!-- Thumbnails (required height:100px) -->
								<div data-for="zoom-primary"
									class="zoom-more owl-carousel owl-padding-3 featured"
									data-plugin-options='{"singleItem": false, "autoPlay": false, "navigation": true, "pagination": false}'></div>
								<!-- /Thumbnails -->
							</div>
							<!-- /IMAGE -->
							<!-- ITEM DESC -->
							<div class="col-lg-6 col-sm-6">
								<!-- buttons -->

								<div class="pull-right">

									<!-- replace data-item-id width the real item ID - used by js/view/demo.shop.js -->
									<a class="btn btn-default add-wishlist sysBuilding"
										href="javascript:void(0);" onclick="addWishlist(this)"
										data-item-id="1" data-toggle="tooltip" title="添加收藏"><i
										class="fa fa-heart nopadding"></i><input name="productId"
										type="hidden" value="<%=product.getId()%>"> </a>
								</div>
								<!-- /buttons -->
								<!-- price -->
								<div class="shop-item-price">
									<span class="line-through nopadding-left""> 市场价:￥<font
										id="price"><%=product.getPrice() / 100.00%></font>
									</span>￥<font id="shopPrice"><%=product.getShopPrice() / 100.00%></font>
									<div id="id" style="float: right; margin-top: -60px;"></div>
									<input id="submitPrice" type="hidden"
										value="<%=product.getShopPrice() / 100.00%>"> <input
										id="submitOptionValueKeyGroup" type="hidden">
								</div>
								<!-- /price -->
								<hr />
								<div class="clearfix margin-bottom-30">
									<span id="inStock" style="display: none;"
										class="pull-right text-success"><i class="fa fa-check"></i>有货</span>
									<span id="outOfStock" style="display: none;"
										class="pull-right text-danger"><i
										class="glyphicon glyphicon-remove"></i>无货</span> <strong>商品简介:</strong>
								</div>
								<!-- short description -->
								<p><%=product.getGeneralExplain()%></p>
								<!-- /short description -->

								<div class="clearfix form-inline nomargin"></div>

								<hr />
								<form name="cart"
									action="<%=request.getContextPath()%>/index/cartadd.jsp"
									method="post">
									<input type="hidden" name="productid"
										value="<%=product.getId()%>" /> <input type="hidden"
										name="price" value="<%=product.getShopPrice()%>" /> <input
										type="hidden" name="flag" value="" />
									<div class='row'>
										<div class='col-lg-4 col-sm-4'
											style='padding-top: 10px; text-align: right'>购买数量:</div>
										<div class='col-lg-8 col-sm-8 quantityBox'>
											<input name="number" type='text' value='1' />
										</div>
									</div>
								</form>
								<div style='text-align: center; margin-top: 20px'>

									<p class='padding-top-8'>
										<button onclick="submit(1)"
											class="btn btn-warning product-add-cart sysBuilding noradius">
											加入购物车</button>
										<button onclick="submit(2)"
											class="btn btn-primary product-add-cart sysBuilding noradius">
											立即购买</button>
									</p>
								</div>

							</div>
							<!-- /ITEM DESC -->
						</div>
						<ul id="myTab" class="nav nav-tabs nav-top-border margin-top-80"
							role="tablist">
							<li role="presentation" class="active"><a
								href="#description" role="tab" data-toggle="tab">商品描述</a></li>
							<li role="presentation"><a href="#reviews" role="tab"
								data-toggle="tab">商品评论 () </a></li>
						</ul>
						
						<div class="tab-content padding-top-20">
							<!-- DESCRIPTION -->
							<div role="tabpanel" class="tab-pane fade in active"
								id="description"><%=product.getExplain()%></div>
							<!-- REVIEWS -->
							<div role="tabpanel" class="tab-pane fade" id="reviews">

								<!-- REVIEW FORM -->
								<h4 class="page-header margin-bottom-40">添加评论</h4>
								<!-- Comment -->
								<div class="margin-bottom-30">
									<textarea name="content" id="text" class="form-control"
										rows="6" placeholder="评论内容" maxlength="1000"></textarea>
								</div>
								<!-- Stars -->
								<div class="product-star-vote clearfix">
									<label class="radio pull-left"> <input type="radio"
										name="stars" value="1" /><i></i>1星
									</label> <label class="radio pull-left"> <input type="radio"
										name="stars" value="2" /><i></i>2星
									</label> <label class="radio pull-left"> <input type="radio"
										name="stars" value="3" /><i></i>3星
									</label> <label class="radio pull-left"> <input type="radio"
										name="stars" value="4" /><i></i>4星
									</label> <label class="radio pull-left"> <input type="radio"
										name="stars" value="5" /><i></i>5星
									</label>
								</div>
								<button onclick="addReviews()" type="button"
									class="btn btn-primary sysBuilding">
									<i class="fa fa-check"></i>提交
								</button>
								<!-- Send Button -->
								<!-- /REVIEW FORM -->
							</div>
						</div>
					</div>
					<!-- LEFT -->
					<div class="col-lg-3 col-md-3 col-sm-3">

						<!-- HTML BLOCK -->
					</div>
				</div>
			</div>
		</section>
		<!-- / -->
		<jsp:include page="include/footer.jsp"></jsp:include>
	</div>
	<!-- /wrapper -->
	<script
		src="<%=request.getContextPath()%>/resources/pc/assets/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/pc/assets/js//bootstrap-touchspin-master/src/jquery.bootstrap-touchspin.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/pc/assets/js/swiper.min.js"></script>
	<script>
		$('input[name="number"]').TouchSpin({
			min : 1,
			max : 999,
			step : 1,
			boostat : 5,
			maxboostedstep : 10
		});

		function submit(flg) {
			var isLogin = true;
	<%Object o = session.getAttribute("user");
			if (o == null) {%>
		isLogin = false;
	<%}%>
		if (isLogin == false) {
				toastr.error('错误 请登录,只有登录后才能操作!');
				return;
			}
			document.cart.flag.value = flg;
			document.cart.submit();		
		}
	</script>

</body>

</html>
