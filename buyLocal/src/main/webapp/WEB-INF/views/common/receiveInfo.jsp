<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Beck - Furniture eCommerce Bootstrap 4 Template</title>
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
	<c:import url="../common/menubar.jsp" />
	
	 <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="assets/img/bg/page_title_bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">Login &amp; Register</h1>
                        <ul class="breadcrumb">
                            <li><a href="index.html">Home</a></li>
                            <li class="current"><span>Login &amp; Register</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb area End -->

        <!-- Main Content Wrapper Start -->
        <div class="main-content-wrapper">
            <div class="page-content-inner pt--75 pb--80">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 mb-sm--50">
                            <div class="login-box">
                                <h3 class="heading__tertiary mb--30">${loginUser.cName }님의 구매내용</h3>
                                <form class="form form--login">
                                <c:forEach var="lists" items="${list}">
                                    <div class="form__group mb--20" style="border: 1px solid gray">
                                        <label class="form__label" for="username_email">${lists.pName }</label><br>
                                        <label class="form__label" for="username_email">${lists.pInfoText }</label><br>
                                        <label class="form__label" for="username_email">${lists.quantity }개</label><br>
                                        <label class="form__label" for="username-email">주문번호 : ${uId }</label>
                                    </div>
                                </c:forEach>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="register-box">
                                <h4 class="heading__tertiary mb--30">정보 입력</h4>
                                <form class="form form--login" method="post" action="completeReceive.do">
                                	<input type="hidden" value="${loginUser.cNo }" name="cNo">
                                	<input type="hidden" value="${uId }" name="uId">
                                    <div class="form__group mb--20">
                                        <label class="form__label" for="email">수령인 <span class="required">*</span></label>
                                        <input type="text" class="form__input" id="email" name="receiver">
                                    </div>
                                    <div class="form__group mb--20">
                                       <label class="form__label" for="register_password">결제방법</label>
                                       <c:if test="${pageInfo eq '핫딜' }">
                                       <input type="text" class="form__input" id="register_password" name="method" value="${method }" readonly>
                                       </c:if>
                                    </div>
                                    <div class="form__group">
                                        <input type="submit" value="입력완료" class="btn btn-size-sm">
                                    </div>
                                </form>
                            </div>
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
</body>
</html>