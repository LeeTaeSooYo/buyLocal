<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script> -->



 
<style>
	table {
		margin:auto;
	}
    #rhead {
        background: gray;

    }
 .btn2{ 

        border: 1px solid rgb(91, 185, 223);
        border-radius: 18px;
        width: 100px;
        height: 35px;
        font-size: 18px;
        text-align: center;
        cursor: pointer;
        color: white;
       background: rgb(91, 185, 223);
        transition: 0.5s;

    }


    .btn2:hover{ 

        border: 1px solid rgb(91, 185, 223);
       border-radius: 18px;
        width: 110px;
        height: 40px;
        font-size: 22px;
        text-align: center;
        cursor: pointer;
        color: white;
       background: rgb(91, 185, 223);
        transition: 0.5s;
    }
    .cssEfek {
    	font-size:1.5em;
    	font-weight: bold;
    }
</style>
</head>
<body>
<c:import url="../common/menubar.jsp" />

        <section  class="page-title-area bg-image ptb--80" data-bg-image="assets/img/bg/1920X200.png">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">나눔게시판 쓰기</h1>
					<ul class="breadcrumb">
						<c:if test="${empty sessionScope.loginUser }">
							<li class="current"><span>전체지역</span></li>
						</c:if>
						<c:if test="${!empty sessionScope.loginUser }">
                            <li class="current"><span>${ loginUser.cAddress}</span></li>
                        </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
	
	<form action="shareInsert.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td class="cssEfek">말머리</td>
				<td>
				<select name="sbcgName">
					<option value="팝니다">팝니다</option>
					<option value="삽니다">삽니다</option>
					<option value="나눕니다">나눕니다</option>
					<option value="정보공유">정보공유</option>
					<option value="기타">기타</option>
				</select>
				</td>
			</tr>
			<tr>
				<td class="cssEfek">제목</td>
				<td><input type="text" name="sbTitle" size="50"></td>
			</tr>
			<tr>
				<td class="cssEfek">작성자</td>
				<td><input type="text" name="cName" size="50" value="${loginUser.cName }" readonly></td>
			</tr>
			<tr>
				<td class="cssEfek">내용</td>
				<!-- <td><textarea cols="50" rows="7" name="rContent" placeholder="내용을 입력하세요"></textarea></td> -->
				  <td width="1000" height="300"><textarea name="sbContent" id="sbContent" rows="10" cols="100"></textarea></td> 
			</tr>
				<tr>
					<td class="cssEfek">첨부파일</td>
					<td><input type="file" name="uploadFile"></td>
				</tr>
			<tr>
				<td colspan="2" align="center">
					<button class="btn2" type="submit">등록하기</button> &nbsp;
					<button class="btn2" type="button" onclick="location.href='shareboard.do';">목록으로</button>
				</td>
			</tr>
		</table>
	</form>
	
			
    <!--     <script type="text/javascript">
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
			 oAppRef: oEditors,
			 elPlaceHolder: "ir1",
			 sSkinURI: "resources/se2/SmartEditor2Skin.html",
			 fCreator: "createSEditor2"
			});
		</script> -->
			
<br><br><br><br><br><br>
        <c:import url="../common/footer.jsp"/> 



</body>
</html>