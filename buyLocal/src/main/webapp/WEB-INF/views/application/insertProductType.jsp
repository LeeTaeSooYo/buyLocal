<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
<link rel="shortcut icon" href="resources/assets/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="resources/assets/img/icon.png">
</head>
<body>
	<c:import url="../common/menubar.jsp" />
		
	  <div class="wrapper">
                 
        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="resources/assets/img/bg/1920X200.png">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                       <h1 class="page-title">신청하기</h1>
						<ul class="breadcrumb">
							<li><a href="<%=request.getContextPath() %>">Home</a></li>
							<li class="current"><span>신청하기</span></li>
							<li class="current"><span>상품 등록하기</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb area End -->

        <!-- Main Content Wrapper Start -->
        <main class="main-content-wrapper">
            <div class="inner-page-content pt--75 pt-md--55">
                <div class="container" id="wrapper">
					<h5 align="center">상품을 등록할 게시판 유형을 선택해주세요.</h5>
					<div class="row">
						<!-- Content Area -->
						<div class="col-xl-12 col-lg-12 col-md-12 col-12 content-area">
							<article class="type-post">
								<div class="entry-content">
									<div class="post-image row">
										<figure class="col-sm-6">
											<!-- 핫딜 게시판 (그림 파일 등록하기)-->
											<c:url var="insertHotDeal" value="insertHotDeal.do"/>
											<a href="${ insertHotDeal }"><img src="resources/insertProduct/HOT.png" alt="핫딜 게시판" /></a>
										</figure>
										<figure class="col-sm-6">
											<!-- 땡처리 게시판 (그림 파일 등록하기) -->
											<c:url var="insertTtang" value="insertTtang.do"/>
											<a href="${ insertTtang }"><img src="resources/insertProduct/TTANG.png" alt="땡처리 게시판" /></a>
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
				</div>
            </div>
        </main>
        <!-- Main Content Wrapper End -->
	</div>

	<script type="text/javascript">
	
	$("input[name='pBoard']:radio").change(function(){
		var pBoard = this.value;
		
		if(pBoard == "땡처리"){
			$("#cgName1").show();
			$('#cgName2').hide();
			$('#cgName2').prop("disabled", true); // 비워주기
			$('#cgName2').val("");
			$('#pEndDateArea').hide(); 
		} else if (pBoard == "핫딜") {
			$("#cgName1").hide();
			$("#cgName1").prop("disabled", true); 
			$("#cgName1").val(""); // 비워주기
			$("#cgName2").show(); 
			$('#pEndDateArea').show();
		}
		
	});
	
	
	// cNo 보내기  & cAddress를 lCode로 바꿔 보내기
	$(function(){

		var cNo = $("#cNo").val();
		console.log('cNo=' + cNo);
		
		var cAddress = $('#cAddress').val(); 
		console.log('cAddress=' + cAddress);
		
		// 주소값이 '서울특별시'에  한정되었을 것으로 가정
		if(cAddress.indexOf('종로구') != -1){
			$("#lCode").val('L1');
		} else if (cAddress.indexOf('중구') != -1) {
			$("#lCode").val('L2');
		} else if (cAddress.indexOf('용산구') != -1) {
			$("#lCode").val('L3');
		} else if (cAddress.indexOf('성동구') != -1) {
			$("#lCode").val('L4');
		} else if (cAddress.indexOf('광진구') != -1) {
			$("#lCode").val('L5');
		} else if (cAddress.indexOf('동대문구') != -1) {
			$("#lCode").val('L6');
		} else if (cAddress.indexOf('중랑구') != -1) {
			$("#lCode").val('L7');
		} else if (cAddress.indexOf('성북구') != -1) {
			$("#lCode").val('L8');
		} else if (cAddress.indexOf('강북구') != -1) {
			$("#lCode").val('L9');
		} else if (cAddress.indexOf('노봉구') != -1) {
			$("#lCode").val('L10');
		} else if (cAddress.indexOf('노원구') != -1) {
			$("#lCode").val('L11');
		} else if (cAddress.indexOf('은평구') != -1) {
			$("#lCode").val('L12');
		} else if (cAddress.indexOf('서대문구') != -1) {
			$("#lCode").val('L13');
		} else if (cAddress.indexOf('마포구') != -1) {
			$("#lCode").val('L14');
		} else if (cAddress.indexOf('양천구') != -1) {
			$("#lCode").val('L15');
		} else if (cAddress.indexOf('강서구') != -1) {
			$("#lCode").val('L16');
		} else if (cAddress.indexOf('구로구') != -1) {
			$("#lCode").val('L17');
		} else if (cAddress.indexOf('금천구') != -1) {
			$("#lCode").val('L18');
		} else if (cAddress.indexOf('영등포구') != -1) {
			$("#lCode").val('L19');
		} else if (cAddress.indexOf('동작구') != -1) {
			$("#lCode").val('L20');
		} else if (cAddress.indexOf('관악구') != -1) {
			$("#lCode").val('L21');
		} else if (cAddress.indexOf('서초구') != -1) {
			$("#lCode").val('L22');
		} else if (cAddress.indexOf('강남구') != -1) {
			$("#lCode").val('L23');
		} else if (cAddress.indexOf('송파구') != -1) {
			$("#lCode").val('L24');
		} else if (cAddress.indexOf('강동구') != -1){
			$("#lCode").val('L25');
		} else {
			/* alert("당신은 서울특별시민이 아니네요!"); */
		}
		
		var lCode = $('#lCode').val();
		console.log("lCode=" + lCode);
		
		
	});	
	
		$(function(){
			
			// 오늘 날짜
			var d = new Date();
			var currentDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
			console.log("오늘 날짜 : " + currentDate);
			
			// 게시판 선택에 따라 카테고리, 판매종료일 변화(땡처리 선택시, 숨김)
			$("#cgName1").hide();
			
			// 땡처리 선택
			$(document).on('click', '#pBoard_type1', function(){
					$("#cgName1").show();
					$('#cgName2').hide();
					$('#cgName2').val(""); // 비워주기
					$('#pEndDateArea').hide(); 
			});
			
			$(document).on('click', '#pBoard_type2', function(){
					$("#cgName1").hide();
					$("#cgName1").val(""); // 비워주기
					$('#cgName2').show(); 
					$('#pEndDateArea').show();
			});
			
			
			// 땡처리 선택 시, 판매종료일은 판매시작일과 동일하게 설정
			$("#pStartDate").change(function(){
				var pStartDate = $("#pStartDate").val();
				$('#pEndDate').val(pStartDate);
				var pEndDate = $("#pEndDate").val();
				console.log("판매종료일 : " + pEndDate);
			});
		});
		
		
		
		
	</script>
	
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