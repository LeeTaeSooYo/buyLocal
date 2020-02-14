<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
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
          <li class="breadcrumb-item">
            <a href="#">게시글 관리</a>
          </li>
          <li class="breadcrumb-item active">Charts</li>
        </ol>


  <!-- Logout Modal-->
	<table class="menu" align="center">
			<tr>
				<td width="400" height="400" align="center">게시글 관리
					<div id="menu1">
						<c:url var="normalUserInfo" value="content.do"/>
						<a href="${ content }">
							<img id="menu2" src="resources/admin/images/content.png"
							width="250" height="250">
						</a>
					</div>
				</td>
				<td width="400" height="400" align="center">Q & A
					<div id="menu2">
						<c:url var="normalUserBuy" value="qna.do"/>
						<a href="${qna}">
							<img id="menu2" src="resources/admin/images/qna.png"
							width="250" height="250">
						</a>
					</div>
				</td>
				
					<td width="400" height="400" align="center">신고 리스트
					<div id="menu2">
						<c:url var="normalUserBuy" value="report.do"/>
						<a href="${report}">
							<img id="menu2" src="resources/admin/images/report.png"
							width="250" height="250">
						</a>
					</div>
				</td>
				
				
			</tr>
			</table>
		</div>
	</div>
</div>

  <!-- Bootstrap core JavaScript-->
  <script src="resources/admin/vendor/jquery/jquery.min.js"></script> <!-- 리스트들 보는 곳 -->
  <script src="resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


  <!-- Core plugin JavaScript-->
  <script src="resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="resources/admin/vendor/chart.js/Chart.min.js"></script>
  <script src="resources/admin/vendor/datatables/jquery.dataTables.js"></script>
  <script src="resources/admin/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="resources/admin/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="resources/admin/js/demo/datatables-demo.js"></script>
  <script src="resources/admin/js/demo/chart-area-demo.js"></script>


</body>

</html>
