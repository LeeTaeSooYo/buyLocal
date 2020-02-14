<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.mylocal.myL.share.model.vo.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

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
                        <h1 class="page-title">나눔게시판 수정</h1>
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
   <form action="shareUpdate.do" method="post" enctype="Multipart/form-data">
      <input type="hidden" name="sbNo" value="${ sb.sbNo }"/>
      <input type="hidden" name="cName" value="${ sb.cName }"/>
      <input type="hidden" name="originalFileName" value="${ sb.originalFileName }"/>
      <input type="hidden" name="renameFileName" value="${ sb.renameFileName }"/>
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
                    <td><input type="text" name="sbTitle" size="50" value="${sb.sbTitle}"></td>
                </tr>
                <tr>
                  <td class="cssEfek">작성자</td>
            <%-- <td><input type="text" name="cName" size="50" value="${loginUser.cName }" readonly></td> --%>
            <td><input type="text" name="cName" size="50" value="${sb.cName }" readonly></td>
                </tr>
                <tr>
                    <td class="cssEfek">내용</td>
                  <td width="1000" height="300"><textarea name="sbContent" id="sbContent" rows="10" cols="100">${sb.sbContent }</textarea></td>
                </tr>
                 <tr>
               <td class="cssEfek">첨부파일</td>
               <td><input type="file" name="reloadFile">
                  <c:if test="${ !empty sb.originalFileName }">
                     <br>현재 업로드한 파일 : 
                           <a href="${ contextPath }/resources/shareuploadFiles/${sb.originalFileName}" download>
                              ${ sb.originalFileName }
                           </a>         
                  </c:if>
                  <br>
               </td>
            </tr>
                <tr>
                     <td colspan="2" align="center">
                <input type="submit" class='btn2' value="수정하기">
                <button type="button" class='btn2' onclick="history.back();">취소하기</button>
                     </td>
                </tr>
                </table>
                </form>
   
</body>
</html>