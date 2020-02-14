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
                                	 <a href="#" onclick="sellerOnly()" class="mainmenu__link">
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
                                                  </div>                              </div>
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
                           <ul class="sub-menu">
                                                <li>
                                                    <a href="#">디지털/가전</a>
                                                </li>
                                                <li>
                                                    <a href="#">의류/패션잡화</a>
                                                </li>
                                                <li>
                                                    <a href="#">뷰티/미용</a>
                                                </li>
                                                <li>
                                                    <a href="#">스포츠/레저</a>
                                                </li>
                                                <li>
                                                    <a href="#">도서/티켓/음반</a>
                                                </li>
                                                <li>
                                                    <a href="#">가구/인테리어</a>
                                                </li>
                                                <li>
                                                    <a href="#">신선/가공식품</a>
                                                </li>
                                                <li>
                                                    <a href="#">게임/취미</a>
                                                </li>
                                                <li>
                                                    <a href="#">반려동물용품</a>
                                                </li>
                                                <li>
                                                    <a href="#">기타</a>
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
                                	<a href="sellerOnly()">신청하기</a>
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
                           
                           
                           
                           
                           
                                </li>
                    </ul>
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
         <!-- Mini Cart Start -->
        <aside class="mini-cart" id="miniCart">
            <div class="mini-cart-wrapper">
                <div class="mini-cart__close">
                    <a href="#" class="btn-close"><i class="la la-remove"></i></a>
                </div>
                <div class="mini-cart-inner">
                    <h3 class="mini-cart__heading mb--45">장바구니</h3>
                    <div class="mini-cart__content">
                        <ul class="mini-cart__list">
                           
                           <c:forEach var="buylist" items="${ buylist }">
                           
                            <li class="mini-cart__product">
                                <a href="#" class="mini-cart__product-remove">
                                    <i class="la la-remove"></i>
                                </a>
                                <div class="mini-cart__product-image">
                                    <img src="assets/img/products/prod-01-100x100.jpg" alt="products">
                                </div>
                                <div class="mini-cart__product-content">
                                    <a class="mini-cart__product-title" href="product-details.html">${buylist.pName }</a>
                                    <span class="mini-cart__product-quantity">${buylist.quantity }개 x ${buylist.pFinalPrice}원</span>
                                </div>
                            </li>
                              </c:forEach>
                            
                        </ul>
                        <div class="mini-cart__total">
                            <span>합계 금액</span>
                            <span class="ammount">${total }원</span>
                        </div>
                        <div class="mini-cart__buttons">
                            <a href="cart.html" class="btn btn-fullwidth btn-bg-primary mb--20">View Cart</a>
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
        
	</div>
	
	 <!-- ************************* JS Files ************************* -->

	    <!-- jQuery JS -->
	    <script src="resources/assets/js/vendor.js"></script>
	
	    <!-- Main JS -->
	    <script src="resources/assets/js/main.js"></script>
	

</body>
</html>