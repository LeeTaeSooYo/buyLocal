<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.*, java.text.*"  %>
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
            <a href="${ user }">회원관리</a>
          </li>
          <li class="breadcrumb-item active">Overview</li>
        </ol>

        <!-- Icon Cards-->
        <div class="row">
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-comments"></i>
                </div>
                <div class="mr-5">일반 회원</div>
              </div>
               <c:url var="normalUser" value="normalUser.do"/>
              <a class="card-footer text-white clearfix small z-1" href="${ normalUser }">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-success o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-shopping-cart"></i>
                </div>
                <div class="mr-5">사업자 회원</div>
              </div>
               <c:url var="businessUser" value="businessUser.do"/>
              <a class="card-footer text-white clearfix small z-1" href="${ businessUser }">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          
          
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-warning o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-list"></i>
                </div>
                <div class="mr-5">게시판 관리</div>
              </div>
               <c:url var="boardList" value="boardList.do"/>
              <a class="card-footer text-white clearfix small z-1" href="${ boardList }">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-danger o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-life-ring"></i>
                </div>
                <div class="mr-5">통계</div>
              </div>
               <c:url var="adminChart" value="adminChart.do"/>
              <a class="card-footer text-white clearfix small z-1" href="${ adminChart }">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
        </div>

        <!-- Area Chart Example-->
        <div class="card mb-5">
          <div class="card-header">
            <i class="fas fa-chart-area"></i>
            당일 거래량</div>

          <div class="card-body">
             <div class="chart-area">
                    <canvas id="myAreaChart" style="display: block; height: 320px; width: 383px;" width="478" height="400" class="chartjs-render-monitor"></canvas></canvas>
             </div>
          </div>
          <div class="card-footer small text-muted">
          <%

 		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("최종 업데이트시간 yyyy-MM-dd HH:mm:ss");
 		String today = formatter.format(new java.util.Date());

 		out.println(today);

		%>
          
          
          </div>
        </div>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
          	<c:url var="noticeInsert" value="noticeInsertView.do"/>
          	
            <i class="fas fa-table"></i>
           	
           	<button  onclick="window.open('${noticeInsert}', 'regist', 'width=1000,height=600, left=400 top=100')">공지사항 작성</button>
           	
								
          </div>
          
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>No</th>
                    <th>제목</th>
                    <th>작성일</th> 
                    <th>조회수</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr>
                     <th>No</th>
                    <th>제목</th>
                    <th>작성일</th> 
                    <th>조회수</th>
                  </tr>
                </tfoot>
                <tbody>
                <c:forEach var="notice" items="${ list }">

                  <tr>
                  	<td>${ notice.nNo }</td>
                  	<td> 
                  		<c:url var="noticeDetail" value="noticeDetail.do">
								<c:param name="nNo" value="${ notice.nNo }"/>
								</c:url>
                  <a href="${noticeDetail}" style="color: black; text-decoration: none;">${ notice.nTitle }</a>
                  	</td>
                  	<td>${ notice.nDate }</td>  	
                  	<td>${ notice.nView }</td>
                  </tr>
                </c:forEach>
                  
                  
        
                </tbody>
              </table>
            </div>
            
          </div>
          <div class="card-footer small text-muted">
                    <%out.println(today);%>
      
    
    <div id="kakao-talk-channel-chat-button" data-channel-public-id="_xcLqmC" data-title="question" 
    data-size="large" data-color="yellow" data-shape="pc" data-support-multiple-densities="true">

    </div>
          	
          
          
          
          </div>
        </div>

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
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
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
  <script>
  var ctx = document.getElementById("myAreaChart");
  var arr = [];
  var i = 0;
  <c:forEach var="entry" items="${todayCount}" varStatus="status">
	arr[i] = "${entry.value}";
	i++;
</c:forEach>

  
  var myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13","14","15","16","17","18","19","20","21","22","23","24"],
      datasets: [{
        label: "총거래량",
        lineTension: 0.3,
        backgroundColor: "rgba(78, 115, 223, 0.05)",
        borderColor: "rgba(78, 115, 223, 1)",
        pointRadius: 3,
        pointBackgroundColor: "rgba(78, 115, 223, 1)",
        pointBorderColor: "rgba(78, 115, 223, 1)",
        pointHoverRadius: 3,
        pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
        pointHoverBorderColor: "rgba(78, 115, 223, 1)",
        pointHitRadius: 10,
        pointBorderWidth: 2,

       data: [arr[0], arr[1], arr[2], arr[3], arr[4], arr[5], arr[6], arr[7], arr[8], arr[9], arr[10], arr[11], arr[12],arr[13],arr[14],arr[15],arr[16],arr[17],arr[18],arr[19],arr[20],arr[21],arr[22],arr[23],arr[24]],
      }],
    },
    options: {
      maintainAspectRatio: false,
      layout: {
        padding: {
          left: 10,
          right: 25,
          top: 25,
          bottom: 0
        }
      },
      scales: {
        xAxes: [{
          time: {
            unit: 'date'
          },
          gridLines: {
            display: false,
            drawBorder: false
          },
          ticks: {
            maxTicksLimit: 7
          }
        }],
        yAxes: [{
          ticks: {
            maxTicksLimit: 5,
            padding: 10,
            // Include a dollar sign in the ticks
            callback: function(value, index, values) {
              return  number_format(value) + '건';
            }
          },
          gridLines: {
            color: "rgb(234, 236, 244)",
            zeroLineColor: "rgb(234, 236, 244)",
            drawBorder: false,
            borderDash: [2],
            zeroLineBorderDash: [2]
          }
        }],
      },
      legend: {
        display: false
      },
      tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#858796",
        titleMarginBottom: 10,
        titleFontColor: '#6e707e',
        titleFontSize: 14,
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        intersect: false,
        mode: 'index',
        caretPadding: 10,
        callbacks: {
          label: function(tooltipItem, chart) {
            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
            return datasetLabel + ': 건' + number_format(tooltipItem.yLabel);
          }
        }
      }
    }
  });
  </script>
  


</body>


</html>
