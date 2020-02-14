<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>바이로컬</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicons -->
<link rel="shortcut icon" href="resources/assets/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" href="resources/assets/img/icon.png">

<!-- ************************* CSS Files ************************* -->

<!-- Vendor CSS -->
<link rel="stylesheet" href="resources/assets/css/vendor.css">

<!-- style css -->
<link rel="stylesheet" href="resources/assets/css/main.css">
</head>

<body>



	<!-- Preloader Start -->
	<div class="ft-preloader active">
		<div
			class="ft-preloader-inner h-100 d-flex align-items-center justify-content-center">
			<div class="ft-child ft-bounce1"></div>
			<div class="ft-child ft-bounce2"></div>
			<div class="ft-child ft-bounce3"></div>
		</div>
	</div>

	<!-- Preloader End -->
	<c:url var="hotDealWishList" value="hotDealWishList.do" />
	<c:url var="hotDealBuyForm" value="hotDealBuyForm.do" />
	<c:url var="hotDealDetail" value="hotDealDetail.do" />
	<c:url var="admin" value="goAdmin.do" />

	<!-- Main Wrapper Start -->
	<div class="wrapper">
		<!-- Header Start -->
		<header class="header">
			<div class="header__inner fixed-header">
				<div class="header__main">
					<div class="container-fluid">
						<div class="row">
							<div class="col-12">
								<div class="header__main-inner">
									<div class="header__main-left">
										<div class="logo">
											<a href="<%=request.getContextPath()%>" class="logo--normal">
												<img src="resources/assets/img/logo/logo.png" alt="Logo">
											</a>
										</div>
									</div>
									<div class="header__main-center">
										<nav class="main-navigation text-center d-none d-lg-block">
											<ul class="mainmenu">
												<li class="mainmenu__item menu-item-has-children"><c:url
														var="introduction" value="introduction.do" /> <c:url
														var="holymoly" value="holymoly.do" /> <c:url
														var="noticeM" value="noticeMain.do" /> <a
													href="${introduction}" class="mainmenu__link"> <span
														class="mm-text">바이로컬</span>
												</a>
													<ul class="sub-menu">
														<li><a href="${introduction}"> <span
																class="mm-text">사이트 소개</span>
														</a></li>
														<li><a href="${holymoly}"> <span class="mm-text">홀리몰리</span>
														</a></li>
														<li><a href="${noticeM}"> <span class="mm-text">공지사항</span>
														</a></li>
													</ul></li>
												<li
													class="mainmenu__item menu-item-has-children megamenu-holder">
													<c:url var="hotDeal" value="hotDealMenu.do" /> <a
													href="${hotDeal}" class="mainmenu__link"> <span
														class="mm-text">핫딜</span>
												</a>
													<ul class="megamenu">
														<li>
															<ul>
																<li><a href="#"> <span class="mm-text">디지털/가전</span>
																</a></li>
																<li><a href="#"> <span class="mm-text">의류/패션잡화</span>
																</a></li>
																<li><a href="#"> <span class="mm-text">뷰티/미용</span>
																</a></li>
																<li><a href="#"> <span class="mm-text">스포츠/레저</span>
																</a></li>
																<li><a href="#"> <span class="mm-text">도서/티켓/음반</span>
																</a></li>
															</ul>
														</li>
														<li>
															<ul>
																<li><a href="#"> <span class="mm-text">가구/인테리어</span>
																</a></li>
																<li><a href="#"> <span class="mm-text">신선/가공식품</span>
																</a></li>
																<li><a href="#"> <span class="mm-text">게임/취미</span>
																</a></li>
																<li><a href="#"> <span class="mm-text">반려동물용품</span>
																</a></li>
																<li><a href="#"> <span class="mm-text">기타</span>
																</a></li>
															</ul>
														</li>
													</ul>
												</li>
												<li class="mainmenu__item menu-item-has-children"><c:url
														var="ttangM" value="ttangMain.do" /> <a href="${ttangM}"
													class="mainmenu__link"> <span class="mm-text">땡처리</span>
												</a>
													<ul class="sub-menu">
														<li class="menu-item-has-children">
														<li><a title="한식" href="${ttangM}"> <span
																class="mm-text">한식</span>
														</a></li>
														<li><a title="중식" href="${ttangM}"> <span
																class="mm-text">중식</span>
														</a></li>
														<li><a title="일식" href="${ttangM}"> <span
																class="mm-text">일식</span>
														</a></li>
														<li><a title="양식" href="${ttangM}"> <span
																class="mm-text">양식</span>
														</a></li>
														<li><a title="커피/제과" href="${ttangM}"> <span
																class="mm-text">커피/제과</span>
														</a></li>
														<li><a title="기타" href="${ttangM}"> <span
																class="mm-text">기타</span>
														</a></li>
													</ul></li>

												<li class="mainmenu__item"><c:url var="shareboard"
														value="shareboard.do" /> <a href="${shareboard }"
													class="mainmenu__link"> <span class="mm-text">나눔게시판</span>
												</a></li>
												<li class="mainmenu__item menu-item-has-children"><c:url
														var="advertisementForm" value="advertisementForm.do" /> <c:url
														var="insertProductForm" value="insertProductForm.do" /> <a
													href="${advertisementForm}" class="mainmenu__link"> <span
														class="mm-text">신청하기</span>
												</a>
													<ul class="sub-menu">
														<li class="menu-item-has-children">
														<li><a title="이벤트/광고 신청" href="${advertisementForm}">
																<span class="mm-text">이벤트/광고 신청</span>
														</a></li>
														<li><a title="상품 신청" href="${insertProductForm}">
																<span class="mm-text">상품 신청</span>
														</a></li>
													</ul></li>
												<li class="mainmenu__item menu-item-has-children"><c:url
														var="FAQ" value="FAQ.do" /> <c:url var="QNAform"
														value="QNAform.do" /> <a href="${FAQ}"
													class="mainmenu__link"> <span class="mm-text">고객센터</span>
												</a>
													<ul class="sub-menu">
														<li class="menu-item-has-children">
														<li><a title="FAQ" href="${FAQ}"> <span
																class="mm-text">FAQ</span>
														</a></li>
														<li><a title="QNA" href="${QNAform}"> <span
																class="mm-text">QNA</span>
														</a></li>
													</ul></li>
											</ul>
										</nav>
									</div>
									
									<div class="header__main-right">
										<div class="header-toolbar-wrap">
											<div class="header-toolbar">
												<div class="header-toolbar__item header-toolbar--search-btn">
													<a href="#searchForm"
														class="header-toolbar__btn toolbar-btn"> <i
														class="la la-search"></i>
													</a>
												</div>
												<!-- 메뉴바 아이콘 추가 (소망) -->
												<div
													class="header-toolbar__item header-toolbar--minicart-btn">
													<c:if test="${ loginUser.cId eq 'admin' }">
														<c:url var="Count" value="Count.do" />
														<a href="${ Count }"
															class="header-toolbar__btn toolbar-btn1"> <i
															class="la la-wrench"></i>
														</a>
													</c:if>
												</div>
												<div
													class="header-toolbar__item header-toolbar--minicart-btn">
													<c:if test="${ !empty sessionScope.loginUser }">
														<c:url var="logout" value="logout.do" />
														<a href="${ logout }"
															class="header-toolbar__btn toolbar-btn1"> <i
															class="la la-power-off"></i>
														</a>
													</c:if>
												</div>
												<div
													class="header-toolbar__item header-toolbar--minicart-btn">
													<c:if test="${ !empty sessionScope.loginUser }">
														<c:url var="myFavorite" value="myFavorite.do" />
														<a href="${ myFavorite }"
															class="header-toolbar__btn toolbar-btn1"> <i
															class="la la-heart-o"></i>
														</a>
													</c:if>
												</div>
												<div
													class="header-toolbar__item header-toolbar--minicart-btn">
													<a href="#miniCart" class="header-toolbar__btn toolbar-btn">
														<i class="la la-shopping-cart"></i>
													</a>
												</div>
												<div
													class="header-toolbar__item header-toolbar--minicart-btn">
													<!-- 로그인 페이지 이동 처리 추가 (소망) -->
													<!-- 로그인 유저가 있을 시 같은 버튼을 누르면 회원 프로필 페이지로 이동 -->
													<c:choose>
														<c:when test="${ empty sessionScope.loginUser }">
															<c:url var="userLogin" value="userLogin.do" />
															<c:url var="userLogin" value="userLogin.do" />
															<a href="${ userLogin }"
																class="header-toolbar__btn toolbar-btn1"> <i
																class="la la-user"></i>
															</a>
														</c:when>
														<c:otherwise>
															<c:url var="myProfile" value="myProfile.do" />
															<a href="${ myProfile }"
																class="header-toolbar__btn toolbar-btn1"> <i
																class="la la-user"></i>
															</a>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
											<div class="header-toolbar__item d-block d-lg-none">
												<a href="#offcanvasMenu"
													class="header-toolbar__btn toolbar-btn menu-btn">
													<div class="hamburger-icon">
														<span></span> <span></span> <span></span> <span></span> <span></span>
														<span></span>
													</div>
												</a>
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
	</header>
	<!-- Header End -->

	<!-- Main Content Wrapper Start -->
	<main class="main-content-wrapper"> <!-- Slider area Start -->
	<section class="page-title-area bg-image ptb--80"
		data-bg-image="resources/assets/img/bg/page_title_bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<h1 class="page-title">'${searchStr }'검색 결과</h1>
				</div>
			</div>
		</div>
	</section>
	<br>
	<!-- Slider area End --> <!-- 
            <div class="container-fluid" style="border:1px solid red; height: 400px; width: 500px">
                <div class="container">
                  	실시간 검색어
                </div>
            </div>
            Top Sale Area End --> <!-- Product Tab Area Start -->
	<section class="product-tab-area mb--30 mb-md--10">
		<div class="container">
			<div class="row mb--28 mb-md--18 mb-sm--33">
				<div class="col-md-3 text-md-left text-center">
					<h2>핫딜</h2>
				</div>
				<div class="col-md-9">
					<div class="tab-style-1">
						<div
							class="nav nav-tabs justify-content-md-end justify-content-center"
							id="product-tab" role="tablist">
						</div>
					</div>
				</div>
			</div>


			<div class="row">
				<div class="col-12">


					<div class="tab-content" id="product-tab-content">
						<div class="tab-pane fade show active" id="new-all"
							role="tabpanel" aria-labelledby="new-all-tab">
							<div class="row">
								<c:forEach var="listH" items="${listH}">
									<div class="col-lg-3 col-sm-6 mb--45">
										<div class="ft-product HTfadeInUp">
											<div class="product-inner">
												<div class="product-image">
													<figure class="product-image--holder">
														<img
															src="resources/pThumb/${listH.pThumb}"
															alt="Product">
													</figure>
													<c:url var="hotDealDetail" value="hotDealDetail.do">
														<c:param name="pNo" value="${listH.pNo }" />
													</c:url>
													<a href="${hotDealDetail}" class="product-overlay"></a>
													<div class="product-action">
														<a data-toggle="modal" data-target="#productModal"
															class="action-btn"> <i class="la la-eye"></i>
														</a> <a href="${hotDealWishList}" class="action-btn"> <i
															class="la la-heart-o"></i>
														</a> <a href="${hotDealWishList}" class="action-btn"> <i
															class="la la-repeat"></i>
														</a>
													</div>
												</div>
												<div class="product-info">
													<div class="product-category">
														<a href="${hotDealDetail}">${listH.pName }</a>
													</div>
													<h3 class="product-title">
														<a href="${hotDealDetail}">${listH.pTitle }</a>
													</h3>
													<div class="product-price-wrapper">
														<span class="money"> <sup><fmt:parseNumber
																	value="${(listH.pOriginalPrice-listH.pFinalPrice)/listH.pOriginalPrice*100 }"
																	integerOnly="true" />%</sup> <s>${listH.pOriginalPrice }</s>
														</span>
													</div>
													<div class="product-price-wrapper">
														<span class="money"><h3>${listH.pFinalPrice }원</h3></span>
													</div>
													<div class="product-info-bottom">
														
														<c:choose>
															<c:when test="${ empty sessionScope.loginUser }">
																<c:url var="userLogin" value="userLogin.do" />
																<a href="${userLogin }" class="add-to-cart pr--15">
																	<i class="la la-plus"></i> <span>장바구니</span>
																</a>
															</c:when>
															<c:otherwise>
																<c:url var="hotDealAddCart" value="hotDealAddCart.do">
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
									</div>

								</c:forEach>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Tab Area End --> <!-- Product Tab Area Start -->
	<section class="product-tab-area mb--30 mb-md--10">
		<div class="container">
			<div class="row mb--28 mb-md--18 mb-sm--33">
				<div class="col-md-3 text-md-left text-center">
					<h2>땡처리</h2>
				</div>
				<div class="col-md-9">
					<div class="tab-style-1">
						<div
							class="nav nav-tabs justify-content-md-end justify-content-center"
							id="product-tab" role="tablist">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="tab-content" id="product-tab-content">
						<div class="tab-pane fade show active" id="new-all"
							role="tabpanel" aria-labelledby="new-all-tab">
							<div class="row">
								<c:forEach var="listT" items="${listT}">
								<div class="col-lg-3 col-sm-6 mb--45">
									<div class="ft-product HTfadeInUp">
										<div class="product-inner">
											<div class="product-image">
												<figure class="product-image--holder">
													<img
														src="resources/pThumb/${listT.pThumb }"
														alt="Product">
												</figure>
												<a href="${hotDealDetail}" class="product-overlay"></a>
												<div class="product-action">
													<a data-toggle="modal" data-target="#productModal"
														class="action-btn"> <i class="la la-eye"></i>
													</a> <a href="${hotDealWishList}" class="action-btn"> <i
														class="la la-heart-o"></i>
													</a> <a href="${hotDealWishList}" class="action-btn"> <i
														class="la la-repeat"></i>
													</a>
												</div>
											</div>
											<div class="product-info">
												<div class="product-category">
													<a href="${hotDealDetail}">${listT.pName }</a>
												</div>
												<h3 class="product-title">
													<a href="${hotDealDetail}">${listT.pTitle }</a>
												</h3>
												<div class="product-price-wrapper">
														<span class="money"> <sup><fmt:parseNumber
																	value="${(listT.pOriginalPrice-listT.pFinalPrice)/listT.pOriginalPrice*100 }"
																	integerOnly="true" />%</sup> <s>${listT.pOriginalPrice }</s>
														</span>
													</div>
													<div class="product-price-wrapper">
														<span class="money"><h3>${listT.pFinalPrice }원</h3></span>
												</div>
												<div class="product-info-bottom">
													<a href="${hotDealBuyForm}" class="add-to-cart pr--15">
														<i class="la la-plus"></i> <span>Add To Cart</span>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Tab Area End -->
	<section class="product-tab-area mb--30 mb-md--10">
		<div class="container">
			<div class="row mb--28 mb-md--18 mb-sm--33">
				<div class="col-md-3 text-md-left text-center">
					<h2>나눔게시판</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<table>
						<c:if test="${fn:length(listN) <= 0}">
                            <tr><td colspan="6">게시글이 존재하지 않습니다.</td></tr>
                        </c:if>
					
						<c:forEach var="listN" items="${listN }" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>${listN.sbTitle }</td>
								<td>${listN.sbContent }</td>
								<td>${listN.cName }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</section>



	</main>
	<!-- Main Content Wrapper End -->
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



	<!-- OffCanvas Menu Start -->
	<div class="offcanvas-menu-wrapper" id="offcanvasMenu">
		<div class="offcanvas-menu-inner">
			<a href="" class="btn-close"> <i class="la la-remove"></i>
			</a>
			<nav class="offcanvas-navigation">
				<ul class="offcanvas-menu">
					<li class="menu-item-has-children active"><a
						href="${introduction}" class="mainmenu_link">바이로컬</a>
						<ul class="sub-menu">
							<li><a href="${introduction}">사이트 소개 </a></li>
							<li><a href="${holymoly}"> 홀리몰리 </a></li>
							<li><a href="${noticeM}"> 공지사항 </a></li>
						</ul></li>


					<li class="menu-item-has-children active"><a
						href="${hotDeal }" class="mainmenu_link">핫딜</a>
						<ul class="sub-menu">
							<li><a href="#">디지털/가전</a></li>
							<li><a href="#">의류/패션잡화</a></li>
							<li><a href="#">뷰티/미용</a></li>
							<li><a href="#">스포츠/레저</a></li>
							<li><a href="#">도서/티켓/음반</a></li>
							<li><a href="#">가구/인테리어</a></li>
							<li><a href="#">신선/가공식품</a></li>
							<li><a href="#">게임/취미</a></li>
							<li><a href="#">반려동물용품</a></li>
							<li><a href="#">기타</a></li>
						</ul></li>


					<li class="menu-item-has-children"><a href="${ttangM }">땡처리</a>
						<ul class="sub-menu">
							<li class="menu-item-has-children">
							<li><a title="한식" href="${ttangM}"> <span
									class="mm-text">한식</span>
							</a></li>
							<li><a title="중식" href="${ttangM}"> <span
									class="mm-text">중식</span>
							</a></li>
							<li><a title="일식" href="${ttangM}"> <span
									class="mm-text">일식</span>
							</a></li>
							<li><a title="양식" href="${ttangM}"> <span
									class="mm-text">양식</span>
							</a></li>
							<li><a title="커피/제과" href="${ttangM}"> <span
									class="mm-text">커피/제과</span>
							</a></li>
							<li><a title="기타" href="${ttangM}"> <span
									class="mm-text">기타</span>
							</a></li>
						</ul></li>
					<li><a href="${shareboard }">나눔게시판</a></li>
					<li class="menu-item-has-children"><a href="${advertisement }">신청하기</a>
						<ul class="sub-menu">
							<li><a title="이벤트/광고 신청" href="${advertisementForm}"> <span
									class="mm-text">이벤트/광고 신청</span>
							</a></li>
							<li><a title="상품 신청" href="${insertProductForm}"> <span
									class="mm-text">상품 신청</span>
							</a></li>
						</ul></li>
					<li class="menu-item-has-children active"><a href="${FAQ }">고객센터</a>
						<ul class="sub-menu">
							<li><a title="FAQ" href="${FAQ}"> FAQ </a></li>
							<li><a title="QNA" href="${QNAform}"> QNA </a></li>
						</ul></li>
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

	<!-- Mini Cart Start -->
	<aside class="mini-cart" id="miniCart">
		<div class="mini-cart-wrapper">
			<div class="mini-cart__close">
				<a href="#" class="btn-close"><i class="la la-remove"></i></a>
			</div>
			<div class="mini-cart-inner">
				<h3 class="mini-cart__heading mb--45">Shopping Cart</h3>
				<div class="mini-cart__content">
					<ul class="mini-cart__list">
						<li class="mini-cart__product"><a href="#"
							class="mini-cart__product-remove"> <i class="la la-remove"></i>
						</a>
							<div class="mini-cart__product-image">
								<img src="resources/assets/img/products/prod-01-100x100.jpg"
									alt="products">
							</div>
							<div class="mini-cart__product-content">
								<a class="mini-cart__product-title" href="${hotDealDetail}">Golden
									Easy Spot Chair.</a> <span class="mini-cart__product-quantity">1
									x $49.00</span>
							</div></li>
						<li class="mini-cart__product"><a href="#"
							class="mini-cart__product-remove"> <i class="la la-remove"></i>
						</a>
							<div class="mini-cart__product-image">
								<img src="resources/assets/img/products/prod-02-100x100.jpg"
									alt="products">
							</div>
							<div class="mini-cart__product-content">
								<a class="mini-cart__product-title" href="${hotDealDetail}">Golden
									Easy Spot Chair.</a> <span class="mini-cart__product-quantity">1
									x $49.00</span>
							</div></li>
						<li class="mini-cart__product"><a href="#"
							class="mini-cart__product-remove"> <i class="la la-remove"></i>
						</a>
							<div class="mini-cart__product-image">
								<img src="resources/assets/img/products/prod-03-100x100.jpg"
									alt="products">
							</div>
							<div class="mini-cart__product-content">
								<a class="mini-cart__product-title" href="${hotDealDetail}">Golden
									Easy Spot Chair.</a> <span class="mini-cart__product-quantity">1
									x $49.00</span>
							</div></li>
					</ul>
					<div class="mini-cart__total">
						<span>Subtotal</span> <span class="ammount">$98.00</span>
					</div>
					<div class="mini-cart__buttons">
						<a href="${hotDealBuyForm}"
							class="btn btn-fullwidth btn-bg-primary mb--20">View Cart</a> <a
							href="checkout.html" class="btn btn-fullwidth btn-bg-primary">Checkout</a>
					</div>
				</div>
			</div>
		</div>
	</aside>
	<!-- Mini Cart End -->

	
        <!-- Searchform Popup Start -->
	<c:url var="totalSearch" value="totalSearch.do"/>
	<div class="searchform__popup" id="searchForm">
		<a href="#" class="btn-close"><i class="la la-remove"></i></a>
		<div class="searchform__body">
			<p>검색어를 입력하세요</p>
			<form class="searchform" method="get" action="totalSearch.do">
				<input type="text" name="popup-search" id="popup-search"
					class="searchform__input" placeholder="지역, 상품, 업체 등 을 검색해보세요">
				<button type="submit" class="searchform__submit">
					<i class="la la-search"></i>
				</button>
			</form>
		</div>
	</div>
	<!-- Searchform Popup End -->



	<!-- Global Overlay Start -->
	<div class="global-overlay"></div>
	<!-- Global Overlay End -->

	<!-- Global Overlay Start -->
	<a class="scroll-to-top" href=""><i class="la la-angle-double-up"></i></a>
	<!-- Global Overlay End -->
	</div>
	<!-- Main Wrapper End -->


	<!-- ************************* JS Files ************************* -->

	<!-- jQuery JS -->
	<script src="resources/assets/js/vendor.js"></script>

	<!-- Main JS -->
	<script src="resources/assets/js/main.js"></script>
</body>

</html>