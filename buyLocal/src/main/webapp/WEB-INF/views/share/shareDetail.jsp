<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.mylocal.myL.share.model.vo.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
   table {
      margin:auto;
   }
    #rhead {
        background: gray;
    }
 .btn2{ 
      opacity:100;
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
    .deleteReply {
       color:red;
       font-weight: bold;
    }
    #replycss{
       font-weight:bold;
       color:white;
       background: rgb(91, 185, 223);
    }
</style>
</head>
<body>
    <c:import url="../common/menubar.jsp" />
        <section  class="page-title-area bg-image ptb--80" data-bg-image="assets/img/bg/1920X200.png">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <h1 class="page-title">나눔게시판 상세</h1>
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
            
            <table>
            <c:url var="sblist" value="shareboard.do">
            <c:param name="sbNo" value="${ sb.sbNo }"/>
            <c:param name="page" value="${ currentPage }"/>
         </c:url>
            <tr>
               <td><input type="hidden" name="sbNo" id="sbNo" value="${sb.sbNo }">
            </tr>
                <tr>
                    <td class="cssEfek">말머리</td>
                    <td>${sb.sbcgName }</td>
                </tr>
                <tr>
                    <td class="cssEfek">제목</td>
                    <td><input type="text" name="sbTitle" size="50" value=${sb.sbTitle } readonly></td>
                </tr>
                <tr>
                    <td class="cssEfek">작성자</td>
                    <td><input type="text" name="sbWriter" size="50"value=${sb.cName } readonly ></td>
                </tr>
                <tr>
                    <td class="cssEfek">내용</td>
                  <td width="1000" height="300"><textarea style="resize: none;" name="sbContent" id="sbContent" rows="10" cols="100" readonly>${sb.sbContent}</textarea></td>
                </tr>
                <tr>
                       <td class="cssEfek">업로드파일</td>
                      <td><img src="resources/shareuploadFiles/${sb.renameFileName}" width="200" height="200" alt="그림없음"></td>
                </tr>
                
                <tr>
                     <td colspan="2" align="center">
                        <c:url var="sbupView" value="shareUpdateForm.do">
                     <c:param name="sbNo" value="${sb.sbNo }"/>
                  </c:url>
                  
            <c:if test="${!empty loginUser }">
                  <c:if test="${loginUser.cNo eq sb.cNo}">
                <button type="button" class='btn2' onclick="location.href='${ sbupView}'">수정</button>
                <button type="button" class='btn2' onclick="location.href='shareDelete.do';">삭제</button>
                      </c:if>
                </c:if>
                <br><br>
                   </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="button" class='btn2' value="이전글"> &nbsp;
                        <button type="button" class='btn2' onclick="location.href='shareboard.do';">목록으로</button>
                        <input type="button" class='btn2' value="다음글"> &nbsp;
                    </td>
                </tr>
                </table>

   <table align="center">
      <br><br>
        <div id="rhead" align="center">댓글</div>
                <tr>
                    <td id="replycss">댓글작성</td>
                    <td><textarea style="resize: none;" id="rContent" cols="35" rows="3"></textarea></td>
                    <td><button type="button" class='btn2' id="rSubmit">댓글등록</button></td>
                </tr>
                
         <table id="replyTable">
                  <thead>
                     <tr>
                        <td colspan="4"> <b id='rCount'></b>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="3"><b id='rCount2'></b> </td>
                        
                     </tr>
                  </thead>
                  <tbody>
                     
                  </tbody>
               </table>
               
               <script>
               $(function() {
                  $(".hidecss").hide();
               });
               
               function reportView() {
                  if($("#reportBtn").text() == '신고 ▲')
                     $("#reportBtn").text('신고 ▼');
                  else
                     $("#reportBtn").text('신고 ▲');
                  $(".hidecss").toggle();
               }
               </script>
               
        
      
 <script>
       rNo = $(".rNo").val();
       refRno = $(".rNo").val();
       
       $(function(){
           // 초기 페이지 로딩 시 댓글 불러오기
           getReplyList();
           
           // 타 회원이 작성한 댓글도 지속적으로 불러오기 위한 요청
         
         // 댓글 등록 ajax
         $("#rSubmit").on("click", function(){
            // rNo = $('#rNo').val();
            var rContent = $("#rContent").val();
            var sbNo = ${ sb.sbNo };
            var rLevel = 0;
            $.ajax({
               url:"addReply.do",
               data:{rContent:rContent,
                      sbNo:sbNo,
                      rLevel:rLevel,
                      rNo:rNo},
               type:"post",
               success:function(data){
                  console.log(data);
                  if(data == 'success'){
                     // 댓글 등록 성공 시 다시 댓글 리스트 불러오기
                     getReplyList();
                     $("#rContent").val("");
                console.log(rNo); 
                  }
               },
               error:function(){
                  console.log('ajax 통신 실패!');
               }
            });
         });
           
      });
      
      //답글달기 버튼 클릭시 이벤트 
      function answerReply(e) {
         rrContent =$("<td>").html("<textarea style='resize: none' cols='50' rows='3' id='rrContent'></textarea>");
         
         rNo = $(e).next().next().val(); //답글달기 클릭시 해당 rNo가 몇번인지를 담는 전역변수
          console.log(rNo);
         
          refRno =  $(e).next().next().val();
          console.log("참조댓글 : "+refRno);
         
          
         $tr = $("<tr>");
            $cName = cName;
            $rContent = $("<td>").html("<textarea style='resize: none;' cols='50' rows='3' id='rrContent'></textarea>");
            $button = $("<td>").html("<button type='button' class='btn2' id='setReply' onclick='registerReply();'>답글등록</button>");
            $cencel = $("<td>").html("<button type='button' class='btn2' onclick='cancelEvent();'>취소</button>");
            $t = $("<td>").html("&nbsp");
            
           $tr.append($cName);
            $tr.append($rContent);
            $rContent.append($button);
            $rContent.append($t);
            $rContent.append($cencel);
         
            $(e).parent().parent().after($tr);
            
           $(".answerReply").prop("disabled", true);
                 
           position = $(e).parent().parent().after($tr);
      }
      
      function cancelEvent() {
         $("#rrContent").parent().parent().remove();
          $(".answerReply").prop("disabled", false);
            
      }
      
      // 같은 url요청을 답글달기 클릭시 insert 진행
      function registerReply() {
         var rContent = $("#rrContent").val();
         var sbNo = ${ sb.sbNo };
         var rLevel = 1;
         $.ajax({
                url:"addReply.do",
                data:{rContent:rContent,
                       sbNo:sbNo,
                       refRno:refRno,
                       rLevel:rLevel,
                       rNo:rNo},
                       type:"post",
                       success:function(data){
               console.log(data);
               
                    if(data == 'success'){
                  getReplyList();
                  $("#rrContent").val("");
                  console.log(rNo); 
                    }
                       },
                       error:function(){
                          console.log('ajax 통신 실패!');
                       }
                    });
         }
           
      
      
      // 댓글 리스트 불러오는 select하는 ajax 함수
         function getReplyList(){
            var sbNo = ${ sb.sbNo};
         
            $.ajax({
               url:"rList.do",
               data:{sbNo:sbNo,
                  rNo:rNo,
                  refRno:refRno},
               dataType:"json",
               success:function(data){
                  console.log(data);
                  
                  $tableBody = $("#replyTable tbody");
                  $tableBody.html("");
                  
                  $("#rCount").text("댓글(" + data.length+")");
                  
                  if(data.length >0){
                     for(var i in data){
                        
          /*  등록날짜기준 현재시간과 차이를 구하기위해서 사용했던것.
          var old = new Date("1/18/2020").toJSON();
         var now = new Date().toJSON();
         
         var sec_gap = (now-old) /1000;
         var min_gap = (now-old) /1000 / 60;
         
         console.log(old);
         console.log(now);
         console.log(sec_gap);
         console.log(min_gap);  
         
         2020/02/05 11시57분01초
         String from = data[i].rCreateDate
         SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
         Date to = transFormat.parse(from);
         
         Date from = new Date();
         SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
         String to = transFormat.format(from);
         */
         
                       /*  cName =   JSON.stringify($("<td width='100'>").text(data[i].cName)); */
                        /* cName =   $("<td id='hashid' width='100'>").text(data[i].cName); */
                        
                        $cName = $("<td width='120'>").text("└ Re : "+data[i].cName);
                        
                        $rContent = $("<td>").text(data[i].rContent);
                        
                        
                        pastTime = $("<td width='100'>").text(data[i].rCreateDate); // 경과시간을 위한 일단 현재시간을 전역변수에담음
                       
                        
                        
                         if(data[i].rLevel == "0") { 
                        $tr = $("<tr>");
                        $cName = $("<td width='100'>").text(data[i].cName);
                        $rContent = $("<td width='200'>").text(data[i].rContent);
                        $rCreateDate = $("<td width='230'>").text(data[i].rCreateDate);
                         $button = $("<td>").html("<button type='button' class='answerReply btn2' onclick='answerReply(this)'>답글달기</button>"
                               +"<input type='hidden' id='refRno' value='"+data[i].refRno+"'>" 
                               +"<input type='hidden' class='rNo' value='"+data[i].rNo+"'>"); 
                         
                         $delete = $("<td>").html("<button class='btn2' onclick='deletebtn(this);'>삭제</button>");
                         $br = $("<tr>");
                         $brtd = $("<td>").html("&nbsp");
                         
                         //$rNo = $("<td>").html("<input type='hidden' id='rNo'  value='"+data[i].rNo+"'>");
                  //       $test = $("<tr>")
                  //       $css = $("<td colspan='5' id='cssTest'>").text("답글이 없습니다.");
                         //$testDate = $("<td>").text(min_gap + "분 지남" + sec_gap+"초 지남");
                         
                         
                        $tr.append($cName);
                        
                            if(data[i].rLevel == "0" && data[i].rStatus == 'N') {
                               
                              $rContent2 = $("<td class='deleteReply' width='200'>").text("삭제된 댓글입니다.");
                              $tr.append($rContent2);
                            $tr.append($rCreateDate);
                                    
                           }else if(data[i].rLevel == "0" && data[i].rStatus == 'Y') {
                                     
                             $tr.append($rContent);
                             $tr.append($rCreateDate);
                             
                              $tr.append($button); 
                              
                      
                              var cNumber = data[i].cNo;
                              var str = String(cNumber);
                              var loginUsers = "${loginUser.cNo}";
                              console.log(loginUsers == str);
                             if(loginUsers==str){
                            $tr.append($delete);
                             }
                            
                              }
                         $br.append($brtd);
                         $tableBody.append($tr);
                         $tableBody.append($br);
                         
                      }
                        
                     for(var j in data){
                        cName = $("<td width='120'>").text("└ Re : 답글 ");
                        $rContent = $("<td>").text(data[j].rContent);
                     if(data[i].rNo == data[j].refRno && data[j].rLevel == "1") { 
                         $tr = $("<tr>");
                          $cName =  $("<td width='120'>").text("└ Re : "+data[j].cName);
                          $rContent = $("<td>").text(data[j].rContent);
                          $rCreateDate = $("<td width='230'>").text(data[j].rCreateDate);
                         $delete = $("<td>").html("<button class='btn2' onclick='deletebtn(this);'>삭제</button>"
                                              +"<input type='hidden' class='rNo' value='"+data[j].rNo+"'>"); 
                         
                         
                          $br = $("<tr>");
                         $brtd = $("<td>").html("&nbsp");
                         
                         
                               $tr.append($cName);
                               
                            if(data[j].rLevel == "1" && data[j].rStatus == 'N') {
                               
                              $rContent2 = $("<td class='deleteReply' width='200'>").text("삭제된 댓글입니다.");
                              $tr.append($rContent2);
                          
                            }else if(data[j].rLevel == "1" && data[j].rStatus == 'Y') {
                               
                             $tr.append($rContent);
                          
                           }
                          
                     $tr.append($rCreateDate);
                     
                     if(data[j].rStatus == 'Y') {
                        var cNumber = data[i].cNo;
                          var str = String(cNumber);
                          var loginUsers = "${loginUser.cNo}";
                          console.log(loginUsers == str);
                         if(loginUsers==str){
                         $tr.append($delete);
                         }
                     }
                       
                     $br.append($brtd); // <br>역할 한줄띄우기위함
                          
                     $tableBody.append($tr);
                     $tableBody.append($br);
                     }
                  }  
                     }
                  }else{
                     $tr = $("<tr>");
                     $rContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
                     $tr.append($rContent);
                     $tableBody.append($tr);
                  }
               },
               error:function(){
                  console.log("ajax 통신 실패!");
               }
            });
            
         }
      // 댓글삭제
      function deletebtn(e) {
          rNo =$(e).parent().parent().find(".rNo").val();
           var sbNo = ${ sb.sbNo};
            var rStatus = 'Y';
            console.log("rNo"+rNo);
         $.ajax({
            url:"rDelete.do",
            data:{sbNo:sbNo,
                 rNo:rNo,
                 refRno:refRno,
                 rStatus:rStatus},
            success:function(data){
                 if(data == "success"){
                    console.log(data);
                    getReplyList();
                       $(e).css("opacity","0");
               }
            },
              error:function(){
                     console.log("ajax 통신 실패!");
                  }
         });
      }
          </script>
 
<br><br><br><br><br><br>
          
         <c:import url="../common/footer.jsp"/> 
    </body>
</html>