<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SB Admin - Login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <!-- Custom fonts for this template-->
  <link href="resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="resources/admin/css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">


  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">사업자 확인</div>
      <div class="card-body">
      <!-- 업데이트로 가는거 하나 만들것 -->
       
        <input type="hidden" name="cNo" value="${ qna.qNo }">
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" id="bOwner" class="form-control" value="${ qna.cName }" readonly >
              <label for="inputEmail">작성자</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" id="bClass" class="form-control" value="${ qna.qEnrollDate }" readonly>
              <label for="inputPassword">작성일</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" id="bShopNo" class="form-control" required="required" value="${ qna.qTitle }"autofocus="autofocus" readonly>
              <label for="inputPassword">문의제목</label> 
            </div>
          </div>

                    <div class="form-group">
            <div class="form-label-group">
          <div align="">
        
          <!-- 내용 -->
              문의내용
            <textarea name="content" cols="120" rows="12"
            style="width: 100%; resize: none" placeholder="내용" readonly
            class="form-control" >${ qna.qContent }</textarea>
          </div>
        <p>
              
            </div>
          </div>
          
          <button type="button" id="cancel" class="btn btn-primary btn-block">목록으로</button> 
          
          
          <c:url var="awnser" value="awnser.do">
          	<c:param name="qNo" value="${ qna.qNo }"/>
<%--           	<c:param name="cEmail" value="${ qna.cEmail }"/>
          	<c:param name="qTitle" value="${ qna.qTitle }"/> --%>
          </c:url>
          
          <button class="btn btn-primary btn-block" onclick="location.href='${awnser}'">답변하기</button>
		 
		 


      </div>
    </div>
  </div>

<script>
$(function(){
	$("#cancel").click(function(){
		opener.parent.location.reload();
		window.close();
	});
});

</script>
  
  

  <!-- Bootstrap core JavaScript-->
  <script src="resources/admin/vendor/jquery/jquery.min.js"></script>
  <script src="resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
