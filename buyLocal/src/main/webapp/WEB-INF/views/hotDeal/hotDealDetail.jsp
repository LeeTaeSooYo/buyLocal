<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<!-- <html class="no-js" lang="zxx"> -->
<html lang="en">
 
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>핫딜게시판 - 상세</title>
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
    
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link href="summernote.css" rel="stylesheet">
		<script src="summernote.min.js"></script>
		
		<!-- include summernote-ko-KR -->
		<script src="lang/summernote-ko-KR.js"></script>

    
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
	<c:import url="../common/menubar.jsp" />
	
        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="resources/assets/img/bg/page_title_bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">핫딜게시판</h1>
                        <ul class="breadcrumb">
                            <li><a href="index.html">Home</a></li>
                            <li class="current"><span>Product Details</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb area End -->

        <!-- Main Content Wrapper Start -->
        <div class="main-content-wrapper">
            <div class="page-content-inner pt--80 pt-md--60">
                <div class="container">
                    <div class="row no-gutters mb--80 mb-md--57">
                        <div class="col-lg-7 product-main-image">
                            <div class="product-image">
                                <div class="product-gallery vertical-slide-nav">
                                    <div class="product-gallery__large-image mb-sm--30">
                                        <div class="product-gallery__wrapper">
                                            <div class="element-carousel main-slider image-popup"
                                            data-slick-options='{
                                                "slidesToShow": 1,
                                                "slidesToScroll": 1,
                                                "infinite": true,
                                                "arrows": false, 
                                                "asNavFor": ".nav-slider"
                                            }'>
                                                <figure class="product-gallery__image zoom">
                                                    <img src="resources/pThumb/${hotdealDetail.pThumb}" alt="Product">
                                                    <span class="product-badge sale">Sale</span>
                                                    <div class="product-gallery__actions">
                                                        <button class="action-btn btn-zoom-popup"><i class="la la-eye"></i></button>
                                                    </div>
                                                </figure>
                                                <figure class="product-gallery__image zoom">
                                                    <img src="resources/pThumb/${hotdealDetail.pThumb}" alt="Product">
                                                    <span class="product-badge sale">Sale</span>
                                                    <div class="product-gallery__actions">
                                                        <button class="action-btn btn-zoom-popup"><i class="la la-eye"></i></button>
                                                    </div>
                                                </figure>
                                                <figure class="product-gallery__image zoom">
                                                    <img src="resources/pThumb/${hotdealDetail.pThumb}" alt="Product">
                                                    <span class="product-badge sale">Sale</span>
                                                    <div class="product-gallery__actions">
                                                        <button class="action-btn btn-zoom-popup"><i class="la la-eye"></i></button>
                                                    </div>
                                                </figure>
                                                <figure class="product-gallery__image zoom">
                                                    <img src="resources/pThumb/${hotdealDetail.pThumb}" alt="Product">
                                                    <span class="product-badge sale">Sale</span>
                                                    <div class="product-gallery__actions">
                                                        <button class="action-btn btn-zoom-popup"><i class="la la-eye"></i></button>
                                                    </div>
                                                </figure>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-gallery__nav-image">
                                        <div class="element-carousel nav-slider product-slide-nav slick-center-bottom" 
                                        data-slick-options='{
                                            "spaceBetween": 10,
                                            "slidesToShow": 3,
                                            "slidesToScroll": 1,
                                            "vertical": true,
                                            "swipe": true,
                                            "verticalSwiping": true,
                                            "infinite": true,
                                            "focusOnSelect": true,
                                            "asNavFor": ".main-slider",
                                            "arrows": true, 
                                            "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "la la-angle-up" },
                                            "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "la la-angle-down" }
                                        }'
                                        data-slick-responsive='[
                                            {
                                                "breakpoint":1200, 
                                                "settings": {
                                                    "slidesToShow": 2
                                                } 
                                            },
                                            {
                                                "breakpoint":992, 
                                                "settings": {
                                                    "slidesToShow": 3
                                                } 
                                            },
                                            {
                                                "breakpoint":767, 
                                                "settings": {
                                                    "slidesToShow": 4,
                                                    "vertical": false
                                                } 
                                            },
                                            {
                                                "breakpoint":575, 
                                                "settings": {
                                                    "slidesToShow": 3,
                                                    "vertical": false
                                                } 
                                            },
                                            {
                                                "breakpoint":480, 
                                                "settings": {
                                                    "slidesToShow": 2,
                                                    "vertical": false
                                                } 
                                            }
                                        ]'>
                                            <figure class="product-gallery__nav-image--single">
                                                <img src="resources/pThumb/${hotdealDetail.pThumb}" alt="Products">
                                            </figure>
                                            <figure class="product-gallery__nav-image--single">
                                                <img src="resources/pThumb/${hotdealDetail.pThumb}" alt="Products">
                                            </figure>
                                            <figure class="product-gallery__nav-image--single">
                                                <img src="resources/pThumb/${hotdealDetail.pThumb}" alt="Products">
                                            </figure>
                                            <figure class="product-gallery__nav-image--single">
                                                <img src="resources/pThumb/${hotdealDetail.pThumb}" alt="Products">
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 offset-xl-1 col-lg-5 product-main-details mt-md--50">
                            <div class="product-summary pl-lg--30 pl-md--0">
                                <div class="product-navigation text-right mb--20">
                                    <a href="#" class="prev"><i class="la la-angle-double-left"></i></a>
                                    <a href="#" class="next"><i class="la la-angle-double-right"></i></a>
                                </div>
                                <div class="product-rating d-flex mb--20">
                                    <c:choose>
                                             <c:when test="${hotdealDetail.pStarRate == 5}">
                                                <div class="star-rating star-five"
                                                   style="margin-left: 0px">
                                                   <span>Rated <strong class="rating">5.00</strong>
                                                      out of 5
                                                   </span>
                                                </div>
                                             </c:when>
                                             <c:when test="${hotdealDetail.pStarRate == 4}">
                                                <div class="star-rating star-four"
                                                   style="margin-left: 0px">
                                                   <span>Rated <strong class="rating">5.00</strong>
                                                      out of 5
                                                   </span>
                                                </div>
                                             </c:when>
                                             <c:when test="${hotdealDetail.pStarRate == 3}">
                                                <div class="star-rating star-three"
                                                   style="margin-left: 0px">
                                                   <span>Rated <strong class="rating">5.00</strong>
                                                      out of 5
                                                   </span>
                                                </div>
                                             </c:when>
                                             <c:when test="${hotdealDetail.pStarRate == 2}">
                                                <div class="star-rating star-two"
                                                   style="margin-left: 0px">
                                                   <span>Rated <strong class="rating">5.00</strong>
                                                      out of 5
                                                   </span>
                                                </div>
                                             </c:when>
                                             <c:when test="${hotdealDetail.pStarRate == 1}">
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
                                </div>

                                
                                <h3 class="product-title mb--20">${hotdealDetail.pTitle }</h3>
                                <p class="product-short-description mb--20">${hotdealDetail.pInfoText }</p>
                                <div class="product-price-wrapper mb--25">
                                    <span class="money">할인 전 가격 : ${hotdealDetail.pOriginalPrice }원</span>
                                    <span class="money">할인 후 가격 : ${hotdealDetail.pFinalPrice }원</span>
                                    <div>판매 수량 : ${hotdealDetail.pAmount }</div>

                                </div>
                                
                               <form action="hotDealAddCart.do" method="post">
                                <div class="product-action d-flex flex-sm-row align-items-sm-center flex-column align-items-start mb--30">
                                    
	                                    <div class="quantity-wrapper d-flex align-items-center mr--30 mr-xs--0 mb-xs--30">
	                                        <label class="quantity-label" for="qty">수량:</label>
	                                        
	                                        <input type="hidden" name="pNo" value="${hotdealDetail.pNo }"/>
	                                        <input type="hidden" name="cNo" value="${loginUser.cNo }"/>
	                                        
	                                        <div class="quantity">
	                                            <input type="number" class="quantity-input" name="qty" id="qty" value="1" min="1">
	                                        </div>
	                                        
	                                    </div>
                                    
                                    
                                    <c:choose>
                                      <c:when test="${ empty sessionScope.loginUser }">
                                      	<c:url var="userLogin" value="userLogin.do"/>	 
                                        <button type="button" class="btn btn-shape-square btn-size-sm" onclick="location.href='${userLogin}'">
                                     		장바구니 담기
                                    	</button>
                                      </c:when>
                                      <c:otherwise>	
                                      
                                    	<button type="submit" class="btn btn-shape-square btn-size-sm">
                                     		장바구니 담기
                                    	</button>
                                    	
                                      </c:otherwise>
                                   	</c:choose>
                                   	
                                </div>  
                                </form>
                                <div class="product-footer-meta">
                                    <p><span>카테고리:</span> 
                                    	<a href="#">${hotdealDetail.cgName }</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center mb--77 mb-md--57">
                        <div class="col-12">
                            <div class="tab-style-2">
                                <div class="nav nav-tabs mb--35 mb-sm--25" id="product-tab" role="tablist">
                                    <a class="nav-link active" id="nav-description-tab" data-toggle="tab" href="#nav-description" role="tab" aria-selected="true"> 

                                        <span>상품 상세</span>
                                    </a>
                                    <a class="nav-link" id="nav-info-tab" data-toggle="tab" href="#nav-info" role="tab" aria-selected="true">
                                        <span>추가 정보</span>
                                    </a>
                                    <a class="nav-link" id="nav-reviews-tab" data-toggle="tab" href="#nav-reviews" role="tab" aria-selected="true">
                                        <span>리뷰</span>

                                    </a>
                                    <a class="nav-link" id="nav-report-tab" data-toggle="tab" href="#nav-report" role="tab" aria-selected="true">
                                    	<span>신고하기</span>
                                    </a>
                                </div>
                                <!-- 상품상세 -->
                                <div class="tab-content" id="product-tabContent">
                                    <div class="tab-pane fade show active" id="nav-description" role="tabpanel" aria-labelledby="nav-description-tab">
                                        <div class="product-description">
											<h5>상품 상세</h5>
                                            <p>${hotdealDetail.pInfoText }</p>
											<p><img src="resources/productInfo/${hotdealDetail.pInfoImage}"></p>
                                            
                                        </div>
                                    </div>
                                    <!-- 추가 정보 -->
                                    <div class="tab-pane fade" id="nav-info" role="tabpanel" aria-labelledby="nav-info-tab">
                                        <div class="table-content table-responsive">
                                           
                                            <table class="type04" style="font-size:14px;">
												<h5>기본 표기정보</h5>
                                                <tbody>
                                                    <tr>
                                                        <th >용량/수량/크기</th>
                                                        <td >${hotdealDetail.pVolume}</td>
                                                        <th >생산자(수입자)</th>
                                                        <td >${hotdealDetail.bShopName}</td>
                                                    </tr>
                                                    <tr>
                                                        <th >원산지</th>
                                                        <td >${hotdealDetail.pOrigin}</td>
                                                        <th >제조연월일</th>
                                                        <td >${hotdealDetail.pProductDate}</td>
                                                    </tr>
                                                    <tr>
                                                        <th colspan="1">취급방법</th>
                                                        <td colspan="3">${hotdealDetail.pTreatment}</td>
                                                    </tr>
                                                </tbody>
                                            </table>

											<br><br><br><br> 

											<h5>판매자 정보</h5>
											<table class="type04" style="font-size:14px;">
                                                <tbody>
                                                    <tr>
                                                        <th >상호/대표자</th>
                                                        <td >${hotdealDetail.bShopName}/${hotdealDetail.bOwner}</td>
                                                        <th >사업자번호</th>
                                                        <td >${hotdealDetail.bShopNo}</td>
                                                    </tr>
                                                    <tr>
                                                        <th >e-mail</th>
                                                        <td >${hotdealDetail.cEmail}</td>
                                                        <th >연락처</th>
                                                        <td >${hotdealDetail.cPhone}</td>
                                                    </tr>
                                                    <tr>
                                                        <th colspan="1">사업장 위치</th>
                                                        <td colspan="3">${hotdealDetail.bShopAddress}</td>
                                                    </tr>
                                                    <tr>    
                                                        <th colspan="1"></th>
                                                        <td colspan="3"><div id="map" style="width:851px;height:400px;float:right;"></div></td>
                                                    </tr>
                                                </tbody>
                                            </table>   

                                            <div id="map" style="width:500px;height:400px;"></div>
             
                                            
                                            
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="nav-reviews" role="tabpanel" aria-labelledby="nav-reviews-tab">

                                        <div class="product-reviews" id="product-reviews">
                                            <h3 class="review__title">이 상품에 대해 ${fn:length(review)}개의 리뷰</h3>
                                            
	                                            <ul class="review__list">
	                                            <c:forEach var="review" items="${review }" end="2">
	                                                <li class="review__item">
	                                                    <div class="review__container" >
	                                                        <img src="resources/assets/img/others/comment-1.jpg" alt="Review Avatar" class="review__avatar">
	                                                        <div class="review__text">
	                                                            <div class="d-flex flex-sm-row flex-column justify-content-between">
	                                                                <div class="review__meta">
	                                                                    <strong class="review__author">${review.cName } </strong>
	                                                                    <span class="review__dash">-</span>
	                                                                    <span class="review__published-date">November 20, 2018</span>
	                                                                </div>
	                                                                <div class="product-rating">
	                                                                	<c:choose>
	                                                                		<c:when test="${review.rvStarRate == 5}">
		                                                                		<div class="star-rating star-five">
		                                                                        	<span>Rated <strong class="rating">${review.rvStarRate }</strong> out of 5</span>
		                                                                    	</div>
	                                                                    	</c:when>
	                                                                    	<c:when test="${review.rvStarRate == 4}">
		                                                                		<div class="star-rating star-four">
		                                                                        	<span>Rated <strong class="rating">${review.rvStarRate }</strong> out of 5</span>
		                                                                    	</div>
	                                                                    	</c:when>
	                                                                    	<c:when test="${review.rvStarRate == 3}">
		                                                                		<div class="star-rating star-three">
		                                                                        	<span>Rated <strong class="rating">${review.rvStarRate }</strong> out of 5</span>
		                                                                    	</div>
	                                                                    	</c:when>
	                                                                    	<c:when test="${review.rvStarRate == 2}">
		                                                                		<div class="star-rating star-two">
		                                                                        	<span>Rated <strong class="rating">${review.rvStarRate }</strong> out of 5</span>
		                                                                    	</div>
	                                                                    	</c:when>
	                                                                    	<c:otherwise>
	                                                                    		<div class="star-rating star-one">
		                                                                        	<span>Rated <strong class="rating">${review.rvStarRate }</strong> out of 5</span>
		                                                                    	</div>
	                                                                    	</c:otherwise>
	                                                                	</c:choose>
	                                                                </div>
	                                                            </div>
	                                                            <p class="review__description">${review.rvContent }</p>
	                                                        </div>
	                                                    </div>
	                                                </li>
	                                                </c:forEach>
	                                            </ul>
                                            
                                            <c:if test="${fn:length(review) > 3}">
	                                            <div style="height:5%; width:100%;">
	                                            	<button style="width:100%" id="showMore">더보기</button>
	                                            </div>
                                            </c:if>
                                            <script>
                                            	$("#showMore").click(function(){
                                            		$(this).css("display", "none");
                                            		var data = ${hotdealDetail.pNo};
                                            		var currentpage = ${currentPage};
                                            		$.ajax({
                                            			url: "hotDealDetail.do",
                                            			data: {pNo:data, page:currentpage, divide:"notnull"},
                                            			type: 'get',
                                            			dataType:"json",
                                            			success : function(result){
                          
                                            				$div = $("#product-reviews");
                                            				$div.html("");
                                            				$h3 = $("<h3 class='review__title'>").text("이 상품에 대해 " + result.review.length + "개의 리뷰");
                 	                                        $ul = $("<ul class='review__list'>");
                 	                                       
                 	                                        for(var i = 0; i < result.review.length; i++){
	                                            				$li = $("<li class='review__item' style='padding-bottom:20px'>");
	                                            				$div2 = $("<div class='review__container'>");
	                                            				$img = $("<img src='resources/assets/img/others/comment-1.jpg' alt='Review Avatar' class='review__avatar'>");
	                                            				$div3 = $("<div class='review__text'>");
	                                            				$div4 = $("<div class='d-flex flex-sm-row flex-column justify-content-between'>");
	                                            				$div5 = $("<div class='review__meta'>");
	                                            				$strong = $("<strong class='review__author'>").text(result.review[i].cName);
	                                            				$span1 = $("<span class='review__dash'>").text("-");
	                                            				$span2 = $("<span class='review__published-date'>").text("November 20, 2018");
	                                            				$div6 = $("<div class='product-rating'>");
	                                            				switch(result.review[i].rvStarRate){
	                                            				case 1: 
	                                            					$div7 = $("<div class='star-rating star-one'>");
	                                            					break;
	                                            				case 2:
	                                            					$div7 = $("<div class='star-rating star-two'>");
	                                            					break;
	                                            				case 3:
	                                            					$div7 = $("<div class='star-rating star-three'>");
	                                            					break;
	                                            				case 4:
	                                            					$div7 = $("<div class='star-rating star-four'>");
	                                            					break;
	                                            				case 5:
	                                            					$div7 = $("<div class='star-rating star-five'>");
	                                            					break;
	                                            					
	                                            				}
	                                            				$span3 = $("<span>");
	                                            				$strong2 = $("<strong class='rating'>").text(result.review[i].rvStarRate);
	                                            				$p = $("<p class='review__description'>").text(result.review[i].rvContent);
                                            				
	                                            				
	                                            				$span3.append($strong2);
	                                            				$div7.append($span3);
	                                            				$div6.append($div7);
	                                            				
	                                            				$div5.append($strong);
	                                            				$div5.append($span1);
	                                            				$div5.append($span2);
	                                            				$div4.append($div5);
	                                            				$div4.append($div6);
	                                            				$div3.append($div4);
	                                            				$div3.append($p);
	                                            				$div3.append($("<br>"));
	                                            				$div2.append($img);
	                                            				$div2.append($div3);
	                                            				$ul.append($li);
	                                            				$ul.append($div2);
                 	                                        }
                                            				$div.append($h3);
                                            				$div.append($ul);
                                            			},
                                            			error : function(e){
                                            				console.log(e);
                                            			}
                                            		});
                                            	});
                                            </script>

                                        </div>
                                    </div>
                                     <div class="tab-pane fade" id="nav-report" role="tabpanel" aria-labelledby="nav-report-tab">
                                        <div class="table-content table-responsive">
                                        
                                        	<p>신고 절차     
											지식재산권 침해 상품, 불법 혹은 부적격 상품, 부적절한 광고 내용 등 안전거래를 저해하는 상품이 확인될 경우, 신고하여 주시기 바랍니다. 신고 건은 아래의 절차에 따라 진행되며, 처리결과에 다소 시간이 걸릴 수 있습니다.
											
											<br><br>
											신고 접수 > 내용 심사 > 판매자 소명 요청 > 처리</p>
											
											<br>
                                            <form method="post" action="insertReport1.do" class="form pr--30">
                                                    <input type="hidden" name="rtNum" value="${hotdealDetail.pNo }"/>
                                                    <input type="hidden" name="cNo" value="${loginUser.cNo }"/>
                                                    
                                                    <div class="form__group mb--10">
                                                        <label class="form__label d-block" for="title">상품명<span class="required">*</span></label>
                                                        <input type="text" name="rtTitle" id="title" class="form__input" value="${hotdealDetail.pName}" readonly>
                                                    </div>
                                                    <div class="form__group mb--20">
                                                        <label class="form__label d-block" for="name">신고 유형<span class="required">*</span></label>
                                                        <select name="rtCategory">
                                                        	<option value="지적재산권 침해">지적재산권 침해</option>
                                                        	<option value="허위과장광고">허위과장광고</option>
                                                        	<option value="미인증 등 관련법위반">미인증 등 관련법위반</option>
                                                        	<option value="기타 불법물">기타 불법물</option>
                                                        	<option value="중복 상품">중복 상품</option>
                                                        	<option value="상품정보 오류">상품정보 오류</option>
														</select>
                                                    </div>
                                                    <!-- <div class="form__group mb--10">
                                                        <label class="form__label d-block" for="title">신고 제목<span class="required">*</span></label>
                                                        <input type="text" name="title" id="title" class="form__input">
                                                    </div> -->
                                                    <div class="form__group mb--20">
                                                        <label class="form__label d-block" for="content">신고 내용<span class="required">*</span></label>
                                                        <input type="text" name="rtContent" id="content" class="form__input" name="rtContent">
                                                    </div>
                                   
                                                    <div class="form__group">
                                                        <div class="form-row">
                                                            <div class="col-12">
                                                                <input type="submit" value="제출하기" class="btn btn-size-md">
                                                            </div>
                                                        </div>
                                                    </div>
                                           </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                     <label>이상품과 연관된 상품</label>
                    <div class="row mb--75 mb-md--55">
                        <div class="col-12">
                            <div class="element-carousel slick-vertical-center" data-slick-options='{
                                "spaceBetween": 30,
                                "slidesToShow": 4,
                                "slidesToScroll": 1,
                                "arrows": true,
                                "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "la la-angle-double-left" },
                                "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "la la-angle-double-right" }
                            }'
                            data-slick-responsive= '[
                                {"breakpoint":1199, "settings": {
                                    "slidesToShow": 3
                                }},
                                {"breakpoint":991, "settings": {
                                    "slidesToShow": 2
                                }},
                                {"breakpoint":575, "settings": {
                                    "slidesToShow": 1
                                }}
                            ]'>
                            
                           <c:forEach var="list" items="${list }" end="3">
                           		<c:url var="hotDealDetail" value="hotDealDetail.do">
									<c:param name="pNo" value="${list.pNo }" />
								</c:url>
                                <div class="item">
                                    <div class="ft-product">
                                        <div class="product-inner">
                                            <div class="product-image">
                                                <figure class="product-image--holder">
                                                    <img src="resources/pThumb/${list.pThumb}" alt="Product">
                                                </figure>
                                                <a href="${hotDealDetail}" class="product-overlay"></a>
                                                <div class="product-action">
                                                    <a data-toggle="modal" data-target="#productModal" class="action-btn">
                                                        <i class="la la-eye"></i>
                                                    </a>                                                    
                                                </div>
                                            </div>
                                            <div class="product-info">
                                                <div class="product-category">
                                                    <a href="${hotDealDetail}">${list.pTitle }</a>
                                                </div>
                                                <h3 class="product-title"><a href="${hotDealDetail}">${list.pName }</a></h3>
                                                
                                                    <div class="product-price-wrapper">
														<span class="money"> <sup><fmt:parseNumber
																	value="${(list.pOriginalPrice-list.pFinalPrice)/list.pOriginalPrice*100 }"
																	integerOnly="true" />%</sup> <s>${list.pOriginalPrice }</s>
														</span>
													</div>
													<div class="product-price-wrapper">
														<span class="money"><h4>${list.pFinalPrice }원</h4></span>
													</div>
													<c:url var="hotDealBuyForm" value="hotDealBuyForm.do" >
														<c:param name="pNo" value="${hot.pNo }" />
														<c:param name="cNo" value="${loginUser.cNo }" />
													</c:url>
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
                            </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper End -->


        <!-- Footer Start-->
        <footer class="footer bg-color" data-bg-color="#f4f8fa">
            <div class="footer-top">
                <div class="container-fluid">
                    <div class="row border-bottom pt--70 pb--70">
                        <div class="col-lg-3 col-sm-6 offset-md-1 offset-lg-0 mb-md--45">
                            <div class="footer-widget">
                                <div class="textwidget">
                                    <figure class="footer-logo mb--30">
                                        <img src="resources/assets/img/logo/logo.png" alt="Logo">
                                    </figure>
                                    <p>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms. </p>
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
                                    <span>Tags:</span>
                                    <a href="#">Minimal eCommerce</a>
                                    <a href="#">Marketing</a>
                                    <a href="#">User Exprience</a>
                                    <a href="#">Ali Express</a>
                                    <a href="#">Web</a>
                                    <a href="#">Digital Expo</a>
                                    <a href="#">Web Search</a>
                                    <a href="#">Affiliate</a>
                                    <a href="#">UCWeb</a>
                                    <a href="#">Support</a>
                                    <a href="#">Template</a>
                                    <a href="#">Best Queality</a>
                                    <a href="#">Mobile</a>
                                    <a href="#">24 Support</a>
                                    <a href="#">Ali Express</a>
                                    <a href="#">Web</a>
                                    <a href="#">Laptop</a>
                                    <a href="#">Web Search</a>
                                    <a href="#">Affiliate</a>
                                    <a href="#">Photoshop</a>
                                    <a href="#">Support</a>
                                    <a href="#">Template</a>
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
                <a href="" class="btn-close">
                    <i class="la la-remove"></i>
                </a>
                <nav class="offcanvas-navigation">
                    <ul class="offcanvas-menu">
                        <li class="menu-item-has-children active">
                            <a href="#">Home</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="index.html">Homepage 01</a>
                                </li>
                                <li>
                                    <a href="index-02.html">Homepage 02</a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="shop.html">Shop</a>
                            <ul class="sub-menu">
                                <li class="menu-item-has-children">
                                    <a href="#">
                                        <span class="mm-text">Shop Grid</span>
                                    </a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="shop-fullwidth.html">
                                                <span class="mm-text">Full Width</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="shop.html">
                                                <span class="mm-text">Left Sidebar</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="shop-right-sidebar.html">
                                                <span class="mm-text">Right Sidebar</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="shop-three-columns.html">
                                                <span class="mm-text">Three Columns</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="shop-four-columns.html">
                                                <span class="mm-text">Four Columns</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Shop List</a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="shop-list.html">Full Width</a>
                                        </li>
                                        <li>
                                            <a href="shop-list-sidebar.html">Left Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="shop-list-right-sidebar.html">Right Sidebar</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Product Details</a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="${hotDealDetail}">Tab Style 1</a>
                                        </li>
                                        <li>
                                            <a href="product-details-tab-style-2.html">Tab Style 2</a>
                                        </li>
                                        <li>
                                            <a href="product-details-tab-style-3.html">Tab Style 3</a>
                                        </li>
                                        <li>
                                            <a href="product-details-gallery-left.html">Gallery Left</a>
                                        </li>
                                        <li>
                                            <a href="product-details-gallery-right.html">Gallery Right</a>
                                        </li>
                                        <li>
                                            <a href="product-details-sticky-left.html">Sticky Left</a>
                                        </li>
                                        <li>
                                            <a href="product-details-sticky-right.html">Sticky Right</a>
                                        </li>
                                        <li>
                                            <a href="product-details-slider-box.html">Slider Box</a>
                                        </li>
                                        <li>
                                            <a href="product-details-slider-full-width.html">Slider Box Full Width</a>
                                        </li>
                                        <li>
                                            <a href="product-details-affiliate.html">Affiliate Proudct</a>
                                        </li>                                                    
                                        <li>
                                            <a href="product-details-variable.html">Variable Proudct</a>
                                        </li>
                                        <li>
                                            <a href="product-details-group.html">Group Product</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="blog.html">Blog</a>
                            <ul class="sub-menu">
                                <li class="menu-item-has-children">
                                    <a href="#">Blog</a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="blog-left-sidebar.html">Blog Left Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="blog.html">Blog Right Sidebar</a>
                                        </li>
                                        <li>
                                            <a href="blog-01-column.html">Blog 01 column</a>
                                        </li>
                                        <li>
                                            <a href="blog-02-columns.html">Blog 02 columns</a>
                                        </li>
                                        <li>
                                            <a href="blog-03-columns.html">Blog 03 columns</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Blog Details</a>
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="blog-details-audio.html">Audio Blog Details</a>
                                        </li>
                                        <li>
                                            <a href="blog-details-gallery.html">Gallery Blog Details</a>
                                        </li>
                                        <li>
                                            <a href="blog-details-image.html">image Blog Details</a>
                                        </li>
                                        <li>
                                            <a href="blog-details-video.html">Video Blog Details</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">Pages</a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="my-account.html">My Account</a>
                                </li>
                                <li>
                                	<c:url var="checkout" value="hotDealCheckOutForm.do"/>
                                    <a href="${checkout }">Checkout</a>
                                </li>
                                <li>
                                    <a href="cart.html">Cart</a>
                                </li>
                                <li>
                                    <a href="compare.html">Compare</a>
                                </li>
                                <li>
                                    <a href="order-tracking.html">Track Order</a>
                                </li>
                                <li>
                                    <a href="wishlist.html">Wishlist</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="contact-us.html">Contact Us</a>
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
                            <a href="cart.html" class="btn btn-fullwidth btn-bg-primary mb--20">View Cart</a>
                            <a href="checkout.html" class="btn btn-fullwidth btn-bg-primary">Checkout</a>
                        </div>
                    </div>
                </div>
            </div>
        </aside>
        <!-- Mini Cart End -->

        <!-- Searchform Popup Start -->
        <div class="searchform__popup" id="searchForm">
            <a href="#" class="btn-close"><i class="la la-remove"></i></a>
            <div class="searchform__body">
                <p>Start typing and press Enter to search</p>
                <form class="searchform">
                    <input type="text" name="popup-search" id="popup-search" class="searchform__input" placeholder="Search Entire Store...">
                    <button type="submit" class="searchform__submit"><i class="la la-search"></i></button>
                </form>
            </div>
        </div>
        <!-- Searchform Popup End -->

        <!-- Qicuk View Modal Start -->
        <div class="modal fade product-modal" id="productModal" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true"><i class="la la-remove"></i></span>
                </button>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="element-carousel slick-vertical-center"
                        data-slick-options='{
                            "slidesToShow": 1,
                            "slidesToScroll": 1,
                            "arrows": true,
                            "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "la la-angle-double-left" },
                            "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "la la-angle-double-right" }
                        }'
                        >
                            <div class="product-image">
                                <div class="product-image--holder">
                                    <a href="${hotDealDetail}">
                                        <img src="resources/assets/img/products/prod-01.jpg" alt="Product Image" class="primary-image">
                                    </a>
                                </div>
                                <span class="product-badge sale">sale</span>
                            </div>
                            <div class="product-image">
                                <div class="product-image--holder">
                                    <a href="${hotDealDetail}">
                                        <img src="resources/assets/img/products/prod-02.jpg" alt="Product Image" class="primary-image">
                                    </a>
                                </div>
                                <span class="product-badge sale">sale</span>
                            </div>
                        </div>
                    </div>
                    
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Qicuk View Modal End -->


        <!-- Global Overlay Start -->
        <div class="global-overlay"></div>
        <!-- Global Overlay End -->

        <!-- Global Overlay Start -->
        <a class="scroll-to-top" href=""><i class="la la-angle-double-up"></i></a>
        <!-- Global Overlay End -->
    
    <!-- Main Wrapper End -->
 

    <!-- ************************* JS Files ************************* -->

    <!-- jQuery JS -->
    <script src="resources/assets/js/vendor.js"></script>

    <!-- Main JS -->
    <script src="resources/assets/js/main.js"></script>
</body>

</html>