<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html> 
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>땡처리게시판</title>
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
	<c:import url="../common/menubar.jsp"/>

        <!-- Breadcrumb area Start -->
        <section  class="page-title-area bg-image ptb--80" data-bg-image="assets/img/bg/1920X200.png">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">땡처리게시판</h1>
                        <ul class="breadcrumb">
                            <li><a href="<%=request.getContextPath() %>">Home</a></li>
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
        <div  class="main-content-wrapper">
            <div class="shop-page-wrapper ptb--80">
                <div class="container">
                    <div class="row">
                    
                   
						
                        <div class="col-xl-9 col-lg-8 order-lg-2 mb-md--50">
                            <div class="shop-toolbar mb--50">
                                <div class="row align-items-center">
                                    <div class="col-md-5 mb-sm--30 mb-xs--10">
                                        <div class="shop-toolbar__left">
                                            <div class="product-ordering">
                                                <select class="product-ordering__select nice-select">
                                                    <option value="0">기본정렬순</option>
                                                    <option value="1">관련순</option>
                                                    <option value="2">이름순, ㄱ-ㅎ</option>
                                                    <option value="3">이름순, ㅎ-ㄱ</option>
                                                    <option value="4">낮은가격순</option>
                                                    <option value="5">높은가격순</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                      </div>
                            </div>
                                    <script>
										$("#optionArray").on('change', function(){
											location.href="${ttang}?optionArray=" + $(this).val();
										});
									</script>
                              
                            
                            
                            <div class="shop-products">
                                <div class="row">
                                <!-- c:forEach start -->
									<c:forEach var="ttang" items="${list}">
                                    <div class="col-xl-4 col-sm-6 mb--50">
                                        <div class="ft-product">
                                            <div class="product-inner">
                                                <div class="product-image">
                                                    <figure class="product-image--holder">
                                                        <img src="resources/pThumb/${ttang.pThumb}" alt="상품썸네일">
                                                    </figure>
                                                    <c:url var="ttangD" value="ttangDetail.do">
                                                    	<c:param name="pNo" value="${ttang.pNo}"/>
                                                    </c:url>
                                                    <a href="${ttangD}" class="product-overlay"></a>
                                                    <!-- 비로그인 상태에서는  로그인 화면으로 넘어가기 -->
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

															<c:url var="ttangWishList"
																value="ttangAddWishList.do">
																<c:param name="pNo" value="${ttang.pNo }" />
																<c:param name="cNo" value="${loginUser.cNo }" />
															</c:url>
															<div class="product-action">
																<a href="${ttangWishList }" class="action-btn"> <i
																	class="la la-heart-o"></i>
																</a>
															</div>

														</c:otherwise>
													</c:choose>
                                                </div>
                                                <div class="product-info">
                                                    <div class="product-category">
                                                        <a href="${ttangD}">${ttang.pTitle}</a>
                                                    </div>
                                                    	<div class="product-title" style="font-weight:bold"><a href="${ttangD}">${ttang.pName}</a></div>
                                                    <div class="product-info-bottom">
                                                        <div class="product-price-wrapper">
                                                            <span class="money"><sup><fmt:parseNumber
																		value="${(ttang.pOriginalPrice-ttang.pFinalPrice)/ttang.pOriginalPrice*100 }"
																		integerOnly="true" />%</sup> <s>${ttang.pOriginalPrice }</s>
															</span>
                                                        </div>
                                                        <div class="product-price-wrapper">
                                                            <span class="money" style="color:black; /* text-decoration:line-through; */">
                                                           ${ttang.pFinalPrice}원</span>
                                                        </div>
                                                        <c:choose>
														<c:when test="${ empty sessionScope.loginUser }">
															<c:url var="userLogin" value="userLogin.do" />
																<a href="${userLogin }" class="add-to-cart pr--15">
																	<i class="la la-plus"></i> <span>장바구니</span>
																</a>
														</c:when>
														<c:otherwise>
															<c:url var="ttangAddCart" value="ttangAddCart.do" >
																<c:param name="pNo" value="${ttang.pNo }" />
																<c:param name="cNo" value="${loginUser.cNo }" />
															</c:url>
															<a href="${ttangAddCart }" class="add-to-cart pr--15">
																<i class="la la-plus"></i> <span>장바구니</span>
															</a>
														</c:otherwise>
														</c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
									</div>
                                  <!-- forEach end -->
											</c:forEach>
                                            </div>
                                        </div>
                                  
                              <!-- pagination start -->   
               				<nav class="pagination-wrap">
							<ul class="pagination">
								<c:if test="${pi.currentPage <=1 }">
									<li><span class="page-number current">&lt;&lt;</span></li>
								</c:if>
								<c:if test="${pi.currentPage > 1 }">
									<c:url var="before" value="${ttang}">
										<c:param name="page" value="${pi.currentPage-1 }"/>
									</c:url>
									<li><a class="page-number" href="${before }">&lt;&lt;</a></li>
								</c:if>
								<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
									<c:if test="${p eq pi.currentPage }">
										<li><span class="page-number current">${p }</span></li>
									</c:if>
									<c:if test="${p ne pi.currentPage }">
										<c:url var="pagination" value="${ttang}">
											<c:param name="page" value="${p }"/>
										</c:url>
										<li><a href="${pagination }" class="page-number">${p }</a></li>
									</c:if>
								</c:forEach>
								<!-- [다음] -->
								<c:if test="${pi.currentPage >= pi.maxPage}">
									<li><span class="page-number current">&gt;&gt;</span></li>
								</c:if>
								<c:if test="${pi.currentPage < pi.maxPage }">
									<c:url var="after" value="${ttang}">
										<c:param name="page" value="${pi.currentPage + 1 }"/>
									</c:url>
									<li><a class="page-number" href="${after }">&gt;&gt;</a></li>
								</c:if> 
							</ul>
						</nav>
						<!-- pagination end -->
					</div>
					
