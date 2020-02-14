<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #container {
      width: 60%;
      margin: 0 30%;     /*0, auto시  가운데정렬 ,임시배치*/
      margin-top:0px;
      padding-top: 80px;   /* 테두리와 내용 사이의 패딩 여백 */
    }
    body {
     position: relative;
    }

	
	#wrbtn {
		margin-left: 85%;
		padding-left: 10px;
		padding-right: 10px;
		padding-top: 5px;	
		padding-bottom: 5px;
		background: rgb(91, 185, 223);
		color:white;
		font-weight: bold;
		border: 1px;
	}
	
	#wrbtn:hover {
		background: blue;
		color:white;
		transition: 0.5s;
		font-size:1.1em;
	}
	#searchid {
		border: 1px;
		background: yellowgreen;
		color:white;
	}
	
	#searchid:hover {
		background: green;
		color:white;
		transition: 0.5s;		
	}
	
	.category{
		all:unset;
		margin-left:10%;
		margin-bottom:20px;
		margin-top:20px;
		padding-left: 10px;
		padding-right: 10px;
		padding-top: 5px;	
		padding-bottom: 5px;
		/* background: rgb(91, 185, 223);
		color:white; */
		color:black;
		font-weight: bold;
		border: 1px;
		cursor:pointer;
	}
	#cposition1 {
		position:absolute;
		 top:calc(70vh - 200px);
         left:calc(13vw - 200px);
         width:100px;
		 color:black;
	}
	#cposition1:hover {
		color:white;
		background: rgba(46, 45, 45, 0.8);
		transition: 0.5s;
	}

	#cposition2 {
		position:absolute;
		 top:calc(75vh - 200px);
         left:calc(13vw - 200px);
		 width:100px;
		 background: rgba(255, 255, 255, 0.705);
	}

	#cposition2:hover {
		color:white;
		background: rgba(46, 45, 45, 0.8);
		transition: 0.5s;
	}
	#cposition3 {
		position:absolute;
		 top:calc(80vh - 200px);
         left:calc(13vw - 200px);
		 background: rgba(255, 255, 255, 0.705);
		
	}

	#cposition3:hover {
		color:white;
		background: rgba(46, 45, 45, 0.8);
		transition: 0.5s;
	}
	#cposition4 {
		position:absolute;
		 top:calc(85vh - 200px);
         left:calc(13vw - 200px);
		 background: rgba(255, 255, 255, 0.705);
		
	}
	#cposition4:hover {
		color:white;
		background: rgba(46, 45, 45, 0.8);
		transition: 0.5s;
	}
	#cposition5 {
		position:absolute;
		 top:calc(90vh - 200px);
         left:calc(13vw - 200px);
		 background: rgba(255, 255, 255, 0.705);
	}
	#cposition5:hover {
		color:white;
		background: rgba(46, 45, 45, 0.8);
		transition: 0.5s;
	}		

	#cposition6 {
		position:absolute;
		 top:calc(95vh - 200px);
         left:calc(13vw - 200px);
         width:100px;
		 background: rgba(255, 255, 255, 0.705);
	}
	#cposition6:hover {
		color:white;
		background: rgba(46, 45, 45, 0.8);
		transition: 0.5s;
	}	

	/* 카테고리 */
	#position7 {
		position:absolute;
		 top:calc(85vh - 200px);
         left:calc(1vw - 200px);
		width:250px;
	}
	
	#position8 {
		position:absolute;
		 top:calc(1vh - 200px);
         left:calc(32vw - 200px);
		width:100%;
	}
	
	#searchPlace {
		margin-left: 30%;
	}
	#visit {
		font-weight: bold;
	}
	#cookies {
		margin-left: 10%;
		font-size: 1.2em;
	}
	.subwrap {
		background: rgba(192, 185, 185,0.2);
		padding: 1%;
	}
	#reset {
		margin-left: 10%;
		padding:8px;
		background: rgb(91, 185, 223);
		color:white;
		font-weight: bold;
		border: 1px; 
		width:20%;
	}
	#reset:hover {
		background: blue;
		color:white;
		width:22%;
		transition: 0.5s;
		font-weight: bold;
		font-size: 1.1em;
	}
	.today {
		border: 3px solid rgba(192, 185, 185,0.2); 
		padding:8px;
		background: white;
		color:black;
		width:40%;
	}



   </style>
   
    
</head>
<body>

<c:import url="../common/menubar.jsp" />
        <section  class="page-title-area bg-image ptb--80" data-bg-image="assets/img/bg/1920X200.png">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">나눔게시판</h1>
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
					
	<!-- 나눔게시판 form  -->
	  <div id="container">
		  <div class="subwrap">
			<span id="visit">최근방문한게시글
					<c:url var="cookiesbdetail" value="sbdetail.do">
						<c:param name="sbNo" value="${sb.sbNo }"/>
						<c:param name="page" value="${pi.currentPage }"/>
					</c:url>
		<c:if test="${todayCheckList != null}">
			<c:forEach var="todayCheck" items="${todayCheckList}" >
				<div class="today">제목 : <a href="${cookiesbdetail }">${todayCheck }</a></div> 
			</c:forEach>
							
		</c:if>					
			</span>
</div>
<div class="subwrap">
	<button id="reset" onclick="location.href='reset.do';">초기화</button>
