<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>로그인</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
     <c:if test="${!empty msg}">
        alert('${msg}');
        <c:remove var="msg"/>
     </c:if>
</script>
<script>
	$(function(){
		$("#id").keyup(function() {
			$.ajax({
				url : "findPwd.do",
				type : "POST",
				data : {
					cId : $("#id").val()
				},
				success : function(result) {
					if (result == 1) {
						alert('중복된 아이디가 있습니다. 다른 아이디를 입력해주세요.');
						/* $("#idCheck").html("중복된 아이디가 있습니다.");
						$("#joinBtn").attr("disabled", "disabled"); */
					} else {
					$("#idCheck").html("");
					$("#joinBtn").removeAttr("disabled");
					}
				},
			})
		});
	})
</script>
<style>
	@charset "UTF-8";
	@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
	* {
	  -moz-box-sizing: border-box;
	  -webkit-box-sizing: border-box;
	  box-sizing: border-box;
	  -webkit-font-smoothing: antialiased;
	  -moz-osx-font-smoothing: grayscale;
	  text-rendering: optimizeLegibility;
	}
	
	body {
	  font-family: 'Lato', sans-serif;
	  background-color: #ffffff;
	  background-size: cover;
	  margin-top:20vh;
	  
	    
	}
	       
	body .container {
	  position: relative;
	  overflow: hidden;
	  width: 700px;
	  height: 600px;
	  margin: auto;
	  background-color: #ffffff;
	-webkit-box-shadow: 13px 28px 51px 3px rgba(0,0,0,1);
	-moz-box-shadow: 13px 28px 51px 3px rgba(0,0,0,1);
	box-shadow: 13px 28px 51px 3px rgba(0,0,0,1);
	border: 0px groove #ffffff;
	}
	body .container .half {
	  float: left;
	  width: 50%;
	  height: 100%;
	  padding: 58px 40px 0;
	}
	body .container .half.bg {
	
	  background-size: 400px;
	  background-repeat: no-repeat;
	  padding-left: 25px;
	}
	
	body .container h1 {
	  font-size: 18px;
	  font-weight: 700;
	  margin-bottom: 23px;
	  text-align: center;
	  text-indent: 6px;
	  letter-spacing: 7px;
	  text-transform: uppercase;
	  color: #263238;
	}
	body .container .tabs {
	  width: 100%;
	  margin-bottom: 29px;
	  border-bottom: 1px solid #d9d9d9;
	}
	body .container .tabs .tab {
	  display: inline-block;
	  margin-bottom: -1px;
	  padding: 20px 15px 10px;
	  cursor: pointer;
	  letter-spacing: 0;
	  border-bottom: 1px solid #d9d9d9;
	  -moz-user-select: -moz-none;
	  -ms-user-select: none;
	  -webkit-user-select: none;
	  user-select: none;
	  transition: all 0.1s ease-in-out;
	}
	body .container .tabs .tab a {
	  font-size: 11px;
	  text-decoration: none;
	  text-transform: uppercase;
	  color: #d9d9d9;
	  transition: all 0.1s ease-in-out;
	}
	body .container .tabs .tab.active a, body .container .tabs .tab:hover a {
	  color: #263238;
	}
	body .container .tabs .tab.active {
	  border-bottom: 1px solid #263238;
	}
	body .container .content form {
	  position: relative;
	  height: 287px;
	}
	body .container .content label:first-of-type, body .container .content input:first-of-type, body .container .content .more:first-of-type {
	  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
	  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
	  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
	}
	body .container .content label:nth-of-type(2), body .container .content input:nth-of-type(2), body .container .content .more:nth-of-type(2) {
	  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
	  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
	  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
	}
	body .container .content label:nth-of-type(3), body .container .content input:nth-of-type(3), body .container .content .more:nth-of-type(3) {
	  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
	  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
	  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
	}
	body .container .content label {
	  font-size: 12px;
	  color: #263238;
	  -moz-user-select: -moz-none;
	  -ms-user-select: none;
	  -webkit-user-select: none;
	  user-select: none;
	}
	body .container .content label:not([for='remember']) {
	  display: none;
	}
	body .container .content input.inpt {
	  font-size: 14px;
	  display: block;
	  width: 100%;
	  height: 42px;
	  margin-bottom: 12px;
	  padding: 16px 13px;
	  color: #999999;
	  border: 1px solid #007f00;
	  background: transparent;
	  -moz-border-radius: 2px;
	  -webkit-border-radius: 2px;
	  border-radius: 2px;
	}
	body .container .content input.inpt::-webkit-input-placeholder {
	  font-size: 14px;
	  color: #999999;
	  font-family: 'Lato', sans-serif;
	}
	body .container .content input.inpt:-moz-placeholder {
	  font-size: 14px;
	  color: #999999;
	  font-family: 'Lato', sans-serif;
	}
	body .container .content input.inpt::-moz-placeholder {
	  font-size: 14px;
	  color: #999999;
	  font-family: 'Lato', sans-serif;
	}
	body .container .content input.inpt:-ms-input-placeholder {
	  font-size: 14px;
	  color: #999999;
	  font-family: 'Lato', sans-serif;
	}
	body .container .content input.inpt:focus {
	  border-color: #999999;
	}
	body .container .content input.submit {
	  font-size: 12px;
	  line-height: 42px;
	  display: block;
	  width: 100%;
	  height: 42px;
	  cursor: pointer;
	  vertical-align: middle;
	  letter-spacing: 2px;
	  text-transform: uppercase;
	  color: #263238;
	  border: 1px solid #007f00;
	  background: transparent;
	  -moz-border-radius: 2px;
	  -webkit-border-radius: 2px;
	  border-radius: 2px;
	}
	body .container .content input.submit:hover {
	  background-color: #007f00;
	  color: #ffffff;
	  -moz-transition: all 0.2s;
	  -o-transition: all 0.2s;
	  -webkit-transition: all 0.2s;
	  transition: all 0.2s;
	}
	body .container .content input:focus {
	  outline: none;
	}
	body .container .content .checkbox {
	  margin-top: 4px;
	  overflow: hidden;
	  clip: rect(0 0 0 0);
	  width: 0;
	  height: 0;
	  margin: 17px -1px;
	  padding: 0;
	  border: 0;
	  opacity: 0;
	  visibility: hidden;
	}
	body .container .content .checkbox + label {
	  vertical-align: middle;
	  display: inline-block;
	  width: 50%;
	}
	body .container .content .checkbox + label:before {
	  content: "\A";
	  color: #999999;
	  font-family: Verdana;
	  font-weight: bold;
	  font-size: 8px;
	  line-height: 10px;
	  text-align: center;
	  display: inline-block;
	  vertical-align: middle;
	  position: relative;
	  -moz-border-radius: 2px;
	  -webkit-border-radius: 2px;
	  border-radius: 2px;
	  background: transparent;
	  border: 1px solid #d9d9d9;
	  width: 11px;
	  height: 11px;
	  margin: -2px 8px 0 0;
	}
	body .container .content .checkbox:checked + label:before {
	  content: "✓";
	}
	body .container .content .submit-wrap {
	  position: absolute;
	  bottom: 0;
	  width: 100%;
	}
	body .container .content .submit-wrap a {
	  font-size: 12px;
	  display: block;
	  margin-top: 20px;
	  text-align: center;
	  text-decoration: none;
	  color: #999999;
	 /*수정 = 회원가입 및 비밀번호 재설정 링크 위치*/
	
	}
	body .container .content .submit-wrap a:hover {
	  text-decoration: underline;
	}
	body .container .content .signup-cont {
	  display: none;
	}
	
	@keyframes slideIn {
	  0% {
	    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
	    opacity: 0;
	    margin-left: -320px;
	  }
	  100% {
	    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
	    opacity: 1;
	    margin-left: 0px;
	  }
	}
	@-webkit-keyframes slideIn {
	  0% {
	    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
	    opacity: 0;
	    margin-left: -320px;
	  }
	  100% {
	    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
	    opacity: 1;
	    margin-left: 0px;
	  }
	  
	} 
	
	.credits {
	  display: block;
	  position: absolute;
	  right: 0;
	  bottom: 0;
	  color: #999999;
	  font-size: 14px;
	  margin: 0 10px 10px 0;
	}
	.credits a {
	  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
	  opacity: 0.8;
	  color: inherit;
	  font-weight: 700;
	  text-decoration: none;
	}
	
	.socialLogin {
	  margin: 0px 0px 3px 3px;
	}
