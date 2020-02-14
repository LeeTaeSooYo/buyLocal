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
      <div class="card-header">답변하기</div>
      <div class="card-body">
      <!-- 업데이트로 가는거 하나 만들것 -->
       <form action="mailSending.do" method="post">
       <input type="hidden" name="qNo"value="${ qna.qNo }">
      <div>
        <input type="text" name="tomail" size="120"
        style="width: 100%" placeholder="상대의 이메일" value="${ qna.cEmail }"
        class="form-control">
      </div>
      <div align="center">
        <!-- 제목 -->
        <input type="text" name="title" size="120"
        style="width: 100%" placeholder="제목을 입력해주세요" value="[답변] ${ qna.qTitle }"
        class="form-control">
      </div>
   
      <div align="center">
          내용
            <textarea name="content" cols="120" rows="12"
            style="width: 100%; resize: none" placeholder="내용" 
            class="form-control"></textarea>
          </div>  
          

          </div>
          
          
       
      <div align="center">
        <input id="submit" type="submit" value="메일 보내기" class="btn btn-warning">
      </div>
    </form>
    
    
    <script>
$(function(){
	$("#submit").click(function(){
		alert("답변하기가 완료되었습니다.");
		opener.parent.location.reload();
		window.close();
	});
});

</script>

      </div>
    </div>
  </div>

<script>
$(function(){
	$("#cancel").click(function(){
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