</div>
<aside class="shop-sidebar">
<div class="shop-widget mb--40" id="position8">
<h3 class="widget-title mb--25" id="position7">카테고리</h3>
</div>	
</aside>
	
	<button class="category" id="cposition1" onclick="allresult();">전체</button>
	<button class="category" id="cposition2" onclick="sell();">팝니다</button>
	<button class="category" id="cposition3"  onclick="buy();">삽니다</button>
	<button class="category" id="cposition4"  onclick="share();" >나눕니다</button>
	<button class="category" id="cposition5"  onclick="information();">정보공유</button>
	<button class="category"  id="cposition6" onclick="etc();">기타</button>
	
	<table class="table table-striped table-bordered table-hover">
		<tr>
			<td width="100">번호</td>
			<td width="100">분류</td>
			<td width="400">제목</td>
			<td width="100">작성자</td>
			<td width="100">작성일</td>
			<td width="100">조회수</td>
			</tr>
		
			 		<c:forEach var="sb" items="${list }"> 
			<tr class="clicksbdetail">
			<td>${sb.sbNo }</td>		<!--글번호  -->
			<td>${sb.sbcgName }</td>
			<td>					<!-- 제목  -->
				<%-- <c:if test="${!empty loginUser }"> --%>
					<c:url var="sbdetail" value="sbdetail.do">
						<c:param name="sbNo" value="${sb.sbNo }"/>
						<c:param name="page" value="${pi.currentPage }"/>
					</c:url>
					<a class="sbdetail" href="${sbdetail }">${sb.sbTitle }</a>
				<%-- </c:if> --%>
				
				<%-- <c:if test="${empty loginUser }">
					${sb.sbTitle }
				</c:if> --%>
				
			</td>
			<td>${sb.cName }</td> <!--작성자  -->
			<td>${sb.sbDate}</td>   <!--작성일  -->
			<td>${sb.sbView }</td>   <!--조회수  -->
			
			<%-- <c:forEach var="r" items=${ rlist }>
				<td>${r.rCount }</td>      <!--댓글수  -->
			</c:forEach> --%>
		</tr>
	</c:forEach>
</table>

<!-- 검색기능  -->
<span id="searchArea">

		<select id="searchCondition" name="searchCondition">
			<option value="all">전체</option>
			<option value="writer">작성자</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		<input id="searchValue" name="searchValue" type="search">
		<button id="searchid" onclick="searchResult();">검색하기</button>
	</span>
	
	<script>
		// 검색하기 버튼클릭이벤트
		function searchResult(){
			var searchCondition = $("#searchCondition").val(); 
			var searchValue = $("#searchValue").val(); // 
			
			location.href="search.do?searchCondition="+searchCondition+"&searchValue="+searchValue;
		}
		
		//말머리 
		// 카테고리 전체 검색
		function allresult() {
			location.href="shareboard.do";
			
		}
		// 카테고리 팝니다 검색
		function sell() {
			location.href="categorySearch.do?Category="+"sell";
		}
		// 카테고리 삽니다 검색
		function buy() {
			location.href="categorySearch.do?Category="+"buy";
		}
		// 카테고리 나눕니다 검색
		function share() {
			location.href="categorySearch.do?Category="+"share";
			
		}
		// 카테고리 정보공유 검색
		function information() {
			location.href="categorySearch.do?Category="+"information";
			
		}
		// 카테고리 기타 검색
		function etc() {
			location.href="categorySearch.do?Category="+"etc";
			
			
		}
	</script>
	
	
	
	<button id="wrbtn" onclick="location.href='shareInsertForm.do';">글쓰기</button>
						<nav class="pagination-wrap">
							<ul class="pagination">
								<c:if test="${pi.currentPage <=1 }">
									<li><span class="page-number current">&lt;&lt;</span></li>
								</c:if>
								<c:if test="${pi.currentPage > 1 }">
									<c:url var="before" value="${hotDeal }">
										<c:param name="page" value="${pi.currentPage-1 }" />
									</c:url>
									<li><a class="page-number" href="${before }">&lt;&lt;</a></li>
								</c:if>
								<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
									<c:if test="${p eq pi.currentPage }">
										<li><span class="page-number current">${p }</span></li>
									</c:if>
									<c:if test="${p ne pi.currentPage }">
										<c:url var="pagination" value="${hotDeal }">
											<c:param name="page" value="${p }" />
										</c:url>
										<li><a href="${pagination }" class="page-number">${p }</a></li>
									</c:if>
								</c:forEach>
								<!-- [다음] -->
								<c:if test="${pi.currentPage >= pi.maxPage}">
									<li><span class="page-number current">&gt;&gt;</span></li>
								</c:if>
								<c:if test="${pi.currentPage < pi.maxPage }">
									<c:url var="after" value="${hotDeal }">
										<c:param name="page" value="${pi.currentPage + 1 }" />
									</c:url>
									<li><a class="page-number" href="${after }">&gt;&gt;</a></li>
								</c:if>
							</ul>
						</nav>
                            </nav>
                            </div>
        <script>

           
           $(".clicksbdetail").click(function(){
               $(".sbdetail").click();
            });

           
           </script>   
           
                            
             <br><br><br><br><br><br>               
           <c:import url="../common/footer.jsp"/>  
           
</body>
</html>