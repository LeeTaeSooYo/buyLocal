<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html class="no-js" lang="zxx">
 
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>장바구니</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicons -->
    <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="assets/img/icon.png">

    <!-- ************************* CSS Files ************************* -->

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="assets/css/vendor.css">

    <!-- style css -->
    <link rel="stylesheet" href="assets/css/main.css">
    
</head>

<body>
	<c:import url="../common/menubar.jsp"/>
        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="assets/img/bg/page_title_bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">장바구니</h1>
                        <ul class="breadcrumb">
                            <li><a href="index.html">Home</a></li>
                            <li class="current"><span>Cart</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb area End -->

        <!-- Main Content Wrapper Start -->
        <div class="main-content-wrapper">
            <div class="page-content-inner ptb--80 pt-md--40 pb-md--60">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 mb-md--50">
                            <form class="cart-form" action="#">
                                <div class="row no-gutters">
                                    <div class="col-12">
                                        <div class="table-content table-responsive">
                                            <table class="table text-center">
                                                <thead>
                                                    <tr>
                                                        <th>&nbsp;</th>
                                                        <th>&nbsp;</th>
                                                        <th class="text-left">상품명</th>
                                                        <th>가격</th>
                                                        <th>수량</th>
                                                        <th>결제 가격</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                	<c:forEach var="buylist" items="${list }">
                                                	<tr>
	                                                	<c:url var="deleteCart" value="deleteCart.do">
	                                        				<c:param name="cartNo" value="${buylist.cartNo }"/>
	                                        				<c:param name="cNo" value="${buylist.cNo }"/>
	                                        			</c:url>
                                                        <td class="product-remove text-left"><a href="${ deleteCart}"><i class="la la-remove"></i></a></td>
                                                        <td class="product-thumbnail text-left">
                                                            <img src="resources/pThumb/${buylist.pThumb}" alt="Product Thumnail">
                                                        </td>
                                                        <td class="product-name text-left wide-column">
                                                            <h3>
                                                                <a href="product-details.html">${buylist.pName }</a>
                                                            </h3>
                                                        </td>
                                                        <td class="product-price">
                                                            <span class="product-price-wrapper">
                                                                <span class="money">${buylist.pFinalPrice }</span>
                                                            </span>
                                                        </td>
                                                        <td class="product-quantity">
                                                           <input type="number" class="quantity-input" value="${buylist.quantity }" id="">
                                                        </td>
                                                        <td class="product-total-price">
                                                            <span class="product-price-wrapper">
                                                                <span class="money">${buylist.pFinalPrice * buylist.quantity}</span>
                                                            </span>
                                                        </td>
                                                    </tr>
                                                	</c:forEach>
                                                	
                                                	<c:if test="${fn:length(list) <= 0}">
                                                		<tr><td colspan="6">상품이 존재하지 않습니다.</td></tr>
                                                	</c:if>
                                                </tbody>
                                            </table>
                                        </div>  
                                    </div>
                                </div>
                                <div class="row no-gutters border-top pt--20 mt--20">
                                    <div class="col-sm-6">
                                    </div>
                                    <div class="col-sm-6 text-sm-right">
                                    	<h3 style="float:left">상품 총 가격</h3>
                                        <h3>${total }</h3>
                                    </div>
                                </div>
                                <c:if test="${fn:length(list) <= 0}">
                                	<script>
                                 		$(".border-top").remove();
                                  	</script>
                                </c:if>
                            </form>
                        </div>
                        <div class="col-lg-4">
                            <div class="cart-collaterals">
                                <div class="cart-totals">
                                    <h5 class="font-size-14 font-bold mb--15">총 가격</h5>
                                    <div class="cart-calculator">
                                        <div class="cart-calculator__item">
                                            <div class="cart-calculator__item--head">
                                                <span>상품 총 가격</span>
                                            </div>
                                            <div class="cart-calculator__item--value">
                                                <span>${total }</span>
                                            </div>
                                        </div>
                                        <div class="cart-calculator__item">
                                            <div class="cart-calculator__item--head">
                                                <span>부가 가치세</span>
                                            </div>
                                            <div class="cart-calculator__item--value">
                                                <span>${total * 0.1 }</span>
                                            </div>
                                            <div class="cart-calculator__item--head">
                                                <span>Total</span>
                                            </div>
                                            <div class="cart-calculator__item--value">
                                                <span class="product-price-wrapper">
                                                    <span class="money">${total + total*0.1 }</span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <c:url var="hotDealCheckOut" value="hotDealCheckOutForm.do">
                                	<c:param name="list" value="${list }"/>
                                	<c:param name="total" value="${total }"/>
                                </c:url>
                                <a href="${hotDealCheckOut }" class="btn btn-size-md btn-shape-square btn-fullwidth">
                                   	결제하기
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper Start -->

		<c:import url="../common/footer.jsp"/>

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
    <script src="assets/js/vendor.js"></script>

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>
</body>

</html>