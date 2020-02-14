<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Beck - Furniture eCommerce Bootstrap 4 Template</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicons -->
<link rel="shortcut icon" href="resources/assets/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" href="resources/assets/img/icon.png">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- ************************* CSS Files ************************* -->

<!-- Vendor CSS -->
<link rel="stylesheet" href="resources/assets/css/vendor.css">

<!-- style css -->
<link rel="stylesheet" href="resources/assets/css/main.css">
</head>

<body>
	<c:import url="../common/menubar.jsp" />
	<%-- <c:url var="successBuy" value="hotDealBuyProduct.do">
		<c:param name="cNo" value="${loginUser.cNo }"/>
	</c:url> --%>
	<form method="post" action="hotDealBuyProduct.do" id="buyformm">
		<input type="hidden" value="${loginUser.cNo }" name="cNo">
		<input type="hidden" name="uId" id="uId">
		<input type="hidden" name="method" id="method">
	</form>
	<form method="post" action="hotDealBuyForm.do" id="buyformm2">
		<input type="hidden" value="${loginUser.cNo }" name="cNo">
	</form>
	<script>
		var IMP = window.IMP; // 생략가능
		IMP.init('imp23257133'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		IMP.request_pay({
		    pg : 'kakaopay', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : '${total}',
		    buyer_email : '${loginUser.cEmail}',
		    buyer_name : '${loginUser.cName}',
		    buyer_tel : '${loginUser.cPhone}',
		    buyer_addr : '${loginUser.cAddress}',
		    buyer_postcode : '123-456',
		    
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.\n';
		        //msg += '고유ID : ' + rsp.imp_uid;
		        //msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '주문자 : ' + rsp.buyer_name + "\n";
		        msg += '결제 금액 : ' + rsp.paid_amount + "원";
		        msg += '결제 방법 : ' + rsp.pay_method + "\n";
		        //msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		    if(rsp.success){
		    	$("#method").val(rsp.pay_method);
		    	$("#uId").val(rsp.imp_uid);
		    	$("#buyformm").submit();
		    }else{
		    	$("#buyformm2").submit();	
		    }
		});
	</script>

	<!-- ************************* JS Files ************************* -->

	<!-- jQuery JS -->
	<script src="resources/assets/js/vendor.js"></script>

	<!-- Main JS -->
	<script src="resources/assets/js/main.js"></script>
</body>

</html>