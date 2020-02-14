<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 유형 선택</title>
<style>
	h5>a{
		cursor:pointer;
		float:left;
	}
	#wrapper {
		margin-top: 6%;
	}
	
	.col-sm-6 img {
		border: 1px solid #e5e5e5;
		box-size: border-box;
	}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<br>
	
	<div class="main-container">
	
		<main class="site-main">

			<!-- Page Content -->
			<div class="container-fluid no-left-padding no-right-padding page-content blog-single post-nosidebar">
				<!-- Container -->
				<div class="container" id="wrapper">
					<h5 align="center">가입하실 회원 유형을 선택해주세요.</h5>
					<br><br><br>
					<div class="row">
						<!-- Content Area -->
						<div class="col-xl-12 col-lg-12 col-md-12 col-12 content-area">
							<article class="type-post">
								<div class="entry-content">
									<div class="post-image row">
										<figure class="col-sm-6">
											<!-- 일반 회원 가입 폼 페이지로 이동 -->
											<c:url var="userSignUp" value="userSignUp.do"/>
											<a href="${ userSignUp }"><img src="resources/user/images/type_customer.png" alt="일반 회원 가입" /></a>
										</figure>
										<figure class="col-sm-6">
											<!-- 사업자 회원 가입 폼 페이지로 이동 -->
											<c:url var="sellerSignUp" value="sellerSignUp.do"/>
											<a href="${ sellerSignUp }"><img src="resources/user/images/type_seller.png" alt="사업자 회원 가입" /></a>
										</figure>
									</div>
								</div>
							</article>
							<!-- About Author -->
							<!-- About Author /- -->
							<!-- Related Post -->
							<!-- Related Post /- -->
							<!-- Comment Area -->
							<!-- Comment Area /- -->
						</div><!-- Content Area /- -->
					</div>
				</div><!-- Container /- -->
			</div><!-- Page Content /- -->
			
		</main>
		
	</div>
	</div>
</body>
</html>