<script>
							$("#optionArray").on('change', function(){
								location.href="${ttang}?optionArray=" + $(this).val();
							});
						</script>
						
					<!-- sidebar -->	
					<div class="col-xl-3 col-lg-4 order-lg-1">
						<aside class="shop-sidebar">
							<div class="shop-widget mb--40">
								<h3 class="widget-title mb--25">카테고리</h3>
								<ul class="widget-list category-list">
									<li><a href="ttangMain.do"> <span class="category-title">전체보기</span>
											<i class="fa fa-angle-double-right"></i></a></li>
									<li><a href="${ttang }?category=한식"> <span class="category-title">한식</span>
											<i class="fa fa-angle-double-right"></i></a></li>
									<li><a href="${ttang }?category=중식"> <span class="category-title">중식</span>
											<i class="fa fa-angle-double-right"></i></a></li>
									<li><a href="${ttang }?category=일식"> <span class="category-title">일식</span>
											<i class="fa fa-angle-double-right"></i></a></li>
									<li><a href="${ttang }?category=양식"> <span class="category-title">양식</span>
											<i class="fa fa-angle-double-right"></i></a></li>
									<li><a href="${ttang }?category=커피/제과"> <span class="category-title">커피/제과</span>
											<i class="fa fa-angle-double-right"></i></a></li>
									<li><a href="${ttang }?category=기타"> <span class="category-title">기타</span>
											<i class="fa fa-angle-double-right"></i></a></li>
								</ul>
							</div>
							<div class="shop-widget">
								<h3 class="widget-title mb--25">태그</h3>
								<div class="tagcloud">
									<a href="#">제철과일</a> 
									<a href="#">단품식사</a> 
									<a href="#">혼밥</a> 
									<a href="#">가성비</a>
									<a href="#">집밥</a>
									<a href="#">다이어트</a>
									<a href="#">야식</a>
								</div>
							</div>
						</aside>
					</div>
				</div>
			</div>
		</div>
		</div>
	<!-- Main Content Wrapper Start -->
        <!-- Main Content Wrapper Start -->

    <c:import url="../common/footer.jsp"/>

 

        <!-- Global Overlay Start -->
        <div class="global-overlay"></div>
        <!-- Global Overlay End -->

        <!-- Global Overlay Start -->
        <a class="scroll-to-top" href=""><i class="la la-angle-double-up"></i></a>
        <!-- Global Overlay End -->
    <!-- Main Wrapper End -->

</body>

</html>