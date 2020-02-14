<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>QNA</title>
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
	
    
   <!-- Main Wrapper Start -->
    <div class="wrapper">
                 

        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="assets/img/bg/1920X200.png">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">QNA</h1>
                        <ul class="breadcrumb">
                            <li><a href="<%=request.getContextPath() %>">Home</a></li>
                            <li class="current"><span>고객센터</span></li>
                            <li class="current"><span>QNA</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb area End -->

        <!-- Main Content Wrapper Start -->
        <main class="main-content-wrapper">
            <div class="inner-page-content pt--75 pt-md--55">
                <!-- Contact Area Start -->
                <section class="contact-area mb--75 mb-md--55">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-5 mb-sm--30">
                                <div class="heading mb--32">
                                    <h2>QNA</h2>
                                    <hr class="delimeter">
                                </div>
                                <div class="contact-info mb--20">
                                    <p><i class="fa fa-map-marker"></i>서울특별시 강남구 테헤란로 14길 6 남도빌딩</p>
                                    <p><i class="fa fa-phone"></i> T: 1544-9970</p>
                                    <p><i class="fa fa-fax"></i>  F: 02-562-2378</p>
                                    <p><i class="fa fa-clock-o"></i> 월 – 금 : 9:00 – 18:00</p>
                                </div>
                            </div>
                            <div class="col-md-7 offset-lg-1">
                                <div class="heading mb--40">
                                    <h2>Contact Us</h2>
                                    <hr class="delimeter">
                                </div>
                                <form action="insertQNA.do" class="form" id="contact-form" method="post">
                                   <input type="hidden" id="cNo" name="cNo" value="${loginUser.cNo}"/>
                                    		작성자 : <input type="text" name="cName" id="cName" value="${loginUser.cName}"  class="form__input mb--30" readonly>
                                    		연락 받을 이메일 : <input type="email" name="cEmail" id="cEmail" value="${loginUser.cEmail}" class="form__input mb--30" readonly>
                                    		 <input type="text" name="qTitle" id="qTitle" class="form__input mb--30" placeholder="제목*" required>
                                    		<textarea class="form__input form__input--textarea mb--30" placeholder="내용을 입력하세요*" id="qContent" name="qContent" required></textarea>
                                    		 <button type="submit" class="btn btn-shape-round form__submit">제출하기</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Contact Area End -->

				<script>
					$(function(){
						var cNo = $("#cNo").val();
						var cName = $("#cName").val();
						var cEmail = $("#cEmail").val();
						console.log("cNo=" + cNo);
						console.log("cName=" + cName);
						console.log("cEmail=" + cEmail);
					});
				</script>


                <!-- Brand Logo Area Start -->
                <div class="brand-logo-area bg-color ptb--75" data-bg-color="#e9fefd">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="element-carousel"
                                data-slick-options='{
                                    "slidesToShow": 5,
                                    "autoplay": true
                                }'
                                data-slick-responsive='[
                                    {"breakpoint": 1200, "settings": {"slidesToShow": 4}},
                                    {"breakpoint": 992, "settings": {"slidesToShow": 3}},
                                    {"breakpoint": 768, "settings": {"slidesToShow": 2}},
                                    {"breakpoint": 480, "settings": {"slidesToShow": 1}}
                                ]'>
                                    <div class="item">
                                        <figure>
                                            <img src="resources/assets/img/brand/brand-01.png" alt="Brand" class="mx-auto">
                                        </figure>
                                    </div>
                                    <div class="item">
                                        <figure>
                                            <img src="resources/assets/img/brand/brand-02.png" alt="Brand" class="mx-auto">
                                        </figure>
                                    </div>
                                    <div class="item">
                                        <figure>
                                            <img src="resources/assets/img/brand/brand-03.png" alt="Brand" class="mx-auto">
                                        </figure>
                                    </div>
                                    <div class="item">
                                        <figure>
                                            <img src="resources/assets/img/brand/brand-04.png" alt="Brand" class="mx-auto">
                                        </figure>
                                    </div>
                                    <div class="item">
                                        <figure>
                                            <img src="resources/assets/img/brand/brand-05.png" alt="Brand" class="mx-auto">
                                        </figure>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Brand Logo Area End -->
            </div>
        </main>
        <!-- Main Content Wrapper End -->

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
    <script src="resources/assets/js/vendor.js"></script>

    <!-- Main JS -->
    <script src="resources/assets/js/main.js"></script>
</body>

</html>
</html>