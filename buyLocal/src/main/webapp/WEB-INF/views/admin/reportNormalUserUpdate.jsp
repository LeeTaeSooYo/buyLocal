<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SB Admin - Login</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Custom fonts for this template-->
<link href="resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="resources/admin/css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">


	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">회원 확인</div>
			<div class="card-body">
				<form action="normalUserReport.do" method="post">
					<input type="hidden" name="cNo" value="${ customer.cNo }">
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" id="cName" class="form-control"
								value="${ customer.cName }" readonly> <label
								for="inputEmail">회원명</label>
						</div>
					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" id="cAddress" class="form-control"
								value="${ customer.cAddress }" readonly> <label
								for="inputPassword">주소</label>
						</div>
					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" id="cEmail" class="form-control"
								required="required" value="${ customer.cEmail }"
								autofocus="autofocus" readonly> <label
								for="inputPassword">회원이메일</label>
						</div>
					</div>

					<div class="form-group">
						<div class="form-label-group">
							<c:choose>
								<c:when test="${ customer.cStatus eq 'Y' }">
								<input type="hidden" name="cStatus" value="N" >
									<input type="submit" id="signupbtn" value="회원 탈퇴"
								class="btn btn-primary btn-block">
								
								
								</c:when>
								<c:otherwise>
								<input type="hidden" name="cStatus" value="Y">
									<input type="submit" id="signupbtn" value="회원 복구"
						class="btn btn-primary btn-block">
								</c:otherwise>
							</c:choose>

						</div>
					</div>


				</form>

			</div>
		</div>
	</div>


	<script>
	
		$(function() {
			$("#signupbtn").click(function() {
				alert('회원 정보가  변경되었습니다.');
				window.close();
			})
		})
	</script>

	<!-- Bootstrap core JavaScript-->
	<script src="resources/admin/vendor/jquery/jquery.min.js"></script>
	<script
		src="resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
