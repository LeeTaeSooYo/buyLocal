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
							<li class="current"><span>핫딜 게시판</span></li>
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
                                    <h2>* 유의사항</h2>
                                    <hr class="delimeter">
                                </div>
                                <div class="contact-info mb--20">
                                    <p><i class="fa fa-map-marker"></i>- 썸네일 사진 권장 크기 : 700 * 778</p>
                                    <p><i class="fa fa-phone"></i>- 상품정보(이미지) 권장 크기 : 800 * 1720</p>
                                    <p><i class="fa fa-fax"></i>- 판매기간은 판매 시작일을 기준으로 30일 후 까지 입니다.</p>
                                    <p><i class="fa fa-clock-o"></i>- 자세한 설명은 FAQ를 참고하세요.</p>
                                </div>
                            </div>
                            <div class="col-md-7 offset-lg-1">
                                <div class="heading mb--40">
                                    <h2>상품 등록하기 </h2>
                                    <hr class="delimeter">
                                    <p>상품 등록 전, 유의사항을 먼저 확인하세요.</p>
                                </div>
                                <form action="insertProduct.do" method="post" enctype="multipart/form-data">
 									
 									<!-- cNo, lCode 보내기 -->
 									<div id="sellerInformation" style="border:4px double black; padding:10px;">
 									<h5>판매자 정보</h5>
 									<p style="font-size:14px;">*하단의 판매자 정보는 마이페이지에서 수정 가능합니다.</p>
 									
                                   	판매자 이름 <input type="text" id="cName" value="${loginUser.cName}" class="form__input mb--30"/ readonly>
               						 업체 주소 <input type="text" id="cAddress" value="${loginUser.cAddress}" class="form__input mb--30" readonly/>
                					업체 연락처 <input type="text" id="cPhone" value="${loginUser.cPhone}" class="form__input mb--30" readonly/>
                                   <input type="hidden" id="cNo" name="cNo" value="${loginUser.cNo}" class="form__input mb--30"/> 
                                   <input type="hidden" id="lCode" name="lCode"/>
									</div>

									<br><br>
									<hr class="delimeter">
									<br>
									<h5>상품 정보 등록란</h5>
                                    <input type="text" name="pTitle" id="pTitle" class="form__input mb--30" placeholder="글 제목*" required>
                                    <div id="pOriginalThumbArea">썸네일(판매상품 사진)을 선택하세요 : &nbsp;&nbsp;
									<input type="file" id="uploadFile" name="uploadFile" >								
                                    </div><br>
                                    <input type="text" name="pName" id="pName" class="form__input mb--30" placeholder="상품 이름*" required>
                                    <input type="number" name="pOriginalPrice" id="pOriginalPrice" min="5000" class="form__input mb--30" placeholder="할인 전 가격(원)*" required>
								  	<input type="number" name="pFinalPrice" id="pFinalPrice" min="5000" class="form__input mb--30" placeholder="최종 판매 가격(원)*" required>
								  	<input type="number" name="pAmount" id="pAmount" min="1" step="1" class="form__input mb--30" placeholder="판매 수량(개)*" required>
								  	<textarea class="form__input form__input--textarea mb--30" id="pInfoText" name="pInfoText" placeholder="상품정보(텍스트)*" required></textarea>
                                    <div id="uploadFilePArea">상품정보(이미지)을 선택하세요 : &nbsp;&nbsp;
									<input type="file" id="uploadFileP" name="uploadFileP" ></div>
									<br><br>
									<input type="hidden" name="pBoard" id="pBoard" value="핫딜"/>
									<div id="cgName">카테고리를 선택하세요 : &nbsp;&nbsp;
									<select id="cgName2" name="cgCode">
										<option value="C1">디지털/가전</option>
										<option value="C2">의류/패션잡화</option>
										<option value="C3">뷰티/미용</option>
										<option value="C4">스포츠/레저</option>
										<option value="C5">도서/티켓/음반</option>
										<option value="C6">가구/인테리어</option>
										<option value="C7">신선/가공식품</option>
										<option value="C8">게임/취미</option>
										<option value="C9">반려동물용품</option>
										<option value="C10">기타</option>
									</select>
									</div><br>
								 	<div id="pStartDateArea"> 판매 시작일 : &nbsp;&nbsp;
									<input type="date" name="pStartDate" id="pStartDate" readonly>
									</div><br>
									<div id="pEndDateArea"> 판매 종료일 : &nbsp;&nbsp;
									<input type="date" name="pEndDate" id="pEndDate" readonly>
									<p style="font-size:14px;">*판매 기간은 판매 시작일(상품등록일)을 기준으로 30일 후 까지 입니다.</p>
									</div>
                                    
                                    <br><hr><br>
                                    <h5>추가정보 입력란</h5>
                                    	<div id="nProductDate"> 제조연월일 : &nbsp;&nbsp; 
                                    	<input type="date" name="pProductDate" id="pProductDate"></div><br>
                                    	<input type="text" name="pVolume" id="pVolume" class="form__input mb--30" placeholder="용량/크기(kg)">	
                     					<input type="text" name="pOrigin" id="pOrigin" class="form__input mb--30" placeholder="원산지">
                    					<input type="text" name="pTreatment" id="pTreatment" class="form__input mb--30" placeholder="취급방법">
                                    
                                    <br><br>
                                    <input type="submit" class="btn btn-shape-round form__submit">
                                    
                                    
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Contact Area End -->
            </div>
        </main>
        <!-- Main Content Wrapper End -->
	</div>

	<script type="text/javascript">
	
	
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
		
		// 핫딜
		$(function(){
			
			// 오늘 날짜
			var d = new Date();
			var today = d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate();
			console.log("오늘 날짜 : " + d); 
			console.log("오늘 날짜 : " + today)
			
			// 판매시작일에 오늘 날짜 적용
			document.getElementById('pStartDate').valueAsDate = new Date();
			// $("#pStartDate").datepicker(); 
			
			// 판매종료일은 판매시작일에서 +30일 설정
			d.setDate(d.getDate() + 30);
			document.getElementById('pEndDate').valueAsDate = d;
			
			
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