</style>
</head>
<body>
   <section class="container">
      <article class="half">
            <h1><img src="resources/assets/img/logo/logo.png"></h1>
            <div class="tabs">
                  <span class="tab signin active"><a href="#signin">로그인</a></span>
            <span class="tab signup"><a href="#signup">비밀번호 찾기</a></span>
        </div>
            <div class="content">
                  <div class="signin-cont cont">
                        <form action="login.do" method="post" enctype="multipart/form-data">
	                             <input type="text" name="cId" id="userId" class="inpt" required="required" placeholder="아이디를 입력해주세요.">
	                             <label for="userId">아이디</label>
	                             <input type="password" name="cPwd" id="password" class="inpt" required="required" placeholder="비밀번호를 입력해주세요.">
	                             <label for="password">비밀번호</label>
	                             <input type="checkbox" id="idSaveCheck" class="checkbox">
	                             <label for="idSaveCheck">아이디 저장하기</label>
                        	<div class="submit-wrap">
                        	<input type="submit" value="로그인" class="submit">
	                        <!-- 소망 수정 => 회원 가입 버튼을 누르면 회원 구분 처리용 페이지로 이동 -->
	                        <c:url var="userType" value="userType.do"/>
	                        <a href="${ userType }" id="userType" class="more">회원가입</a>
	                        </div>
                        </form>
            		</div>
            <div class="signup-cont cont">
              <form action="findPwd.do" method="post" enctype="multipart/form-data">
                 <input type="text" name="cId" id="id" class="inpt" required="required" placeholder="아이디를 입력해주세요.">
                 <label for="cId">아이디</label>
                 <input type="email" name="cEmail" id="email" class="inpt" required="required" placeholder="가입 시 사용한 이메일 주소를 입력해주세요.">
                 <label for="cEmail">이메일 주소</label>
                 <div class="submit-wrap">
                       <input type="submit" value="비밀번호 찾기" class="submit">
                 </div>
              </form>
          </div>
            </div>
      </article>
	      <div class="half bg"><br><br><br><br><br><br><br>
	      	  
		      <img class="socialLogin" src="resources/user/images/socialNaver.png"">
		      <img class="socialLogin" src="resources/user/images/socialGoogle.png">
		      <!-- <a id="kakao-login-btn" href="javascript:loginWithKakao()"> -->
		      <img class="socialLogin" src="resources/user/images/socialKakao.png"></a>
		      <%-- <button id="kakaologin">코드받기</button>
		      <a href="${ naver_url }"><img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a> --%>

	      </div>
	</section>
	<script>

	$('.tabs .tab').click(function(){
	    if ($(this).hasClass('signin')) {
	        $('.tabs .tab').removeClass('active');
	        $(this).addClass('active');
	        $('.cont').hide();
	        $('.signin-cont').show();
	    } 
	    if ($(this).hasClass('signup')) {
	        $('.tabs .tab').removeClass('active');
	        $(this).addClass('active');
	        $('.cont').hide();
	        $('.signup-cont').show();
	    }
	});
	
	
	$('.container .bg').mousemove(function(e){
	    var amountMovedX = (e.pageX * -1 / 30);
	    var amountMovedY = (e.pageY * -1 / 9);
	    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
	});
	</script>
	
	<script>
		$(document).ready(function(){
			 
		    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
		    var key = getCookie("key");
		    $("#userId").val(key); 
		     
		    if($("#userId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		    }
		     
		    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
		        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
		            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
		        }else{ // ID 저장하기 체크 해제 시,
		            deleteCookie("key");
		        }
		    });
		     
		    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
		            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
		        }
		    });
		});	
	 
		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		 
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		 
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}

	</script>
	
</body>
</html>