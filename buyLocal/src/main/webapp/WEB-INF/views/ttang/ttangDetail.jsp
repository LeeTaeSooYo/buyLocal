<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>땡처리게시판 - 상세</title>
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
	<c:import url="../common/menubar.jsp"/>	

        <!-- Breadcrumb area Start -->
        <section  class="page-title-area bg-image ptb--80" data-bg-image="assets/img/bg/1920X200.png">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">땡처리 상품상세 페이지</h1>
                        <ul class="breadcrumb">
                            <li><a href="<%=request.getContextPath() %>">Home</a></li>
                            <li class="current"><span>땡처리게시판</span></li>
                            <li class="current"><span>상품상세페이지</span></li>
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
                                                    <img src="resources/pThumb/${ttangDetail.pThumb}" alt="Product">
                                                    <span class="product-badge sale">Sale</span>
                                                    <div class="product-gallery__actions">
                                                        <button class="action-btn btn-zoom-popup"><i class="la la-eye"></i></button>
                                                    </div>
                                                </figure>
                                                <figure class="product-gallery__image zoom">
                                                    <img src="resources/pThumb/${ttangDetail.pThumb}" alt="Product">
                                                    <span class="product-badge sale">Sale</span>
                                                    <div class="product-gallery__actions">
                                                        <button class="action-btn btn-zoom-popup"><i class="la la-eye"></i></button>
                                                    </div>
                                                </figure>
                                                <figure class="product-gallery__image zoom">
                                                    <img src="resources/pThumb/${ttangDetail.pThumb}" alt="Product">
                                                    <span class="product-badge sale">Sale</span>
                                                    <div class="product-gallery__actions">
                                                        <button class="action-btn btn-zoom-popup"><i class="la la-eye"></i></button>
                                                    </div>
                                                </figure>
                                                <figure class="product-gallery__image zoom">
                                                    <img src="resources/pThumb/${ttangDetail.pThumb}" alt="Product">
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
                                                <img src="resources/pThumb/${ttangDetail.pThumb}" alt="Products">
                                            </figure>
                                            <figure class="product-gallery__nav-image--single">
                                                <img src="resources/pThumb/${ttangDetail.pThumb}" alt="Products">
                                            </figure>
                                            <figure class="product-gallery__nav-image--single">
                                                <img src="resources/pThumb/${ttangDetail.pThumb}" alt="Products">
                                            </figure>
                                            <figure class="product-gallery__nav-image--single">
                                                <img src="resources/pThumb/${ttangDetail.pThumb}" alt="Products">
                                            </figure>
                                        </div>
                                    </div> 
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 offset-xl-1 col-lg-5 product-main-details mt-md--50">
                            <div class="product-summary pl-lg--30 pl-md--0">
                             
                                
                                <h3 class="product-title mb--20">${ttangDetail.pTitle}</h3>
                                <p class="product-short-description mb--20">${ttangDetail.pInfoText}</p>
                                <div class="product-price-wrapper mb--25">
                                    <span class="money" style="text-decoration:line-through;">${ttangDetail.pOriginalPrice}</span>
                                    <span class="money" style="color:red;">${ttangDetail.pFinalPrice}</span>
                                </div>
                                
                                
                                <form action="ttangAddCart.do" method="post">
                                <div class="product-action d-flex flex-sm-row align-items-sm-center flex-column align-items-start mb--30">
                                    <div class="quantity-wrapper d-flex align-items-center mr--30 mr-xs--0 mb-xs--30">
                                        <label class="quantity-label" for="qty">수량:</label>
                                        
                                        <input type="hidden" name="pNo" value="${ttangDetail.pNo }"/>
                                        <input type="hidden" name="cNo" value="${loginUser.cNo }"/>
                                        
                                        <div class="quantity">
                                            <input type="number" class="quantity-input" name="qty" id="qty" value="1" min="1">
                                        </div>
                                    </div>
                                    
                                    <c:choose>
                                    <c:when test="${empty sessionScope.loginUser }">
                                    <c:url var="userLogin" value="userLogin.do"/>
                  
                                    <button type="button" class="btn btn-shape-square btn-size-sm" onclick="location.href='${userLogin}'">
                                        	장바구니
                                    </button>
                                    </c:when>
                                     <c:otherwise>       
                                     
                                    <!-- <button type="submit" class="btn btn-shape-square btn-size-sm">
                                        	찜
                                    </button> -->
			
                                    <button type="submit" class="btn btn-shape-square btn-size-sm" >
                                        	장바구니
                                    </button>        
                                            
                                     </c:otherwise>
                                    </c:choose>
                                                                       
                                </div>  
                                </form>
                                <div class="product-footer-meta">
                                    <p><span>Category:</span> 
                                        <a href="#">${ttangDetail.cgName}</a>
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
                                    <a class="nav-link" id="nav-report-tab" data-toggle="tab" href="#nav-report" role="tab" aria-selected="true">
                                    	<span>신고하기</span>
                                    </a>
                                </div>
                                <!-- 상품 상세 -->
                                <div class="tab-content" id="product-tabContent">
                                    <div class="tab-pane fade show active" id="nav-description" role="tabpanel" aria-labelledby="nav-description-tab">
                                        <div class="product-description">
                                        	<h5>상품 상세</h5>
                                        	<p>* 땡처리 게시판은 별도의 상품문의 페이지가 제공되지 않습니다. <br>
                                        	기타 문의사항은 사업자 연락처를 통해 주시기 바랍니다.</p>
                                            <!-- 그림 삽입 -->
                                            <p>${ttangDetail.pInfoText}</p>
                                           <p><img src="resources/productInfo/${ttangDetail.pInfoImage}"></p>
                                           
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
                                                        <td >${ttangDetail.pVolume}</td>
                                                        <th >생산자(수입자)</th>
                                                        <td >${ttangDetail.bShopName}</td>
                                                    </tr>
                                                    <tr>
                                                        <th >원산지</th>
                                                        <td >${ttangDetail.pOrigin}</td>
                                                        <th >제조연월일</th>
                                                        <td >${ttangDetail.pProductDate}</td>
                                                    </tr>
                                                    <tr>
                                                        <th colspan="1">취급방법</th>
                                                        <td colspan="3">${ttangDetail.pTreatment}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        	
                                            
                                            <br><br><br><br>                      
                                        
                                        	
                                        	<h5>판매자 정보</h5>
											<table class="type04" style="font-size:14px;">
                                                <tbody>
                                                    <tr>
                                                        <th >상호/대표자</th>
                                                        <td >${ttangDetail.bShopName}/${ttangDetail.bOwner}</td>
                                                        <th >사업자번호</th>
                                                        <td >${ttangDetail.bShopNo}</td>
                                                    </tr>
                                                    <tr>
                                                        <th >e-mail</th>
                                                        <td >${ttangDetail.cEmail}</td>
                                                        <th >연락처</th>
                                                        <td >${ttangDetail.cPhone}</td>
                                                    </tr>
                                                    <tr>
                                                        <th colspan="1">사업장 위치</th>
                                                        <td colspan="3">${ttangDetail.bShopAddress}</td>
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
                                     <div class="tab-pane fade" id="nav-report" role="tabpanel" aria-labelledby="nav-report-tab">
                                        <div class="table-content table-responsive">
                                        
                                        	<p>신고 절차     
											지식재산권 침해 상품, 불법 혹은 부적격 상품, 부적절한 광고 내용 등 안전거래를 저해하는 상품이 확인될 경우, 신고하여 주시기 바랍니다. 신고 건은 아래의 절차에 따라 진행되며, 처리결과에 다소 시간이 걸릴 수 있습니다.
											
											<br><br>
											신고 접수 > 내용 심사 > 판매자 소명 요청 > 처리</p>
											
											<br>
                                            <form method="post" action="insertReport1.do" class="form pr--30">
                                                    <input type="hidden" name="rtNum" value="${ttangDetail.pNo }"/>
                                                    <input type="hidden" name="cNo" value="${loginUser.cNo }"/>
                                                    
                                                    <div class="form__group mb--10">
                                                        <label class="form__label d-block" for="title">상품명<span class="required">*</span></label>
                                                        <input type="text" name="rtTitle" id="title" class="form__input" value="${ttangDetail.pName}" readonly>
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
                            	<c:url var="ttangDetail" value="ttangDetail.do">
                            		<c:param name="pNo" value="${list.pNo }"/>
                            	</c:url>
                                <div class="item">
                                    <div class="ft-product">
                                        <div class="product-inner">
                                            <div class="product-image">
                                                <figure class="product-image--holder">
                                                    <img src="resources/pThumb/${list.pThumb}" alt="Product">
                                                </figure>
                                                <a href="${ttangDetail}" class="product-overlay"></a>
                                                <div class="product-action">
                                                    <a data-toggle="modal" data-target="#productModal" class="action-btn">
                                                        <i class="la la-eye"></i>
                                                    </a>                                                    
                                                </div>
                                            </div>
                                            <div class="product-info">
                                                <div class="product-category">
                                                    <a href="${ttangDetail}">${list.pTitle}</a>
                                                </div>
                                                <h3 class="product-title"><a href="${ttangDetail }">${list.pName}</a></h3>
                                                
                                                <div class="product-price-wrapper">
														<span class="money"> <sup><fmt:parseNumber
																	value="${(list.pOriginalPrice-list.pFinalPrice)/list.pOriginalPrice*100 }"
																	integerOnly="true" />%</sup> <s>${list.pOriginalPrice }</s> 
														</span>
													</div>
                                                <div class="product-price-wrapper">
                                                	<span class="money"><h4>${list.pFinalPrice }원</h4></span>
                                                </div>
                                                <c:url var="ttangBuyForm" value="ttangBuyForm.do">
                                                	<c:param name="pNo" value="${ttang.pNo }"/>
                                                	<c:param name="cNo" value="${loginUser.cNo }"/>
                                                </c:url>
                                                <c:choose>
                                                <c:when test="${empty sessionScope.loginUser }">
                                                <c:url var="userLogin" value="userLogin.do"/>
                                                	<a href="${userLogin }" class="add-to-cart pr--15">
                                                		<i class="la la-plus"></i> <span>장바구니</span>
                                                	</a>
                                                </c:when>
                                                <c:otherwise>
                                                <c:url var="ttangAddCart" value="ttangAddCart.do">
                                                	<c:param name="pNo" value="${ttang.pNo }"/>
                                                	<c:param name="cNo" value="${loginUser.cNo }"/>
                                                </c:url>	
                                                <a href="${ttangAddCart }" class="add-to-cart pr--5">
                                                	<i class="la la-plus"></i><span>장바구니</span>
                                                </a>
                                               </c:otherwise>
                                               </c:choose> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                                </div></div></div></div></div></div>
                              
        <!-- Main Content Wrapper End -->

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c56f421aa8df947305c86a5ace96deab"></script>
	<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.589911, 127.016721), // 지도의 중심좌표
		         // draggable: false, // 지도를 생성할때 지도 이동 및 확대/축소를 막으려면 draggable: false 옵션을 추가하세요
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 버튼 클릭에 따라 지도 이동 기능을 막거나 풀고 싶은 경우에는 map.setDraggable 함수를 사용합니다
		function setDraggable(draggable) {
		    // 마우스 드래그로 지도 이동 가능여부를 설정합니다
		    map.setDraggable(draggable);    
		}
	</script>


     <c:import url="../common/footer.jsp"/>



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