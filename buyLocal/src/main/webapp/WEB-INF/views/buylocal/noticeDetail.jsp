<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
 
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>공지사항</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicons -->
    <link rel="shortcut icon" href="resources/assets/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="resources/assets/img/icon.png">

    <!-- ************************* CSS Files ************************* -->

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="resources/assets/css/vendor.css">

    <!-- style css -->
    <link rel="stylesheet" href="resources/assets/css/main.css">
</head>

<body>
	<c:import url="../common/menubar.jsp"/>	
	
    

    <!-- Main Wrapper Start -->
    <div class="wrapper">
   
        <!-- Breadcrumb area Start -->
        <section class="page-title-area bg-image ptb--80" data-bg-image="resources/assets/img/bg/page_title_bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">공지사항</h1>
                        <ul class="breadcrumb">
                            <li><a href="index.html">Home</a></li>
                            <li class="current"><span>Buylocal</span></li>
                            <li class="current"><span>공지사항</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb area End -->

        <!-- Main Content Wrapper Start -->
        <div class="main-content-wrapper">
            <div class="page-content-inner ptb--80 ptb-md--60">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="table-content table-responsive">
                                

								<br>
								
                                <h3>${ notice.nTitle }</h3>
                                <hr>
                                <p>${ notice.nDate } / 조회수 : ${ notice.nView }</p>
                                
                                <br><br>
                                
                                <p>
                                	${ notice.nContent }                         
                                </p>
                                
                                <hr>
                                
                                <table>
                                <tr>
                                	<th>이전글</th>
                                	<td><a href="#">없음</a></td>
                                </tr>	
                                
                                <tr>
                                	<th>다음글</th>
                                	<td><a href="#">공지사항2</a></td>
                                </tr>
                                </table>
                                
                                <br>
                                
                                <div id="buttonArea" style="float:right;">
                                
                                <c:url var="noticeList" value="noticeList.do">
                                	<c:param name="page" value="${ currentPage }"/>
                                </c:url>
                                
                                <c:url var="noticeUpdateView" value="noticeUpdateView.do">
                                	<c:param name="nNo" value="${ notice.nNo }"/>
                                	<c:param name="page" value="${ currentPage }"/>
                                </c:url>
                                
                                <c:url var="noticeDelete" value="noticeDelete.do">
                                	<c:param name="nNo" value="${ notice.nNo }"/>
                                </c:url>
                                
	                                <button onclick="location.href='${noticeList}'"> 목록으로 </button>
                                	<c:if test="${ loginUser.cId eq 'admin' }">
	                                <button onclick="location.href='${ noticeUpdateView }'"> 글 수정 </button>
	                                
	      

	                                <button id="delete_btn"> 글 삭제 </button>
	                                </c:if>
                                </div>
                                
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Main Content Wrapper Start -->

        <c:import url="../common/footer.jsp"/>

        <!-- Global Overlay Start -->
        <div class="global-overlay"></div>
        <!-- Global Overlay End -->

        <!-- Global Overlay Start -->
        <a class="scroll-to-top" href=""><i class="la la-angle-double-up"></i></a>
        <!-- Global Overlay End -->
    </div>
    <!-- Main Wrapper End -->
 

    <!-- ************************* JS Files ************************* -->

    <!-- jQuery JS -->
    <script src="resources/assets/js/vendor.js"></script>

    <!-- Main JS -->
    <script src="resources/assets/js/main.js"></script>
    
    <script>
    $("#delete_btn").click(function(){
        if(confirm("공지사항을 삭제하시겠습니까?") == true){
        	location.href='${ noticeDelete }'
            alert("삭제되었습니다.");
        }
        else{
            return ;
        }
    });
    </script>

</body>

</html>