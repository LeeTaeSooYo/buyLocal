<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>핫딜게시판</title>
<link rel="shortcut icon" href="resources/assets/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" href="resources/assets/img/icon.png">

</head>
<body>
	<c:import url="../common/menubar.jsp" />

	<!-- Breadcrumb area Start -->
	<section class="page-title-area bg-image ptb--80"
		data-bg-image="resources/assets/img/bg/page_title_bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<h1 class="page-title">핫딜</h1>
					<ul class="breadcrumb">
						<c:if test="${empty sessionScope.loginUser }">
							<li class="current"><span>전체지역</span></li>
						</c:if>
						<c:if test="${!empty sessionScope.loginUser }">
							<li class="current"><span>${fn:split(loginUser.cAddress, ',')[1] }</span></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb area End -->

	<!-- Main Content Wrapper Start -->
	<div class="main-content-wrapper">
		<div class="shop-page-wrapper ptb--80">
			<div class="container">
				<div class="row">

					

					<div class="col-xl-9 col-lg-8 order-lg-2 mb-md--50">
						<div class="shop-toolbar mb--50">
							<div class="row align-items-center">
								<div class="col-md-5 mb-sm--30 mb-xs--10">
									<div class="shop-toolbar__left">
										<div class="product-ordering">
											<select class="product-ordering__select nice-select" id="optionArray">
												<!--  정렬 기준 수정 20.02.05.  -->
												<option value="0">정렬 기준</option>
												<option value="1">별점순(high to low)</option>
			                                    <option value="2">신상품순</option>
			                                    <option value="3">가격순(low to high)</option>
			                                    <option value="4">가격순(high to low)</option>
											</select>
										</div>
									</div>
								</div>

							</div>
						</div>

						<script>
							$("#optionArray").on('change', function(){
								location.href="${hotDeal}?optionArray=" + $(this).val();
							});
						</script>
						<div class="shop-products">
							<div class="row">
								<!-- 여기부터 -->
								<c:forEach var="hot" items="${list }">
									<div class="col-xl-4 col-sm-6 mb--50">
										<div class="ft-product">
											<div class="product-inner">
												<div class="product-image">
													<figure class="product-image--holder">
														<img
															src="resources/pThumb/${hot.pThumb }"
															alt="Product">
													</figure>

													<c:url var="hotDealDetail" value="hotDealDetail.do">
														<c:param name="pNo" value="${hot.pNo }" />
													</c:url>
													<a href="${hotDealDetail }" class="product-overlay"></a>
													<c:choose>
														<c:when test="${ empty sessionScope.loginUser }">
															<c:url var="userLogin" value="userLogin.do" />
															<div class="product-action">
																<a href="${userLogin }" class="action-btn"> <i
																	class="la la-heart-o"></i>
																</a>
															</div>
														</c:when>
														<c:otherwise>

															<c:url var="hotDealWishList"
																value="hotDealAddWishList.do">
																<c:param name="pNo" value="${hot.pNo }" />
																<c:param name="cNo" value="${loginUser.cNo }" />
															</c:url>
															<div class="product-action">
																<a href="${hotDealWishList }" class="action-btn"> <i
																	class="la la-heart-o"></i>
																</a>
															</div>

														</c:otherwise>
													</c:choose>


												</div>
												<div class="product-info">
													<div class="product-category">

														<a href="product-details.html">${hot.pTitle }</a>
													</div>
													<h3 class="product-title">
														<a href="product-details.html">${hot.pName }</a>

													</h3>
													<div class="product-title">
														<div class="product-price-wrapper">
															<span class="money"> <sup><fmt:parseNumber
																		value="${(hot.pOriginalPrice-hot.pFinalPrice)/hot.pOriginalPrice*100 }"
																		integerOnly="true" />%</sup> <s>${hot.pOriginalPrice }</s>
															</span>
														</div>
														<div class="product-price-wrapper">
															<span class="money"><h3>${hot.pFinalPrice }원</h3></span>
														</div>
														<c:choose>
															<c:when test="${hot.pStarRate == 5}">
																<div class="star-rating star-five"
																	style="margin-left: 0px">
																	<span>Rated <strong class="rating">5.00</strong>
																		out of 5
																	</span>
																</div>
															</c:when>
															<c:when test="${hot.pStarRate == 4}">
																<div class="star-rating star-four"
																	style="margin-left: 0px">
																	<span>Rated <strong class="rating">5.00</strong>
																		out of 5
																	</span>
																</div>
															</c:when>
															<c:when test="${hot.pStarRate == 3}">
																<div class="star-rating star-three"
																	style="margin-left: 0px">
																	<span>Rated <strong class="rating">5.00</strong>
																		out of 5
																	</span>
																</div>
															</c:when>
															<c:when test="${hot.pStarRate == 2}">
																<div class="star-rating star-two"
																	style="margin-left: 0px">
																	<span>Rated <strong class="rating">5.00</strong>
																		out of 5
																	</span>
																</div>
															</c:when>
															<c:when test="${hot.pStarRate == 1}">
																<div class="star-rating star-one"
																	style="margin-left: 0px">
																	<span>Rated <strong class="rating">5.00</strong>
																		out of 5
																	</span>
																</div>
															</c:when>
															<c:otherwise>
																<div class="star-rating star-half"
																	style="margin-left: 0px"></div>
															</c:otherwise>
														</c:choose>
														
														<c:choose>
														<c:when test="${ empty sessionScope.loginUser }">
															<c:url var="userLogin" value="userLogin.do" />
																<a href="${userLogin }" class="add-to-cart pr--15">
																	<i class="la la-plus"></i> <span>장바구니</span>
																</a>
														</c:when>
														<c:otherwise>
															<c:url var="hotDealAddCart" value="hotDealAddCart.do" >
																<c:param name="pNo" value="${hot.pNo }" />
																<c:param name="cNo" value="${loginUser.cNo }" />
															</c:url>
															<a href="${hotDealAddCart }" class="add-to-cart pr--15">
																<i class="la la-plus"></i> <span>장바구니</span>
															</a>
														</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</div>
										<div class="ft-product-list">
											<div class="product-inner">
												<figure class="product-image">
													<a href="product-details.html"> <img
														src="#"
														alt="Products">
													</a>
													<div class="product-thumbnail-action">
														<a data-toggle="modal" data-target="#productModal"
															class="action-btn quick-view"> <i class="la la-eye"></i>
														</a>
													</div>
												</figure>
												<div class="product-info">
													<h3 class="product-title mb--25">
														<a href="product-details.html">Long Cartigen</a>
													</h3>
													<div class="ft-product-action-list mb--20">
														<div class="product-size mb--25">
															<div class="product-size-swatch">
																<span class="product-size-swatch-btn variation-btn">
																	XL </span> <span class="product-size-swatch-btn variation-btn">
																	L </span> <span class="product-size-swatch-btn variation-btn">
																	M </span> <span class="product-size-swatch-btn variation-btn">
																	S </span>
															</div>
														</div>
														<div class="product-color">
															<div class="product-color-swatch">
																<span
																	class="product-color-swatch-btn variation-btn abbey">
																	Abbey </span> <span
																	class="product-color-swatch-btn variation-btn blue">
																	Blue </span> <span
																	class="product-color-swatch-btn variation-btn copper">
																	Copper </span> <span
																	class="product-color-swatch-btn variation-btn old-rose">
																	Old Rose </span>
															</div>
														</div>
													</div>
													<div class="product-price-wrapper mb--15 mb-sm--10">
														<span class="money">$80</span> <span
															class="money-separator">-</span> <span class="money">$200</span>
													</div>
													<p class="product-short-description mb--20">Donec
														accumsan auctor iaculis. Sed suscipit arcu ligula, at
														egestas magna molestie a. Proin ac ex maximus, ultrices
														justo eget, sodales orci. Aliquam egestas libero ac turpis
														pharetra</p>
													<div
														class="ft-product-action-list d-flex align-items-center">


														<a href="${hotDealBuyForm}" class="btn btn-size-md">Add
															To Cart</a> <a href="${hotDealWishList}"
															class="ml--20 action-btn"> <i class="la la-heart-o"></i>
														</a> <a href="${hotDealWishList}" class="ml--20 action-btn">
															<i class="la la-repeat"></i>
														</a>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 여기까지가 한개의 상품 리스트 아래 부분은 미리보기 기능임 -->
								</c:forEach>

							</div>
						</div>
						<nav class="pagination-wrap">
							<ul class="pagination">
								<c:if test="${pi.currentPage <=1 }">
									<li><span class="page-number current">&lt;&lt;</span></li>
								</c:if>
								<c:if test="${pi.currentPage > 1 }">
									<c:url var="before" value="${hotDeal }">
										<c:param name="page" value="${pi.currentPage-1 }" />
									</c:url>
									<li><a class="page-number" href="${before }">&lt;&lt;</a></li>
								</c:if>
								<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
									<c:if test="${p eq pi.currentPage }">
										<li><span class="page-number current">${p }</span></li>
									</c:if>
									<c:if test="${p ne pi.currentPage }">
										<c:url var="pagination" value="${hotDeal }">
											<c:param name="page" value="${p }" />
										</c:url>
										<li><a href="${pagination }" class="page-number">${p }</a></li>
									</c:if>
								</c:forEach>
								<!-- [다음] -->
								<c:if test="${pi.currentPage >= pi.maxPage}">
									<li><span class="page-number current">&gt;&gt;</span></li>
								</c:if>
								<c:if test="${pi.currentPage < pi.maxPage }">
									<c:url var="after" value="${hotDeal }">
										<c:param name="page" value="${pi.currentPage + 1 }" />
									</c:url>
									<li><a class="page-number" href="${after }">&gt;&gt;</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
					<script>
							$("#optionArray").on('change', function(){
								location.href="${hotDeal}?optionArray=" + $(this).val();
							});
						</script>
					<div class="col-xl-3 col-lg-4 order-lg-1">
						<aside class="shop-sidebar">
							<div class="shop-widget mb--40">
								<h3 class="widget-title mb--25">카테고리</h3>
								<ul class="widget-list category-list">
									<li><a href="hotDealMenu.do"> <span class="category-title">전체보기</span>
											<i class="fa fa-angle-double-right"></i></a></li>
									<li><a href="${hotDeal }?category=디지털/가전"> <span class="category-title">디지털/가전</span>
											<i class="fa fa-angle-double-right"></i></a></li>
									<li><a href="${hotDeal }?category=의류/패션잡화"> <span class="category-title">의류/패션잡화</span>
											<i class="fa fa-angle-double-right"></i></a></li>
									<li><a href="${hotDeal }?category=뷰티/미용"> <span class="category-title">뷰티/미용</span>
											<i class="fa fa-angle-double-right"></i></a></li>
									<li><a href="${hotDeal }?category=스포츠/레져"> <span class="category-title">스포츠/레져</span>
											<i class="fa fa-angle-double-right"></i></a></li>
									<li><a href="${hotDeal }?category=도서/티켓/음반"> <span class="category-title">도서/티켓/음반</span>
											<i class="fa fa-angle-double-right"></i></a></li>
									<li><a href="${hotDeal }?category=가구/인테리어"> <span class="category-title">가구/인테리어</span>
											<i class="fa fa-angle-double-right"></i></a></li>
									<li><a href="${hotDeal }?category=신선/가공식품"> <span class="category-title">신선/가공식품</span>
											<i class="fa fa-angle-double-right"></i></a></li>
									<li><a href="${hotDeal }?category=게임/취미"> <span class="category-title">게임/취미</span>
											<i class="fa fa-angle-double-right"></i></a></li>
									<li><a href="${hotDeal }?category=반려동물용품"> <span class="category-title">반려동물용품</span>
											<i class="fa fa-angle-double-right"></i></a></li>
									<li><a href="${hotDeal }?category=기타"> <span class="category-title">기타</span>
											<i class="fa fa-angle-double-right"></i></a></li>
								</ul>
							</div>

							
							<div class="shop-widget">
								<h3 class="widget-title mb--25">태그</h3>
								<div class="tagcloud">
									<a href="shop.html">Cloth</a> <a href="shop.html">Blazer</a> <a
										href="shop.html">Jacket</a> <a href="shop.html">Polo Shirt</a>
									<a href="shop.html">T-Shirt</a> <a href="shop.html">Shoes</a> <a
										href="shop.html">Pant</a> <a href="shop.html">Party Dress</a>
									<a href="shop.html">Coktail Dress</a> <a href="shop.html">Sweater</a>
									<a href="shop.html">Jeans</a>
								</div>
							</div>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Main Content Wrapper Start -->

	<!-- Footer Start-->
	<footer class="footer bg-color" data-bg-color="#f4f8fa">
		<div class="footer-top">
			<div class="container-fluid">
				<div class="row border-bottom pt--70 pb--70">
					<div class="col-lg-3 col-sm-6 offset-md-1 offset-lg-0 mb-md--45">
						<div class="footer-widget">
							<div class="textwidget">
								<figure class="footer-logo mb--30">
									<img src="assets/img/logo/logo.png" alt="Logo">
								</figure>
								<p>On the other hand, we denounce with righteous indignation
									and dislike men who are so beguiled and demoralized by the
									charms.</p>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-sm-3 offset-lg-1 offset-sm-2 mb-md--45">
						<div class="footer-widget">
							<h3 class="widget-title mb--35 mb-sm--20">Company</h3>
							<div class="footer-widget">
								<ul class="footer-menu">
									<li><a href="index.html">About Us</a></li>
									<li><a href="blog.html">Blogs</a></li>
									<li><a href="#">Careers</a></li>
									<li><a href="contact-us.html">Contact</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-sm-4 offset-md-1 offset-lg-0 mb-xs--45">
						<div class="footer-widget">
							<h3 class="widget-title mb--35 mb-sm--20">Product</h3>
							<div class="footer-widget">
								<ul class="footer-menu">
									<li><a href="#">Pricing</a></li>
									<li><a href="#">Features</a></li>
									<li><a href="#">Customers</a></li>
									<li><a href="#">Demos</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-sm-4 mb-xs--45">
						<div class="footer-widget">
							<h3 class="widget-title mb--35 mb-sm--20">Helps</h3>
							<div class="footer-widget">
								<ul class="footer-menu">
									<li><a href="#">Introduction</a></li>
									<li><a href="#">Feedback</a></li>
									<li><a href="#">Referals</a></li>
									<li><a href="#">Network Status</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-md-3 col-sm-4">
						<div class="footer-widget">
							<h3 class="widget-title mb--35 mb-sm--20">Social Network</h3>
							<div class="footer-widget">
								<ul class="footer-menu">
									<li><a href="#">Facebook</a></li>
									<li><a href="#">Twitter</a></li>
									<li><a href="#">Linkedin</a></li>
									<li><a href="#">Google +</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-middle ptb--40">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-11">
						<div class="footer-widget">
							<div class="taglist">
								<span>Tags:</span> <a href="#">Minimal eCommerce</a> <a href="#">Marketing</a>
								<a href="#">User Exprience</a> <a href="#">Ali Express</a> <a
									href="#">Web</a> <a href="#">Digital Expo</a> <a href="#">Web
									Search</a> <a href="#">Affiliate</a> <a href="#">UCWeb</a> <a
									href="#">Support</a> <a href="#">Template</a> <a href="#">Best
									Queality</a> <a href="#">Mobile</a> <a href="#">24 Support</a> <a
									href="#">Ali Express</a> <a href="#">Web</a> <a href="#">Laptop</a>
								<a href="#">Web Search</a> <a href="#">Affiliate</a> <a href="#">Photoshop</a>
								<a href="#">Support</a> <a href="#">Template</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="container-fluid">
				<div class="row border-top ptb--20">
					<div class="col-12 text-center">
						<p class="copyright-text">Beck &copy; 2019 all rights reserved</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer End-->

	<!-- OffCanvas Menu Start -->
	<div class="offcanvas-menu-wrapper" id="offcanvasMenu">
		<div class="offcanvas-menu-inner">
			<a href="" class="btn-close"> <i class="la la-remove"></i>
			</a>
			<nav class="offcanvas-navigation">
				<ul class="offcanvas-menu">
					<li class="menu-item-has-children active"><a href="#">Home</a>
						<ul class="sub-menu">
							<li><a href="index.html">Homepage 01</a></li>
							<li><a href="index-02.html">Homepage 02</a></li>
						</ul></li>
					<li class="menu-item-has-children"><a href="shop.html">Shop</a>
						<ul class="sub-menu">
							<li class="menu-item-has-children"><a href="#"> <span
									class="mm-text">Shop Grid</span>
							</a>
								<ul class="sub-menu">
									<li><a href="shop-fullwidth.html">Full Width</a></li>
									<li><a href="shop.html">Left Sidebar</a></li>
									<li><a href="shop-right-sidebar.html">Right Sidebar</a></li>
									<li><a href="shop-three-columns.html">Three Columns</a></li>
									<li><a href="shop-four-columns.html">Four Columns</a></li>
								</ul></li>
							<li class="menu-item-has-children"><a href="#">Shop List</a>
								<ul class="sub-menu">
									<li><a href="shop-list.html">Full Width</a></li>
									<li><a href="shop-list-sidebar.html">Left Sidebar</a></li>
									<li><a href="shop-list-right-sidebar.html">Right
											Sidebar</a></li>
								</ul></li>
							<li class="menu-item-has-children"><a href="#">Product
									Details</a>
								<ul class="sub-menu">
									<li><a href="product-details.html">Tab Style 1</a></li>
									<li><a href="product-details-tab-style-2.html">Tab
											Style 2</a></li>
									<li><a href="product-details-tab-style-3.html">Tab
											Style 3</a></li>
									<li><a href="product-details-gallery-left.html">Gallery
											Left</a></li>
									<li><a href="product-details-gallery-right.html">Gallery
											Right</a></li>
									<li><a href="product-details-sticky-left.html">Sticky
											Left</a></li>
									<li><a href="product-details-sticky-right.html">Sticky
											Right</a></li>
									<li><a href="product-details-slider-box.html">Slider
											Box</a></li>
									<li><a href="product-details-slider-full-width.html">Slider
											Box Full Width</a></li>
									<li><a href="product-details-affiliate.html">Affiliate
											Proudct</a></li>
									<li><a href="product-details-variable.html">Variable
											Proudct</a></li>
									<li><a href="product-details-group.html">Group Product</a>
									</li>
								</ul></li>
						</ul></li>
					<li class="menu-item-has-children"><a href="blog.html">Blog</a>
						<ul class="sub-menu">
							<li class="menu-item-has-children"><a href="#">Blog</a>
								<ul class="sub-menu">
									<li><a href="blog-left-sidebar.html">Blog Left Sidebar</a>
									</li>
									<li><a href="blog.html">Blog Right Sidebar</a></li>
									<li><a href="blog-01-column.html">Blog 01 column</a></li>
									<li><a href="blog-02-columns.html">Blog 02 columns</a></li>
									<li><a href="blog-03-columns.html">Blog 03 columns</a></li>
								</ul></li>
							<li class="menu-item-has-children"><a href="#">Blog
									Details</a>
								<ul class="sub-menu">
									<li><a href="blog-details-audio.html">Audio Blog
											Details</a></li>
									<li><a href="blog-details-gallery.html">Gallery Blog
											Details</a></li>
									<li><a href="blog-details-image.html">image Blog
											Details</a></li>
									<li><a href="blog-details-video.html">Video Blog
											Details</a></li>
								</ul></li>
						</ul></li>
					<li class="menu-item-has-children"><a href="#">Pages</a>
						<ul class="sub-menu">
							<li><a href="my-account.html">My Account</a></li>
							<li><a href="checkout.html">Checkout</a></li>
							<li><a href="${hotDealBuyForm}">Cart</a></li>
							<li><a href="compare.html">Compare</a></li>
							<li><a href="order-tracking.html">Track Order</a></li>
							<li><a href="${hotDealWishList}">hotDealWishList</a></li>
						</ul></li>
					<li><a href="contact-us.html">Contact Us</a></li>
				</ul>
				<div class="site-info vertical">
					<div class="site-info__item">
						<a href="tel:+01223566678"><strong>+01 2235 666 78</strong></a> <a
							href="mailto:Support@contixs.com">Support@furtrate.com</a>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- OffCanvas Menu End -->




</body>
</html>