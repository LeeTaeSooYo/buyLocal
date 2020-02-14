<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>공지사항</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicons -->
<link rel="shortcut icon" href="resources/assets/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" href="resources/assets/img/icon.png">

<!-- ************************* CSS Files ************************* -->

<!-- Vendor CSS -->
<link rel="stylesheet" href="resources/assets/css/vendor.css">

<!-- style css -->
<link rel="stylesheet" href="resources/assets/css/main.css">
</head>

<body>
	<c:import url="../common/menubar.jsp" />


	<!-- Main Wrapper Start -->
	<div class="wrapper">

		<!-- Breadcrumb area Start -->
		<section class="page-title-area bg-image ptb--80"
			data-bg-image="resources/assets/img/bg/page_title_bg.jpg">
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
								<table class="table table-style-2 wishlist-table text-center">
									<h3>공지사항</h3>

									<div style="float: right;">
										<select>
											<option value="0">최신순</option>
											<option value="1">조회수순</option>
										</select>
									</div>
									<br>
									<br>
									<thead>
										<tr>
											<th>No.</th>
											<th class="text-left">제목</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="notice" items="${ list }">
										
											<tr>
												<td class="product-remove text-left">${ notice.nNo }</td>
												<td class="product-name text-left wide-column">
												<c:url var="noticeDetail" value="noticeDetail.do">
													<c:param name="nNo" value="${ notice.nNo }"/>
													<c:param name="page" value="${ pi.currentPage }"/>
												</c:url>
												<a href="${noticeDetail}">${ notice.nTitle }</a>
											</td>
												<td class="product-stock">${notice.nDate}</td>
												<td class="product-action-btn">${ notice.nView }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<c:if test="${loginUser.cId eq 'admin' }">
								<div align="right">
									<button onclick="location.href='noticeInsertView.do'">공지사항 작성</button>
								</div>
								
							 </c:if>
								<br>
								<br>
				
				<nav class="pagination-wrap">
                     <ul class="pagination">
                        <c:if test="${pi.currentPage <=1 }">
                           <li><span class="page-number current">&lt;&lt;</span></li>
                        </c:if>
                        <c:if test="${pi.currentPage > 1 }">
                           <c:url var="before" value="noticeList.do">
                              <c:param name="page" value="${pi.currentPage-1 }"/>
                           </c:url>
                           <li><a class="page-number" href="${before }">&lt;&lt;</a></li>
                        </c:if>
                        <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                           <c:if test="${p eq pi.currentPage }">
                              <li><span class="page-number current">${p }</span></li>
                           </c:if>
                           <c:if test="${p ne pi.currentPage }">
                              <c:url var="pagination" value="noticeList.do">
                                 <c:param name="page" value="${p }"/>
                              </c:url>
                              <li><a href="${pagination }" class="page-number">${p }</a></li>
                           </c:if>
                        </c:forEach>
                        <!-- [다음] -->
                        <c:if test="${pi.currentPage >= pi.maxPage}">
                           <li><span class="page-number current">&gt;&gt;</span></li>
                        </c:if>
                        <c:if test="${pi.currentPage < pi.maxPage }">
                           <c:url var="after" value="noticeList.do">
                              <c:param name="page" value="${pi.currentPage + 1 }"/>
                           </c:url>
                           <li><a class="page-number" href="${after }">&gt;&gt;</a></li>
                        </c:if> 
                     </ul>
                  </nav>
								<!-- 페이지네이션 end -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content Wrapper Start -->

		<c:import url="../common/footer.jsp" />

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
</body>

</html>