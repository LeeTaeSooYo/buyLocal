<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<c:import url="common.jsp"/>
</head>

<body id="page-top">

  <div id="wrapper">
	 <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="main.jsp" id="personDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class="fa fa-cog fa-spin fa-fw"></i> 
          <span>일반회원</span>
        </a>
         <div class="dropdown-menu" aria-labelledby="personDropdown">
          <c:url var="normalUserInfo" value="normalUserInfo.do"/>
          <c:url var="normalUserBuy" value="adNormalUserBuy.do"/>
          <a class="dropdown-item" href="${ normalUserInfo }">회원정보</a>
          <a class="dropdown-item" href="${ normalUserBuy }">구매내역</a>
          </div>
      </li>
      
            <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="main.jsp" id="personDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fa fa-cog fa-spin fa-fw"></i> 
          <span>사업자회원</span>
        </a>
         <div class="dropdown-menu" aria-labelledby="personDropdown">
         <c:url var="businessUserInfo" value="businessUserInfo.do"/>
          <c:url var="businessUserGrade" value="businessUserGrade.do"/>
          <a class="dropdown-item" href="${ businessUserInfo }">사업자 정보</a>
          <a class="dropdown-item" href="${ businessUserGrade }">등급 관리</a>
          </div>
      </li>
      
      
      
            <li class="nav-item">
      		 <c:url var="content" value="content.do"/>
        <a class="nav-link" href="${ content }">
          <i class="fas fa-fw fa-tachometer-alt"></i> 
          <span>게시글 관리</span></a>
      </li>
      
            <li class="nav-item">
      		<c:url var="qna" value="qna.do"/>
        <a class="nav-link" href="${ qna }">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Q&A</span></a>
      </li>
      
            <li class="nav-item">
      		<c:url var="report" value="report.do"/>
        <a class="nav-link" href="${ report }">
          <i class="fa fa-camera-retro fa-1x"></i>
          <span>신고목록</span></a>
      </li>
      

      <li class="nav-item">
      		<c:url var="adminChart" value="adminChart.do"/>
        <a class="nav-link" href="${adminChart}">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>통계</span></a>
      </li>
    </ul>

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">

				</ol>

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Q&A 미답변 목록
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable1" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
								</tfoot>
								<tbody>
								<!--  글번호랑 이메일 들고 가자 -->
								<c:forEach var="qna" items="${ list }">	
								<c:url var="qnaDetail" value="qnaDetail.do">		
								<c:param name="qNo" value="${ qna.qNo }"/>
								<c:param name="cEmail" value="${ qna.cEmail }"/>
								</c:url>	
									<tr style="cursor:pointer" onclick="window.open('${qnaDetail}', 'regist', 'width=430,height=500, left=500 top=170')">
										<td>${ qna.qTitle }</td>
										<td>${ qna.cName }</td>
										<td>${ qna.qEnrollDate }</td>
									</tr>		
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Q&A 답변 목록
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable2" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>제목</th>
										<th>작성자</th>
										<th>답변일</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>제목</th>
										<th>작성자</th>
										<th>답변일</th>
									</tr>
								</tfoot>
								<tbody>
								<!--  글번호랑 이메일 들고 가자 -->
								<c:forEach var="qna2" items="${ list2 }">	
									<tr>
										<td>${ qna2.qTitle }</td>
										<td>${ qna2.cName }</td>
										<td>${ qna2.qEnrollDate }</td>
									</tr>		
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer small text-muted">Updated yesterday
						at 11:59 PM</div>
				</div>

				<p class="small text-center text-muted my-5">
					<em>More table examples coming soon...</em>
				</p>

			</div>
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
			<footer class="sticky-footer">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright © Your Website 2019</span>
					</div>
				</div>
			</footer>

		</div>
		<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="resources/admin/vendor/jquery/jquery.min.js"></script>
	<script
		src="resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="resources/admin/vendor/datatables/jquery.dataTables.js"></script>
	<script
		src="resources/admin/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/admin/js/sb-admin.min.js"></script>

	<!-- Demo scripts for this page-->
	<script src="resources/admin/js/demo/datatables-demo.js"></script>

</body>

</html>
