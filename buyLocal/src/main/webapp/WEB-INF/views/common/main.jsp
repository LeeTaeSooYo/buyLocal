<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html class="no-js" lang="zxx">
 
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>바이로컬</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicons -->
    <link rel="shortcut icon" href="resources/assets/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="resources/assets/img/icon.png">

    <!-- ************************* CSS Files ************************* -->

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="resources/assets/css/vendor.css">

    <!-- style css -->
    <link rel="stylesheet" href="resources/assets/css/main.css">

   <style>
    
    table.type04 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
	  margin : 20px 10px;
	}
	table.type04 th {
	    width: 150px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
	table.type04 td {
	    width: 350px;
	    padding: 10px;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	}
    
    </style>



</head>

<body>

	<script>
      <c:if test="${!empty msg}">
         alert('${msg}');
         <c:remove var="msg"/>
      </c:if>
   </script> 

 <!-- Preloader Start -->   
    <div class="ft-preloader active">
        <div class="ft-preloader-inner h-100 d-flex align-items-center justify-content-center">
            <div class="ft-child ft-bounce1"></div>
            <div class="ft-child ft-bounce2"></div>
            <div class="ft-child ft-bounce3"></div>
        </div>
    </div> 
    
    <!-- Preloader End -->
 	<c:url var="hotDealWishList" value="hotDealWishList.do"/>
	<c:url var="hotDealBuyForm" value="hotDealBuyForm.do"/>
	<c:url var="hotDealDetail" value="hotDealDetail.do" />
	<c:url var="admin" value="goAdmin.do"/>

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
                                           <a href="<%=request.getContextPath() %>" class="logo--normal">
                                                <img src="resources/assets/img/logo/logo.png" alt="Logo">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="header__main-center">
                                        <nav class="main-navigation text-center d-none d-lg-block">
                                            <ul class="mainmenu">
                                                <li class="mainmenu__item menu-item-has-children">
                                                	<c:url var="introduction" value="introduction.do"/>
                                                	<c:url var="holymoly" value="holymoly.do"/>
                                                 	<c:url var="noticeM" value="noticeList.do"/>
                                                    <a href="${introduction}" class="mainmenu__link">
                                                        <span class="mm-text">바이로컬</span>
                                                    </a>
                                                    <ul class="sub-menu">
                                                        <li>
                                                            <a href="${introduction}">
                                                                <span class="mm-text">사이트 소개</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="${holymoly}">
                                                                <span class="mm-text">홀리몰리</span>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="${noticeM}">
                                                                <span class="mm-text">공지사항</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="mainmenu__item menu-item-has-children megamenu-holder">
                                                	<c:url var="hotDeal" value="hotDealMenu.do"/>
                                                    <a href="${hotDeal}" class="mainmenu__link">
                                                        <span class="mm-text">핫딜</span>
                                                    </a>
                                                    <ul class="megamenu">
                                                        <li>
                                                            <ul>
                                                                <li>
                                                                    <a href="${hotDeal }?category=디지털/가전">
                                                                        <span class="mm-text">디지털/가전</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="${hotDeal }?category=의류/패션잡화">
                                                                        <span class="mm-text">의류/패션잡화</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="${hotDeal }?category=뷰티/미용">
                                                                        <span class="mm-text">뷰티/미용</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="${hotDeal }?category=스포츠/레저">
                                                                        <span class="mm-text">스포츠/레저</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="${hotDeal }?category=도서/티켓/음반">
                                                                        <span class="mm-text">도서/티켓/음반</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                        <li>
                                                            <ul> 
                                                                <li>
                                                                    <a href="${hotDeal }?category=가구/인테리어">
                                                                        <span class="mm-text">가구/인테리어</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="${hotDeal }?category=신선/가공식품">
                                                                        <span class="mm-text">신선/가공식품</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="${hotDeal }?category=게임/취미">
                                                                        <span class="mm-text">게임/취미</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="${hotDeal }?category=반려동물용품">
                                                                        <span class="mm-text">반려동물용품</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="${hotDeal }?category=기타">
                                                                        <span class="mm-text">기타</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </li>
                                             <li class="mainmenu__item menu-item-has-children">
                                                    <c:url var="ttangM" value="ttangMain.do"/>
                                                    <a href="${ttangM}" class="mainmenu__link">
                                                        <span class="mm-text">땡처리</span>
                                                    </a>
                                                    <ul class="sub-menu">
                                                        <li class="menu-item-has-children">
                                                            <li>
                                                                <a title="한식" href="${ttang }?category=한식">
                                                                    <span class="mm-text">한식</span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a title="중식" href="${ttang }?category=중식">
                                                                    <span class="mm-text">중식</span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a title="일식" href="${ttang }?category=일식">
                                                                    <span class="mm-text">일식</span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a title="양식" href="${ttang }?category=양식">
                                                                    <span class="mm-text">양식</span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a title="커피/제과" href="${ttang }?category=커피/제과">
                                                                    <span class="mm-text">커피/제과</span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a title="기타" href="${ttang }?category=기타">
                                                                    <span class="mm-text">기타</span>
                                                                </a>
                                                            </li>
                                                            </ul>
                                                       </li>
                                                      
                                                <li class="mainmenu__item">
														<c:url var="shareboard" value="shareboard.do"/>
                                                   <a href="${shareboard }" class="mainmenu__link">
                                                        <span class="mm-text">나눔게시판</span>
                                                    </a>
                                                </li>
						                       <li class="mainmenu__item menu-item-has-children">
                                                    <c:url var="advertisementForm" value="advertisementForm.do"/>
                                                    <c:url var="insertProductForm" value="insertProductType.do"/>
                                                         <c:choose>
                                                      
                                	<c:when test="${loginUser.cLevel eq '사업자' }">
                                		 <a href="${insertProductForm}" class="mainmenu__link">
                                                        <span class="mm-text">신청하기</span>
                                                    </a>
                                		<ul class="sub-menu">
                                      <li>
                                          <a title="이벤트/광고 신청" href="${advertisementForm}">
                                              <span class="mm-text">이벤트/광고 신청</span>
                                          </a>
                                      </li>
                                      <li>
                                          <a title="상품 신청" href="${insertProductForm}">
                                              <span class="mm-text">상품 신청</span>
                                          </a>
                                      </li>
                                    </ul> 
                                	</c:when>
                                	<c:otherwise>
                                	 <a href="#" onclick="sellerOnly()"class="mainmenu__link">
                                                        <span class="mm-text">신청하기</span>
                                                    </a>
                                                  
                                		<ul class="sub-menu">
                                      <li>
                                          <a title="이벤트/광고 신청" href="#" onclick="sellerOnly()">
                                              <span class="mm-text">이벤트/광고 신청</span>
                                          </a>
                                      </li>
                                      <li>
                                          <a title="상품 신청" href="#" onclick="sellerOnly()">
                                              <span class="mm-text">상품 신청</span>
                                          </a>
                                      </li>
                                    </ul> 
                                	</c:otherwise>
                                	</c:choose>
                                                   
                                                   
                                                 </li>
                                                 
                                                  <li class="mainmenu__item menu-item-has-children">
                                                    <c:url var="FAQ" value="FAQ.do"/>
                                                    <c:url var="QNAform" value="QNAform.do"/>
                                                 
                                                                  <c:choose>
                                	<c:when test="${ empty sessionScope.loginUser }">
                                		<c:url var="userLogin" value="userLogin.do"/>	
                                		<a href="${FAQ}" class="mainmenu__link">
                                                        <span class="mm-text">고객센터</span>
                                                    </a>
                                                  <ul class="sub-menu">
                                                        <li class="menu-item-has-children">
                                                            <li>
                                                                <a title="FAQ" href="${FAQ}">
                                                                    <span class="mm-text">FAQ</span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a title="QNA" href="${userLogin}">
                                                                    <span class="mm-text">QNA</span>
                                                                </a>
                                                            </li>
                                                   </ul> 
                                	</c:when>
                                	<c:otherwise>
                                	 <a href="${FAQ}" class="mainmenu__link">
                                                        <span class="mm-text">고객센터</span>
                                                    </a>
                                                  <ul class="sub-menu">
                                                        <li class="menu-item-has-children">
                                                            <li>
                                                                <a title="FAQ" href="${FAQ}">
                                                                    <span class="mm-text">FAQ</span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a title="QNA" href="${QNAform}">
                                                                    <span class="mm-text">QNA</span>
                                                                </a>
                                                            </li>
                                                   </ul>
                                	</c:otherwise>
                                	</c:choose>
                                                 </li>
                                            </ul>
                                            
                                            
                                            
                                            
                                        </nav>
                                    </div>
                                    <div class="header__main-right">
                                        <div class="header-toolbar-wrap">
                                            <div class="header-toolbar">
                                                <div class="header-toolbar__item header-toolbar--search-btn">
                                                    <a href="#searchForm" class="header-toolbar__btn toolbar-btn">
                                                        <i class="la la-search"></i>
                                                    </a>
                                                </div>
                                               <!-- 메뉴바 아이콘 추가 (소망) -->
                                                <div class="header-toolbar__item header-toolbar--minicart-btn">
                                                   <c:if test="${ loginUser.cId eq 'admin' }">
                                                     <c:url var="Count" value="Count.do"/>
                                                    <a href="${ Count }" class="header-toolbar__btn toolbar-btn1">
                                                        <i class="la la-wrench"></i>
                                                    </a>
                                                    </c:if>
                                                </div>
                                                <div class="header-toolbar__item header-toolbar--minicart-btn">
                                                   <c:if test="${ !empty sessionScope.loginUser }">
                                                   <c:url var="logout" value="logout.do"/>
                                                    <a href="${ logout }" class="header-toolbar__btn toolbar-btn1">
                                                        <i class="la la-power-off"></i>
                                                    </a>
                                                    </c:if>
                                                </div>
                                                <div class="header-toolbar__item header-toolbar--minicart-btn">
                                                   <c:if test="${ !empty sessionScope.loginUser }">
                                                   <c:url var="myFavorite" value="myFavorite.do">
                                                      <c:param name="cNo" value="${ loginUser.cNo }"/>
                                                   </c:url>
                                                    <a href="${ myFavorite }" class="header-toolbar__btn toolbar-btn1">
                                                        <i class="la la-heart-o"></i>
                                                    </a>
                                                    </c:if>
                                                </div>
                                                <div class="header-toolbar__item header-toolbar--minicart-btn">
                                                    <a href="#miniCart" class="header-toolbar__btn toolbar-btn">
                                                        <i class="la la-shopping-cart"></i>
                                                    </a>
                                                </div>
                                                <div class="header-toolbar__item header-toolbar--minicart-btn">
                                                    <!-- 로그인 페이지 이동 처리 추가 (소망) -->
                                                    <!-- 로그인 유저가 있을 시 같은 버튼을 누르면 회원 프로필 페이지로 이동 -->
                                                    <c:choose>
                                                        <c:when test="${ empty sessionScope.loginUser }">
                                                           <c:url var="userLogin" value="userLogin.do"/>                                                       <c:url var="userLogin" value="userLogin.do"/>
                                                          <a href="${ userLogin }" class="header-toolbar__btn toolbar-btn1">
                                                              <i class="la la-user"></i>
                                                          </a>   
                                                      </c:when>
                                                      <c:otherwise>
                                                         <c:url var="myProfile" value="myProfile.do"/>   
                                                         <a href="${ myProfile }" class="header-toolbar__btn toolbar-btn1">
                                                              <i class="la la-user"></i>
                                                          </a>
                                                      </c:otherwise>
                                                    </c:choose>
                                                  </div>                                                 </div>
                                                <div class="header-toolbar__item d-block d-lg-none">
                                                    <a href="#offcanvasMenu" class="header-toolbar__btn toolbar-btn menu-btn">
                                                        <div class="hamburger-icon">
                                                            <span></span>
                                                            <span></span>
                                                            <span></span>
                                                            <span></span>
                                                            <span></span>
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
        <main class="main-content-wrapper">
            <!-- Slider area Start -->
         <!-- Slider area Start -->
            <section class="homepage-slider mb--75 mb-md--55">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="element-carousel slick-right-bottom"
                            data-slick-options='{
                                "slidesToShow": 1, 
                                "arrows": true,
                                "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "la la-arrow-left" },
                                "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "la la-arrow-right" }
                            }' 
                            data-slick-responsive='[{"breakpoint": 768, "settings": {"arrows": false}}]'>
                                <div class="item">
                                   <!-- 슬라이드 색 변경 -->
                                    <div class="single-slide d-flex align-items-center bg-color" data-bg-color="#ffebcd">
                                        <div class="row align-items-center no-gutters w-100">
                                            <div class="col-xl-7 col-md-6 mb-sm--50">
                                                <figure data-animation="fadeInUp" data-duration=".3s" data-delay=".3s" class="plr--15">
                                                    <img src="resources/assets/img/slider/slider-01-img-01.png" alt="Slider O1 image" class="mx-auto">
                                                </figure>
                                            </div>
                                            <div class="col-md-6 col-lg-5 offset-lg-1 offset-xl-0">
                                                <div class="slider-content">
                                                    <div class="slider-content__text mb--40 mb-md--30">
                                                        <p class="mb--15" data-animation="fadeInUp" data-duration=".3s" data-delay=".3s">#New Treand</p>
                                                        <p class="mb--20" data-animation="fadeInUp" data-duration=".3s" data-delay=".3s">Enlight your world. Make yourself more bright.</p>
                                                        <h1 class="heading__primary lh-pt7" data-animation="fadeInUp" data-duration=".3s" data-delay=".3s">Abotar Lighting</h1>
                                                    </div>
                                                    <div class="slider-content__btn">
                                                        <a href="#" class="btn btn-outline btn-brw-2" data-animation="fadeInUp" data-duration=".3s" data-delay=".6s">Shop Now</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="single-slide d-flex align-items-center bg-color" data-bg-color="#ffebcd">
                                        <div class="row align-items-center no-gutters w-100">
                                            <div class="col-xl-6 col-md-6 mb-sm--50 order-md-2">
                                                <figure data-animation="fadeInUp" data-duration=".3s" data-delay=".3s" class="pl-15 pr--60">
                                                    <img src="resources/assets/img/slider/slider-02-img-01.png" alt="Slider O1 image" class="mx-auto">
                                                </figure>
                                            </div>
                                            <div class="col-md-5 col-lg-5 offset-md-1 order-md-1">
                                                <div class="slider-content">
                                                    <div class="slider-content__text border-color-2 mb--40 mb-md--30">
                                                        <p class="mb--15" data-animation="fadeInUp" data-duration=".3s" data-delay=".3s">#New Treand</p>
                                                        <p class="mb--20" data-animation="fadeInUp" data-duration=".3s" data-delay=".3s">Enlight your world. Make yourself more bright.</p>
                                                        <h1 class="heading__primary lh-pt7" data-animation="fadeInUp" data-duration=".3s" data-delay=".3s">Abotar Lighting</h1>
                                                    </div>
                                                    <div class="slider-content__btn">
                                                        <a href="#" class="btn btn-outline btn-brw-2 btn-brc-2" data-animation="fadeInUp" data-duration=".3s" data-delay=".6s">Shop Now</a>
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
            </section>
            <!-- Slider area End -->
            <!-- Slider area End -->
            
           <!-- 범석 20.01.31. -->
            <div class="container-fluid" style="height: 600px; width: 1000px">
                <div>
                  	<h2>실시간 인기 검색어</h2>
                </div>
                <hr>
                <table style="width: 100%">
                	<c:forEach var="searchList" items="${searchList }" end="9" varStatus="status">
                		<tr onclick="location.href='totalSearch.do?popup-search=${searchList.searchStr}'">
                			<td><h4>(${status.count })</h4></td>
                			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                			<td><h4>${searchList.searchStr }</h4></td>
                		</tr>
                	</c:forEach>
                </table>
                <hr>
            </div>
            <!-- Top Sale Area End --> <!-- Product Tab Area Start -->
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
							<c:url var="hotDeal" value="hotDealMenu.do" />
							<a class="nav-item nav-link active" id="new-all-tab"
								 href="${hotDeal}"> <span
								class="nav-text">더보기</span>
							</a>
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
								<c:forEach var="listH" items="${list}" end="3">
									<c:url var="hotDealDetail" value="hotDealDetail.do">
										<c:param name="pNo" value="${listH.pNo}" />
									</c:url>
									<div class="col-lg-3 col-sm-6 mb--45">
										<div class="ft-product HTfadeInUp">
											<div class="product-inner">
												<div class="product-image">
													<figure class="product-image--holder">
														<img
															src="resources/pThumb/${listH.pThumb}"
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
														<a href="${hotDealDetail}">${listH.pTitle}</a>
													</div>
													<div class="product-title" style="font-weight:bold">
														<a href="${hotDealDetail}">${listH.pName }</a>
													</div>
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
							<a class="nav-item nav-link active" id="new-all-tab"
								 href="${ttangM }" > <span
								class="nav-text">더보기</span>
							</a>
							
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
								<c:forEach var="listT" items="${list2}" end="3">
									<div class="col-lg-3 col-sm-6 mb--45">
										<div class="ft-product HTfadeInUp">
											<div class="product-inner">
												<div class="product-image">
													<figure class="product-image--holder">
														<img
															src="resources/pThumb/${listT.pThumb}"
															alt="Product">
													</figure>
													<a href="${ttangM}" class="product-overlay"></a>
													<div class="product-action">
														<a data-toggle="modal" data-target="#productModal"
															class="action-btn"> <i class="la la-eye"></i>
														</a> <a href="#" class="action-btn"> <i
															class="la la-heart-o"></i>
														</a> <a href="#" class="action-btn"> <i
															class="la la-repeat"></i>
														</a>
													</div>
												</div>
												<div class="product-info">
													<div class="product-category">
														<a href="#">${listT.pName }</a>
													</div>
													<h3 class="product-title">
														<a href="#">${listT.pTitle }</a>
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
														
														<c:choose>
															<c:when test="${ empty sessionScope.loginUser }">
																<c:url var="userLogin" value="userLogin.do" />
																<a href="${userLogin }" class="add-to-cart pr--15">
																	<i class="la la-plus"></i> <span>장바구니</span>
																</a>
															</c:when>
															<c:otherwise>
																<c:url var="hotDealAddCart" value="hotDealAddCart.do">
																	<c:param name="pNo" value="#" />
																	<c:param name="cNo" value="#" />
																</c:url>
																<a href="#" class="add-to-cart pr--15">
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
	<!-- Product Tab Area End -->
	<section class="product-tab-area mb--30 mb-md--10">
		<div class="container">
			
			<div class="row" style="height: 100%;">
				<div style="height:100%; width:50%;">
					<h3>나눔게시판</h3>
					<table class="type04">
						<tr>
							<th style="width:50px;">no</th>
							<th>제목</th>
							<!-- <th>내용</th> -->
							<th style="width:100px;">작성자</th>
						</tr>
						<c:if test="${fn:length(list3) <= 0}">
                            <tr><td colspan="6">게시글이 존재하지 않습니다.</td></tr>
                        </c:if>
					
						<c:forEach var="listN" items="${list3 }" end="5" varStatus="status">
							<tr>
								<td style="width:50px;">${status.count }</td>
								  <td>
		                        <c:url var="sbdetail" value="sbdetail.do">
		                           <c:param name="sbNo" value="${listN.sbNo }"/>
		                           <c:param name="page" value="${pi.currentPage }"/>
		                        </c:url>
		                        <a class="sbdetail" href="${sbdetail }">${listN.sbTitle }</a></td>
								<td style="width:100px;">${listN.cName }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div style="height: 100%; width: 50%">
               <h3>공지사항</h3>
               <table class="type04">
                  <tr>
                     <th style="width:50px;">no</th>
                     <th>제목</th>
                     <th style="width:80px;">작성일</th>
                     <!-- <th style="width:50px;">조회수</th> -->
                  </tr>
               <c:if test="${fn:length(list4) <= 0}">
                        <tr><td colspan="6">게시글이 존재하지 않습니다.</td></tr>
                    </c:if>
                    <c:forEach var="listS" items="${list4 }" end="9" varStatus="status">
                       <tr style="border: 1px solid black">
      
                       
                          <td style="width:50px;">${status.count }</td>
                          
                          <td>
                           <c:url var="noticeDetail" value="noticeDetail.do">
                          <c:param name="nNo" value="${ listS.nNo }"/>
                       </c:url>
                        <a href="${noticeDetail}" style="color: black; text-decoration: none;">${ listS.nTitle }</a>
                        </td>
                        
                       
                          <td style="width:120px;">${listS.nDate }</td>
                          <%-- <td style="width:50px;">${listS.nView }</td> --%>
                       </tr>
                    </c:forEach>
               </table>
            </div>
			</div>
		</div>
	</section>
	
	</main>
            

   
        <!-- OffCanvas Menu Start -->
        <div class="offcanvas-menu-wrapper" id="offcanvasMenu">
            <div class="offcanvas-menu-inner">
                <a href="" class="btn-close">
                    <i class="la la-remove"></i>
                </a>
                <nav class="offcanvas-navigation">
                    <ul class="offcanvas-menu">
                        <li class="menu-item-has-children active">
                       	<a href="${introduction}" class="mainmenu_link">바이로컬</a>
                            <ul class="sub-menu">
                              <li>
                                  <a href="${introduction}">사이트 소개
                                  </a>
                              </li>
                              <li>
                                  <a href="${holymoly}">
                                    	  홀리몰리
                                  </a>
                              </li>
                              <li>
                                  <a href="${noticeM}">
                                    	  공지사항
                                  </a>
                              </li>
                          </ul>
                        </li>
                      
                      
                       <li class="menu-item-has-children active">
                            <a href="${hotDeal }"  class="mainmenu_link">핫딜</a>
                          <ul class="megamenu">
                                                        <li>
                                                            <ul>
                                                                <li>
                                                                    <a href="${hotDeal }?category=디지털/가전">
                                                                        <span class="mm-text">디지털/가전</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="${hotDeal }?category=의류/패션잡화">
                                                                        <span class="mm-text">의류/패션잡화</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="${hotDeal }?category=뷰티/미용">
                                                                        <span class="mm-text">뷰티/미용</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="${hotDeal }?category=스포츠/레저">
                                                                        <span class="mm-text">스포츠/레저</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="${hotDeal }?category=도서/티켓/음반">
                                                                        <span class="mm-text">도서/티켓/음반</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                        <li>
                                                            <ul> 
                                                                <li>
                                                                    <a href="${hotDeal }?category=가구/인테리어">
                                                                        <span class="mm-text">가구/인테리어</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="${hotDeal }?category=신선/가공식품">
                                                                        <span class="mm-text">신선/가공식품</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="${hotDeal }?category=게임/취미">
                                                                        <span class="mm-text">게임/취미</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="${hotDeal }?category=반려동물용품">
                                                                        <span class="mm-text">반려동물용품</span>
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="${hotDeal }?category=기타">
                                                                        <span class="mm-text">기타</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                </li>
                      
                      
                                <li class="menu-item-has-children">
                                    <a href="${ttangM }" >땡처리</a>
                                          <ul class="sub-menu">
                                                        <li class="menu-item-has-children">
                                                            <li>
                                                                <a title="한식" href="${ttang }?category=한식">
                                                                    <span class="mm-text">한식</span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a title="중식" href="${ttang }?category=중식">
                                                                    <span class="mm-text">중식</span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a title="일식" href="${ttang }?category=일식">
                                                                    <span class="mm-text">일식</span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a title="양식" href="${ttang }?category=양식">
                                                                    <span class="mm-text">양식</span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a title="커피/제과" href="${ttang }?category=커피/제과">
                                                                    <span class="mm-text">커피/제과</span>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a title="기타" href="${ttang }?category=기타">
                                                                    <span class="mm-text">기타</span>
                                                                </a>
                                                            </li>
                                                            </ul>
                                </li>
                                <li>
		                            <a href="${shareboard }">나눔게시판</a>
		                        </li>
                                <li class="menu-item-has-children">
                                    
                                          <c:choose>
                                	<c:when test="${loginUser.cLevel eq '사업자' }">
                                		<a href="${insertProductForm}">신청하기</a>
                                			<ul class="sub-menu">
                                   				 <li>
                                           <a title="이벤트/광고 신청" href="${advertisementForm}">
                                               <span class="mm-text">이벤트/광고 신청</span>
                                           </a>
                                    			</li>
                                    			<li>
                                           <a title="상품 신청" href="${insertProductForm}">
                                               <span class="mm-text">상품 신청</span>
                                           </a>
                                       </li>
                                 			 </ul> 
                                	</c:when>
                                	<c:otherwise>
                                	<a href="#" onclick="sellerOnly()" >신청하기</a>
                                		<ul class="sub-menu">
                                      <li>
                                          <a title="이벤트/광고 신청" href="#" onclick="sellerOnly()">
                                              <span class="mm-text">이벤트/광고 신청</span>
                                          </a>
                                      </li>
                                      <li>
                                          <a title="상품 신청" href="#" onclick="sellerOnly()">
                                              <span class="mm-text">상품 신청</span>
                                          </a>
                                      </li>
                                    </ul> 
                                    <!--  '신청하기' : 사업자 회원 아닐 경우, alert창 뜨기  -->
                                    <script>
                                    	function sellerOnly(){
                                    		alert('사업자 회원만 접근 가능합니다.');
                                    	};
                                    </script>
                                	</c:otherwise>
                                	</c:choose>
                                </li>
                        <li class="menu-item-has-children active">
                            
                          <c:choose>
                                	<c:when test="${ empty sessionScope.loginUser }">
                                		<c:url var="userLogin" value="userLogin.do"/>
                                		<a href="${userLogin }">고객센터</a>	
                                			<ul class="sub-menu">
			                                    <li>
			                                        <a title="FAQ" href="${FAQ}">
			                                            FAQ
			                                        </a>
			                                    </li>
			                                    <li>
			                                        <a title="QNA" href="${userLogin}">
			                                            QNA
			                                        </a>
			                                    </li>
			                           </ul>
                                	</c:when>
                                	<c:otherwise>
                                	<a href="${FAQ }">고객센터</a>
                                		<ul class="sub-menu">
                                    <li>
                                        <a title="FAQ" href="${FAQ}">
                                            FAQ
                                        </a>
                                    </li>
                                    <li>
                                        <a title="QNA" href="${QNAform}">
                                            QNA
                                        </a>
                                    </li>
                           			</ul> 
                                	</c:otherwise>
                                	</c:choose>
                    <div class="site-info vertical">
                        <div class="site-info__item">
                            <a href="tel:+01223566678"><strong>+01 2235 666 78</strong></a>
                            <a href="mailto:Support@contixs.com">Support@furtrate.com</a>
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
                            <li class="mini-cart__product">
                                <a href="#" class="mini-cart__product-remove">
                                    <i class="la la-remove"></i>
                                </a>
                                <div class="mini-cart__product-image">
                                    <img src="resources/assets/img/products/prod-01-100x100.jpg" alt="products">
                                </div>
                                <div class="mini-cart__product-content">
                                    <a class="mini-cart__product-title" href="${hotDealDetail}">Golden Easy Spot Chair.</a>
                                    <span class="mini-cart__product-quantity">1 x $49.00</span>
                                </div>
                            </li>
                            <li class="mini-cart__product">
                                <a href="#" class="mini-cart__product-remove">
                                    <i class="la la-remove"></i>
                                </a>
                                <div class="mini-cart__product-image">
                                    <img src="resources/assets/img/products/prod-02-100x100.jpg" alt="products">
                                </div>
                                <div class="mini-cart__product-content">
                                    <a class="mini-cart__product-title" href="${hotDealDetail}">Golden Easy Spot Chair.</a>
                                    <span class="mini-cart__product-quantity">1 x $49.00</span>
                                </div>
                            </li>
                            <li class="mini-cart__product">
                                <a href="#" class="mini-cart__product-remove">
                                    <i class="la la-remove"></i>
                                </a>
                                <div class="mini-cart__product-image">
                                    <img src="resources/assets/img/products/prod-03-100x100.jpg" alt="products">
                                </div>
                                <div class="mini-cart__product-content">
                                    <a class="mini-cart__product-title" href="${hotDealDetail}">Golden Easy Spot Chair.</a>
                                    <span class="mini-cart__product-quantity">1 x $49.00</span>
                                </div>
                            </li>
                        </ul>
                        <div class="mini-cart__total">
                            <span>Subtotal</span>
                            <span class="ammount">$98.00</span>
                        </div>
                        <div class="mini-cart__buttons">
                            <a href="${hotDealBuyForm}" class="btn btn-fullwidth btn-bg-primary mb--20">View Cart</a>
                            <a href="checkout.html" class="btn btn-fullwidth btn-bg-primary">Checkout</a>
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